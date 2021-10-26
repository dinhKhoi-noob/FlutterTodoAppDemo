import 'package:flutter/material.dart';
import './todo_app.dart';
//import './basic_layout_example.dart';
// import './external_library_example.dart';
// import './stateful_widget_example.dart';

// ignore: prefer_const_constructors
void main() {
  final _globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
  return runApp(MaterialApp(
      home: const TodoApp(),
      scaffoldMessengerKey: _globalMessengerKey));
}