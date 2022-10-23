import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ReleaseDetailsView extends HookWidget {
  final String id;

  final bool showBackButton;

  const ReleaseDetailsView(this.id, {this.showBackButton = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: showBackButton,
      ),
      body: Center(child: Text(id)),
    );
  }
}
