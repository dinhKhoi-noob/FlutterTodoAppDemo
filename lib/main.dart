import 'package:flutter/material.dart';
import './basic_layout_example.dart';
// import './external_library_example.dart';
// import './stateful_widget_example.dart';

// ignore: prefer_const_constructors
void main() {
  final _globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
  return runApp(MaterialApp(home: const BasicLayoutExample(),scaffoldMessengerKey: _globalMessengerKey));
}

