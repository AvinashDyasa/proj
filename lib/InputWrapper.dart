// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:proj/adminLogin/AdminLoginPage.dart';
import 'package:proj/newUser/nUser.dart';
import 'package:proj/forgotPassword/FPLoginPage.dart';

import 'Button.dart';
import 'InputField.dart';

class InputWrapper extends StatefulWidget {
  @override
  State<InputWrapper> createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
  final _textController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _validator = false;
  bool _pValidator = false;

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
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      errorText: _validator ? 'Email cannont be empty' : null,
                      errorBorder: _validator
                          ? OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red))
                          : OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                      labelText: "Enter your email",
                      labelStyle: _validator
                          ? TextStyle(color: Colors.red)
                          : TextStyle(color: Colors.blue),
                    ),
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
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      errorText:
                          _pValidator ? 'Password cannont be empty' : null,
                      errorBorder: _pValidator
                          ? OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red))
                          : OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                      labelText: "Enter your password",
                      labelStyle: _pValidator
                          ? TextStyle(color: Colors.red)
                          : TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
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
          ElevatedButton(
            onPressed: () {
              setState(() {
                _textController.text.isEmpty
                    ? _validator = true
                    : _validator = false;
                _passwordController.text.isEmpty
                    ? _pValidator = true
                    : _pValidator = false;
              });
            },
            child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
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
