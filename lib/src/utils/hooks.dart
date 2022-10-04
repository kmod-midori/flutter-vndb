import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

bool useIsMobileLayout() {
  final context = useContext();
  return MediaQuery.of(context).size.width < 600;
}
