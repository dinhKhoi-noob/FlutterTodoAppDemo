import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: use_key_in_widget_constructors
// ignore: must_be_immutable
class ExternalLibraryExample extends StatefulWidget {
  const ExternalLibraryExample({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _ExternalLibraryExample();
}

class _ExternalLibraryExample extends State<ExternalLibraryExample> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    final ButtonStyle raisedButtonStyled = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.grey[300],
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
    return MaterialApp(
        title: "Welcome to Flutter",
        home: Scaffold(
            appBar: AppBar(title: const Text("External library example")),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // ignore: avoid_unnecessary_containers
                  ElevatedButton(
                    onPressed: null,
                    child: const Text("Pick a date"),
                    style: raisedButtonStyled,
                  ),
                  // ignore: prefer_const_constructors
                  Text(
                    DateFormat.yMMMd().format(DateTime.now()),
                    style: const TextStyle(color: Colors.red),
                  )
                ],
              ),
            )));
  }
}
