import 'package:flutter/material.dart';
import 'email.dart';

// ignore: must_be_immutable
class EmailListWidget extends StatelessWidget {
  List<Email> emails = <Email>[];
  EmailListWidget({Key? key, required this.emails}) : super(key: key);
  ListView _mapEmailList() {
    return ListView.builder(
      itemCount: emails.length,
      itemBuilder: (context, index) {
        return Card(
            color: index % 2 == 0 ? Colors.redAccent : Colors.lightBlue,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ListTile(
              title: Text("Email: ${emails[index].email}",
                  style: const TextStyle(color: Colors.white)),
              // ignore: prefer_const_constructors
              leading: Icon(
                Icons.email,
                color: Colors.white,
              ),
              subtitle: const Text("This is your email contact",
                  style: TextStyle(color: Colors.white)),
              onTap: () {},
            )
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: this._mapEmailList()
    );
  }
}
