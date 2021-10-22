import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
// ignore: must_be_immutable
class StatefulWidgetExample extends StatefulWidget {
  String? name;
  String? age;
  StatefulWidgetExample(Map<dynamic, Object> map,
      {Key? key, this.name, this.age})
      : super(key: key);
  @override
  State<StatefulWidgetExample> createState() => _StatefulWidgetExample();
}

class _StatefulWidgetExample extends State<StatefulWidgetExample>
    with WidgetsBindingObserver {
  String _email = "";
  final emailEditingController = TextEditingController();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    print("Init state");
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    print("Dispose");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print("App pausing");
    } else if (state == AppLifecycleState.resumed) {
      print("App running");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to todo app flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('This is the stateful widget title'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          // ignore: avoid_unnecessary_containers
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              // ignore: prefer_const_constructors
              child: TextField(
                controller: emailEditingController,
                onChanged: (text) {
                  setState(() {
                    _email = text;
                  });
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'Enter your email'),
              )),
          Text(
            'Your email${_email.isEmpty ? "" : " is $_email"}',
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ]),
      ),
    );
  }
}
