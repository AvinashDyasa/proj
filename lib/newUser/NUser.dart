// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:proj/Button.dart';
import 'package:proj/homepage/homePage.dart';

import '../Header.dart';

class UserForm extends StatefulWidget {
  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  @override
  String dropdownvalue = "Owner";
  var items = ['Owner', 'Admin'];
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
            Header(
              isNewUser: true,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    )),
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Name'),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Email'),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Society Name'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DropdownButton(
                          value: dropdownvalue,
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Wing'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Flat no.'),
                        ),
                        Button(isNewUser: true),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
