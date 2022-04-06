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
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _societyNameContoller = TextEditingController();
  TextEditingController _wingController = TextEditingController();
  TextEditingController _flatNoController = TextEditingController();

  bool _autoValidator = false;

  static String validateEmptyField(
      {required String text, required String fieldName}) {
    return text.isEmpty ? "$fieldName cannot be empty" : "";
  }

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
                    autovalidateMode: _autoValidator
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: SingleChildScrollView(
                      child: Expanded(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _firstNameController,
                              validator: (val) {
                                return validateEmptyField(
                                    fieldName: "First Name",
                                    text: _firstNameController.text);
                              },
                              decoration: const InputDecoration(
                                  labelText: 'First Name'),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: _lastNameController,
                              validator: (val) {
                                return validateEmptyField(
                                    fieldName: "Last Name",
                                    text: _firstNameController.text);
                              },
                              decoration:
                                  const InputDecoration(labelText: 'Last Name'),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: _emailController,
                              validator: (val) {
                                if (!RegExp(
                                        '^[a-zA-z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]')
                                    .hasMatch(val!)) {
                                  return ('Please enter a valid email');
                                }
                                return validateEmptyField(
                                    fieldName: "Email",
                                    text: _firstNameController.text);
                              },
                              decoration:
                                  const InputDecoration(labelText: 'Email'),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              obscureText: true,
                              controller: _passwordController,
                              validator: (val) {
                                RegExp regex = new RegExp(r'^.{6,}$');
                                if (!regex.hasMatch(val!)) {
                                  return ("Please enter valid password(Min. 6 Char. long)");
                                }
                                return validateEmptyField(
                                    fieldName: "Password",
                                    text: _firstNameController.text);
                              },
                              decoration:
                                  const InputDecoration(labelText: 'Password'),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: _societyNameContoller,
                              validator: (val) {
                                return validateEmptyField(
                                    fieldName: "Society Name",
                                    text: _firstNameController.text);
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Society Name'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              child: DropdownButton(
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
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _wingController,
                              validator: (val) {
                                return validateEmptyField(
                                    fieldName: "Wing",
                                    text: _firstNameController.text);
                              },
                              decoration:
                                  const InputDecoration(labelText: 'Wing'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _flatNoController,
                              validator: (val) {
                                return validateEmptyField(
                                    fieldName: "Flat no.",
                                    text: _firstNameController.text);
                              },
                              decoration:
                                  const InputDecoration(labelText: 'Flat no.'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _autoValidator = true;
                                });
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
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
