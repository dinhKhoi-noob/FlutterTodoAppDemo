import 'package:flutter/material.dart';

class BasicLayoutExample extends StatefulWidget {
  const BasicLayoutExample({Key? key}) : super(key: key);
  @override
  State<BasicLayoutExample> createState() {
    return _BasicLayoutExample();
  }
}

class _BasicLayoutExample extends State<BasicLayoutExample> {
  String email = "";
  final onChangedEmailField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Flutter",
      home: Scaffold(
        appBar: AppBar(title: const Text("Basic layout example"),),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    controller: onChangedEmailField,
                    onChanged: (text) {
                      // ignore: unused_local_variable
                      RegExp sampleEmail = RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                      setState(() {
                        email = sampleEmail.hasMatch(text)?"Yes":"No";
                      });
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        labelText: 'Enter your email'
                    ),
                  ),
                ),
              TextButton(
                onPressed: (){

                },
                child: const Text("Submit"),
              ),
              // ignore: prefer_const_constructors
              Text("This is your email checking result: $email"),
            ]),
          )
        )
      ),
    );
  }
}
