import 'package:flutter/material.dart';
import 'email.dart';

// ignore: must_be_immutable
class EmailListWidget extends StatelessWidget {
  List<Email> emails = <Email>[];
  EmailListWidget({Key? key, required this.emails}) : super(key: key);
  List<Widget> _mapEmailList() {
    int index = 0;
    return emails.map((element) {
      index++;
      return Card(
          color: index % 2 == 0 ? Colors.redAccent : Colors.lightBlue,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("Email: ${element.email}",
                style: const TextStyle(color: Colors.white)),
            // ignore: prefer_const_constructors
            leading: Icon(
              Icons.email,
              color: Colors.white,
            ),
            subtitle: const Text("This is your email contact",
                style: TextStyle(color: Colors.white)),
            onTap: () {},
          ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: _mapEmailList());
  }
}
