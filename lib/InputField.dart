import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200),
            ),
          ),
          child: TextField(
            decoration: InputDecoration(
                labelText: "Enter your email",
                labelStyle: TextStyle(color: Colors.grey.shade400),
                border: InputBorder.none),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200),
            ),
          ),
          child: TextField(
            decoration: InputDecoration(
                labelText: "Enter your password",
                labelStyle: TextStyle(color: Colors.grey.shade400),
                border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
