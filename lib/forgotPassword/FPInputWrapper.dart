// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../Button.dart';
import 'FPInputField.dart';

class InputWrapper extends StatefulWidget {
  @override
  State<InputWrapper> createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
  final _textController = TextEditingController();

  final _passwordController = TextEditingController();
  final _rePassController = TextEditingController();

  bool _validator = false;

  bool _pValidator = false;
  bool _pRValidator = false;

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
                errorText: _pRValidator ? 'Password cannont be empty' : null,
                errorBorder: _pRValidator
                    ? OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))
                    : OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                labelText: "Re-Enter your password",
                labelStyle: _pRValidator
                    ? TextStyle(color: Colors.red)
                    : TextStyle(color: Colors.blue),
              ),
            ),
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
                _rePassController.text.isEmpty
                    ? _pRValidator = true
                    : _pRValidator = false;
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
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _passwordController.dispose();
    _rePassController.dispose();
  }
}
