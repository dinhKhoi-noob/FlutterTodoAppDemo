import 'package:flutter/material.dart';
import './email.dart';
import './email_list_widget.dart';

class BasicLayoutExample extends StatefulWidget {
  const BasicLayoutExample({Key? key}) : super(key: key);
  @override
  State<BasicLayoutExample> createState() {
    return _BasicLayoutExample();
  }
}

class _BasicLayoutExample extends State<BasicLayoutExample> {
  String _emailChecker = "";
  Email newEmail = Email(email: "");
  final List<Email> _emails = <Email>[];
  final _onChangedEmailField = TextEditingController();
  final _globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _globalMessengerKey,
      title: "Welcome to Flutter",
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Basic layout example"),
          ),
          body: SafeArea(
              child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextField(
                      controller: _onChangedEmailField,
                      onChanged: (text) {
                        // ignore: unused_local_variable
                        RegExp sampleEmail = RegExp(
                            r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                        setState(() {
                          _emailChecker =
                              sampleEmail.hasMatch(text) ? "Valid" : "Invalid";
                          newEmail.email = text;
                        });
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelText: 'Enter your email'),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      if (_emailChecker.compareTo("Valid") != 0) {
                        _globalMessengerKey.currentState!.showSnackBar(SnackBar(
                            content: Text("Your email is $_emailChecker",
                                textAlign: TextAlign.center)));
                        return;
                      }
                      setState(() {
                        _emails.add(newEmail);
                        newEmail = Email(email: "");
                        _onChangedEmailField.text = "";
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        primary: Colors.white70,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        backgroundColor: Colors.blue,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    child: const Text("Submit"),
                  ),
                  EmailListWidget(emails: _emails)
                ]),
          ))),
    );
  }
}
