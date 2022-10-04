import 'package:flt_vndb/src/settings/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ApiSettingsDialog extends HookWidget {
  final ApiConfig initialValue;

  const ApiSettingsDialog({
    required this.initialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>(), const []);

    String? savedAddress;

    final addressField = TextFormField(
      initialValue: initialValue.address,
      decoration: const InputDecoration(
        hintText: 'Address',
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an address';
        }
        return null;
      },
      onSaved: (newValue) {
        savedAddress = newValue;
      },
    );

    int? savedPort;

    final portField = TextFormField(
      initialValue: initialValue.port.toString(),
      decoration: const InputDecoration(
        hintText: 'Port',
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a port number';
        }

        try {
          final int port = int.parse(value);
          if (port < 0 || port > 65535) {
            return 'Please enter a valid port number (0-65535)';
          }
        } catch (e) {
          return 'Please enter a valid port number';
        }

        return null;
      },
      onSaved: (newValue) {
        if (newValue != null) {
          savedPort = int.parse(newValue);
        }
      },
    );

    final useTls = useState(initialValue.useTls);

    final form = Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          addressField,
          portField,
          const SizedBox(height: 8.0),
          CheckboxListTile(
            value: useTls.value,
            onChanged: (value) {
              useTls.value = value ?? false;
            },
            title: Text('Use TLS'),
          ),
        ],
      ),
    );

    return AlertDialog(
      title: Text('API Settings'),
      content: SizedBox(
        width: 300,
        height: 300,
        child: form,
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              Navigator.of(context).pop(
                ApiConfig(
                    address: savedAddress!,
                    port: savedPort!,
                    useTls: useTls.value),
              );
            }
          },
          child: Text(MaterialLocalizations.of(context).okButtonLabel),
        )
      ],
    );
  }
}
