// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Header.dart';
import 'InputWrapper.dart';

class LoginPage extends StatelessWidget {
  //final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.cyan.shade500,
            Colors.cyan.shade300,
            Colors.cyan.shade400,
          ]),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Header(),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )),
              child: InputWrapper(),
            ))
          ],
        ),
      ),
    );
  }
}
