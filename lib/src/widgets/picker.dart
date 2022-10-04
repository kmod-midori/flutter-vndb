import 'package:flt_vndb/src/data/languages.dart';
import 'package:flt_vndb/src/data/platforms.dart';
import 'package:flt_vndb/src/widgets/language_row.dart';
import 'package:flt_vndb/src/widgets/platform_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PickerItem<T> {
  final T value;
  final Widget label;

  const PickerItem({required this.value, required this.label});
}

class _Picker<T> extends StatelessWidget {
  final List<T> selectedValues;

  final List<PickerItem<T>> items;

  final void Function(T value, bool selected) onSelectionChanged;

  const _Picker({
    required this.items,
    required this.selectedValues,
    required this.onSelectionChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final cards = items.map((item) {
      final selected = selectedValues.contains(item.value);

      return Card(
        color: selected ? theme.colorScheme.primary : null,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: item.label,
          ),
          onTap: () {
            onSelectionChanged(item.value, !selected);
          },
        ),
      );
    }).toList();

    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4.5,
      ),
      children: cards,
    );
  }
}

class PickerDialog<T> extends HookWidget {
  final Widget? title;

  final List<PickerItem<T>> items;

  final List<T> initialSelection;

  final bool multiple;

  final bool allowEmpty;

  const PickerDialog({
    required this.items,
    required this.initialSelection,
    this.title,
    this.multiple = true,
    this.allowEmpty = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final selection = useState(initialSelection);

    return AlertDialog(
      // title: Text(multiple ? "Select languages" : "Select language"),
      title: title,
      content: SizedBox(
        height: 500,
        width: 400,
        child: _Picker<T>(
          items: items,
          selectedValues: selection.value,
          onSelectionChanged: (value, selected) {
            if (multiple) {
              if (selected) {
                selection.value.add(value);
              } else {
                if (allowEmpty || selection.value.length > 1) {
                  selection.value.remove(value);
                }
              }
              // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
              selection.notifyListeners();
            } else {
              if (selected) {
                selection.value = [value];
              }
            }
          },
        ),
      ),
      actions: <Widget>[
        if (allowEmpty)
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text("Clear"),
            onPressed: () {
              selection.value = [];
            },
          ),
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
          onPressed: (allowEmpty || selection.value.isNotEmpty)
              ? () {
                  Navigator.of(context).pop(selection.value);
                }
              : null,
          child: Text(MaterialLocalizations.of(context).okButtonLabel),
        ),
      ],
    );
  }

  static Future<List<T>?> show<T>({
    required BuildContext context,
    required List<PickerItem<T>> items,
    required List<T> initialSelection,
    Widget? title,
    bool multiple = true,
    bool allowEmpty = true,
  }) {
    return showDialog<List<T>?>(
      context: context,
      builder: (context) {
        return PickerDialog(
          items: items,
          initialSelection: initialSelection,
          multiple: multiple,
          allowEmpty: allowEmpty,
        );
      },
    );
  }
}

Future<List<String>?> showLanguagePickerDialog(
  BuildContext context,
  List<String> initialCodes, {
  bool multiple = true,
  bool allowEmpty = true,
}) {
  final items = recognizedLanguages.entries.map((entry) {
    return PickerItem(
      value: entry.key,
      label: Row(
        children: <Widget>[
          LanguageIcon(code: entry.key),
          const SizedBox(width: 4.0),
          Text(entry.value)
        ],
      ),
    );
  }).toList();

  return PickerDialog.show<String>(
    context: context,
    items: items,
    initialSelection: initialCodes,
    multiple: multiple,
    allowEmpty: allowEmpty,
  );
}

Future<List<String>?> showPlatformPickerDialog(
  BuildContext context,
  List<String> initialCodes, {
  bool multiple = true,
  bool allowEmpty = true,
}) {
  final items = recognizedPlatforms.entries.map((entry) {
    return PickerItem(
      value: entry.key,
      label: Row(
        children: <Widget>[
          PlatformIcon(code: entry.key),
          const SizedBox(width: 4.0),
          Text(entry.value)
        ],
      ),
    );
  }).toList();

  return PickerDialog.show<String>(
    context: context,
    items: items,
    initialSelection: initialCodes,
    multiple: multiple,
    allowEmpty: allowEmpty,
  );
}
