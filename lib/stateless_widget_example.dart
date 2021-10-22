import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
// ignore: must_be_immutable
class StatelessWidgetExample extends StatelessWidget {
  String? name;
  int? age;
  StatelessWidgetExample({Key? key, required this.age, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Welcome Khoi to Flutter"),
          ),
          body: Center(
              child: Text("Hello $name",
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)))),
    );
  }
}