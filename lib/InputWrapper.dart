import 'package:flutter/material.dart';
import 'package:proj/adminLogin/AdminLoginPage.dart';
import 'package:proj/newUser/nUser.dart';
import 'package:proj/forgotPassword/FPLoginPage.dart';

import 'Button.dart';
import 'InputField.dart';

class InputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          // ignore: prefer_const_constructors
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: InputField(),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            child: const Text('Forgot Password'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FPLoginPage(),
                ),
              );
            },
          ),
          SizedBox(
            height: 20,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserForm(),
                      ),
                    );
                  },
                ),
                // ignore: prefer_const_constructors
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
                        builder: (context) => AdminLoginPage(),
                      ),
                    );
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
