import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

PagingController<PageKeyType, ItemType>
    usePagingController<PageKeyType, ItemType>({
  required PageKeyType firstPageKey,
  List<Object?>? keys,
}) {
  final hook = _PagingControllerHook<PageKeyType, ItemType>(
      firstPageKey: firstPageKey, keys: keys);
  return use(hook);
}

class _PagingControllerHook<PageKeyType, ItemType>
    extends Hook<PagingController<PageKeyType, ItemType>> {
  const _PagingControllerHook({
    required this.firstPageKey,
    List<Object?>? keys,
  }) : super(keys: keys);

  final PageKeyType firstPageKey;

  @override
  _PagingControllerHookState<PageKeyType, ItemType> createState() {
    return _PagingControllerHookState();
  }
}

class _PagingControllerHookState<PageKeyType, ItemType> extends HookState<
    PagingController<PageKeyType, ItemType>,
    _PagingControllerHook<PageKeyType, ItemType>> {
  late final controller =
      PagingController<PageKeyType, ItemType>(firstPageKey: hook.firstPageKey);

  @override
  PagingController<PageKeyType, ItemType> build(BuildContext context) =>
      controller;

  @override
  void dispose() {
    controller.dispose();
  }

  @override
  String? get debugLabel => "usePagingController";
}
