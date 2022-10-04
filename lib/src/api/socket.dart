import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:mutex/mutex.dart';

class VndbSocket {
  static final log = Logger("VndbSocket");

  final String host;
  final int port;
  final bool useTls;

  VndbSocket({
    required this.host,
    required this.port,
    required this.useTls,
  });

  // static const apiHost = '127.0.0.1';
  // static const apiPort = 19534;
  // static const apiPortTls = 19535;

  Socket? _socket;
  StreamSubscription? _socketSubscription;

  final _lock = Mutex();

  Completer<String>? _rxCompleter;

  _setupSocket(Socket socket) {
    // Close the old socket if it exists
    close();

    final buffer = <int>[]; // buffer for incoming data

    _socketSubscription = socket.listen((data) {
      buffer.addAll(data);
      final eotIndex = buffer.indexOf(0x04); // 4 is the EOT character
      if (eotIndex != -1) {
        // decode message
        final message = utf8.decode(buffer.sublist(0, eotIndex));
        // remove the message and EOT
        buffer.removeRange(0, eotIndex + 1);

        // complete the completer
        if (_rxCompleter != null) {
          _rxCompleter!.complete(message);
          _rxCompleter = null;
        } else {
          log.warning("No completer for message: $message");
        }
      }
    }, onError: (err) {
      log.warning("Stream failed: $err, disconnecting");

      if (_rxCompleter != null) {
        _rxCompleter!.completeError(err);
        _rxCompleter = null;
      }

      close();
    }, onDone: () {
      log.warning("Stream closed, disconnecting");

      if (_rxCompleter != null) {
        _rxCompleter!.completeError(Exception("Socket closed"));
        _rxCompleter = null;
      }

      close();
    }, cancelOnError: true);

    _socket = socket;
  }

  Future<String> _transact(String message) async {
    assert(_rxCompleter == null);

    _rxCompleter = Completer<String>();

    _socket!.add(utf8.encode(message));
    _socket!.add([0x04]); // EOT
    await _socket!.flush();

    return await _rxCompleter!.future;
  }

  Future<String> _transactWithTimeout(String message) async {
    return _transact(message).timeout(
      const Duration(seconds: 10),
      onTimeout: () => Future.error(Exception("API transaction timeout")),
    );
  }

  /// This should be locked.
  Future<void> _ensureSocketAndLogin() async {
    if (_socket != null) {
      return;
    }

    log.info("Connecting to $host:$port (TLS: $useTls)");
    Socket socket;
    if (useTls) {
      socket = await SecureSocket.connect(host, port).timeout(
        const Duration(seconds: 5),
        onTimeout: () => Future.error(Exception("Connection timeout")),
      );
    } else {
      socket = await Socket.connect(host, port).timeout(
        const Duration(seconds: 5),
        onTimeout: () => Future.error(Exception("Connection timeout")),
      );
    }
    log.info("Connected to $host:$port");
    _setupSocket(socket);

    // Log in
    final response = await _transactWithTimeout(
      'login {"protocol":1,"client":"flt-vndb","clientver":"1.0"}',
    );
    log.info("Login response: $response");
  }

  Future<String> transact(String message) {
    return _lock.protect(() async {
      try {
        await _ensureSocketAndLogin();
        return await _transactWithTimeout(message);
      } catch (err) {
        log.warning("Error during transaction: $err, disconnecting");
        _rxCompleter = null;
        close();
        rethrow;
      }
    });
  }

  close() {
    _socketSubscription?.cancel();
    _socketSubscription = null;
    _socket?.close();
    _socket = null;
  }
}
