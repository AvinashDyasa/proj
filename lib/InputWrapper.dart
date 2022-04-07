// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proj/adminLogin/AdminLoginPage.dart';
import 'package:proj/homePage/HomePage.dart';
import 'package:proj/newUser/nUser.dart';
import 'package:proj/forgotPassword/FPLoginPage.dart';

class InputWrapper extends StatefulWidget {
  @override
  State<InputWrapper> createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? errorMessage;

  // bool _validator = false;
  // bool _pValidator = false;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (val) {
        _emailController.text = val!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        hintText: "Email",
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: _passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (val) {
        _passwordController.text = val!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
      ),
    );
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(_emailController.text, _passwordController.text);
          },
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return Padding(
        padding: EdgeInsets.all(30),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        emailField,
                        SizedBox(height: 25),
                        passwordField,
                        SizedBox(height: 35),
                        loginButton,
                        SizedBox(height: 15),
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
                        SizedBox(height: 15),
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
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Homepage())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}

  // return Padding(
  //   padding: EdgeInsets.all(30),
  //   child: Column(
  //     children: <Widget>[
  //       // ignore: prefer_const_constructors
  //       SizedBox(
  //         height: 40,
  //       ),
  //       Container(
  //         decoration: BoxDecoration(
  //             color: Colors.white, borderRadius: BorderRadius.circular(10)),
  //         child: Column(
  //           children: <Widget>[
  //             Container(
  //               padding: EdgeInsets.all(10),
  //               decoration: BoxDecoration(
  //                 border: Border(
  //                   bottom: BorderSide(color: Colors.grey.shade200),
  //                 ),
  //               ),
  //               child: TextFormField(
  //                 controller: _textController,
  //                 onSaved: (val) {
  //                   _textController.text = val!;
  //                 },
  //                 decoration: InputDecoration(
  //                   border: const OutlineInputBorder(),
  //                   errorText: _validator ? 'Email cannont be empty' : null,
  //                   errorBorder: _validator
  //                       ? OutlineInputBorder(
  //                           borderSide: BorderSide(color: Colors.red))
  //                       : OutlineInputBorder(
  //                           borderSide: BorderSide(color: Colors.grey)),
  //                   labelText: "Enter your email",
  //                   labelStyle: _validator
  //                       ? TextStyle(color: Colors.red)
  //                       : TextStyle(color: Colors.blue),
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               padding: EdgeInsets.all(10),
  //               decoration: BoxDecoration(
  //                 border: Border(
  //                   bottom: BorderSide(color: Colors.grey.shade200),
  //                 ),
  //               ),
  //               child: TextFormField(
  //                 controller: _passwordController,
  //                 onSaved: (val) {
  //                   _passwordController.text = val!;
  //                 },
  //                 decoration: InputDecoration(
  //                   border: const OutlineInputBorder(),
  //                   errorText:
  //                       _pValidator ? 'Password cannont be empty' : null,
  //                   errorBorder: _pValidator
  //                       ? OutlineInputBorder(
  //                           borderSide: BorderSide(color: Colors.red))
  //                       : OutlineInputBorder(
  //                           borderSide: BorderSide(color: Colors.grey)),
  //                   labelText: "Enter your password",
  //                   labelStyle: _pValidator
  //                       ? TextStyle(color: Colors.red)
  //                       : TextStyle(color: Colors.blue),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       TextButton(
  //         child: const Text('Forgot Password'),
  //         onPressed: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => FPLoginPage(),
  //             ),
  //           );
  //         },
  //       ),
  //       SizedBox(
  //         height: 20,
  //       ),
  //       ElevatedButton(
  //         onPressed: () {
  //           setState(() {
  //             _textController.text.isEmpty
  //                 ? _validator = true
  //                 : _validator = false;
  //             _passwordController.text.isEmpty
  //                 ? _pValidator = true
  //                 : _pValidator = false;
  //           });
  //           signIn(_textController.text, _passwordController.text);
  //         },
  //         child: Text(
  //           "Login",
  //           style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 15,
  //               fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //       SizedBox(
  //         height: 40,
  //       ),
  //       IntrinsicHeight(
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             TextButton(
  //               child: Text('New User'),
  //               onPressed: () {
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) => UserForm(),
  //                   ),
  //                 );
  //               },
  //             ),
  //             // ignore: prefer_const_constructors
  //             VerticalDivider(
  //               thickness: 1,
  //               color: Colors.black,
  //             ),
  //             TextButton(
  //               child: Text('Admin Login'),
  //               onPressed: () {
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) => AdminLoginPage(),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ],
  //         ),
  //       )
  //     ],
  //   ),
  // );
// }

  // void signIn(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     await _auth
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         .then((uid) => {
  //               Fluttertoast.showToast(msg: "Login Succesful"),
  //               Navigator.of(context).pushReplacement(
  //                 MaterialPageRoute(builder: ((context) => Homepage())),
  //               ),
  //             })
  //         .catchError((e) {
  //       Fluttertoast.showToast(msg: e!.message);
  //     });
  //   }
  // }
// }
