import 'package:flutter/material.dart';
import 'package:proj/adminLogin/AdminLoginPage.dart';
import 'package:proj/newUser/nUser.dart';

import 'Button.dart';
import 'InputField.dart';


class InputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: InputField(),
          ),
          SizedBox(
            height: 40,
          ),
          Button(),
          SizedBox(
            height: 40,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Text('New User'),
                  onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserForm()));},
                ),
                VerticalDivider(
                  thickness: 1,
                  color: Colors.black,
                ),
                TextButton(
                  child: Text('Admin Login'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminLoginPage()));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
