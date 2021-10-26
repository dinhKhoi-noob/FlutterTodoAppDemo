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
  Future<void> _showEmailModal(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {  
          return AlertDialog(
            title: const Text("Email dialog"),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            content: Container(
              constraints: const BoxConstraints(maxHeight: 100),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
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
                  ],
                ),
              ),
            ),
            actions: [
              OutlinedButton(
                onPressed: () {
                  if (_emailChecker.compareTo("Valid") != 0) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Your email is $_emailChecker",
                            textAlign: TextAlign.center)));
                    return;
                  }
                  Navigator.of(context).pop();
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
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                child: const Text("Submit"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Email List"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                await _showEmailModal(context);
              },
            )
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
              EmailListWidget(emails: _emails)
            ]))));
  }
}
