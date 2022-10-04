import 'dart:async';
import 'dart:convert';

import 'package:flt_vndb/src/api/release.dart';
import 'package:flt_vndb/src/api/response.dart';
import 'package:flt_vndb/src/api/socket.dart';
import 'package:flt_vndb/src/api/vn.dart';
import 'package:flt_vndb/src/settings/settings_service.dart';
import 'package:logging/logging.dart';
import 'package:quiver/cache.dart';
import 'package:tuple/tuple.dart';

enum GetType { vn, release }

enum VnFlag {
  basic,
  details,
  titles,
  relations,
  tags,
  stats,
  screens,
  staff,
  anime
}

enum VnSort { id, title, released, popularity, rating, votecount }

enum ReleaseFlag { basic, details, lang, vn, producers, links }

enum ReleaseSort { id, title, released }

Tuple2<String, String?> splitResponse(String message) {
  final index = message.indexOf(' ');

  if (index == -1) {
    return Tuple2(message, null);
  } else {
    return Tuple2(message.substring(0, index), message.substring(index + 1));
  }
}

class VndbApi {
  static final log = Logger("VndbApi");

  Future? currentTask;
  VndbSocket? socket;

  final getCommandCache = MapCache<int, GetResponse>.lru(maximumSize: 100);

  configure(ApiConfig config) {
    socket?.close();
    socket = VndbSocket(
      host: config.address,
      port: config.port,
      useTls: config.useTls,
    );
  }

  Future<void> dbstats() async {
    final response = await socket!.transact("dbstats");
    print(response);
  }

  Future<GetResponse> getData<T>(
    GetType type,
    List<String> flags,
    String filter, {
    int? page,
    int? results,
    String? sort,
    bool? reverse,
    bool bypassCache = false,
  }) async {
    assert(flags.isNotEmpty);
    var flagsStr = flags.join(",");

    final options = <String, dynamic>{};
    if (page != null) options["page"] = page;
    if (results != null) options["results"] = results;
    if (sort != null) options["sort"] = sort;
    if (reverse != null) options["reverse"] = reverse;

    final request =
        "get ${type.name} $flagsStr $filter ${json.encode(options)}";
    final cacheKey = request.hashCode;

    if (!bypassCache) {
      final cachedValue = await getCommandCache.get(cacheKey);
      if (cachedValue != null) {
        log.info("Cache hit for $request");
        return cachedValue;
      }
    }

    log.info("Sending request: $request");
    final response = splitResponse(await socket!.transact(request));
    // log.info("Got response: $response");

    if (response.item1 == "results") {
      final getResponse = GetResponse.fromJson(
        json.decode(response.item2!),
      );

      await getCommandCache.set(cacheKey, getResponse);

      return getResponse;
    } else {
      throw Exception("Unexpected response: $response");
    }
  }

  Future<ItemList<VisualNovel>> getVn(List<VnFlag> flags, String filter,
      {int? page, int? results, VnSort? sort, bool? reverse}) async {
    final strFlags = flags.map((e) => e.name).toList();
    final response = await getData(GetType.vn, strFlags, filter,
        page: page, results: results, sort: sort?.name, reverse: reverse);
    return response.toItemList(VisualNovel.fromJson);
  }

  Future<ItemList<Release>> getRelease(List<ReleaseFlag> flags, String filter,
      {int? page, int? results, ReleaseSort? sort, bool? reverse}) async {
    final strFlags = flags.map((e) => e.name).toList();
    final response = await getData(GetType.release, strFlags, filter,
        page: page, results: results, sort: sort?.name, reverse: reverse);
    return response.toItemList(Release.fromJson);
  }
}

final vndbApi = VndbApi();
