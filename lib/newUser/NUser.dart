// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proj/homePage/HomePage.dart';

import '../Header.dart';
import 'NUserModel.dart';

class UserForm extends StatefulWidget {
  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _societyNameContoller = TextEditingController();
  final TextEditingController _wingController = TextEditingController();
  final TextEditingController _flatNoController = TextEditingController();

  @override
  String dropdownvalue = "Owner";
  var items = ['Owner', 'Admin'];
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      autofocus: false,
      controller: _firstNameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        _firstNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final lastNameField = TextFormField(
      autofocus: false,
      controller: _lastNameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Last Name cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        _lastNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Last Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
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
      onSaved: (value) {
        _emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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
      onSaved: (value) {
        _passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: _confirmPasswordController,
      obscureText: true,
      validator: (value) {
        if (_confirmPasswordController.text != _passwordController.text) {
          return "Password don't match";
        }
        return null;
      },
      onSaved: (value) {
        _confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final societyNmaeField = TextFormField(
      autofocus: false,
      controller: _societyNameContoller,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Socity Name cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        _societyNameContoller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.business),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Society Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final wingField = TextFormField(
      autofocus: false,
      controller: _wingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Wing cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        _wingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.cabin),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Wing/Block",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final flatNumberField = TextFormField(
      autofocus: false,
      controller: _flatNoController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Flat no. cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        _flatNoController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.home),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Flat Number",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signUp(_emailController.text, _passwordController.text);
          },
          child: Text(
            "SignUp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    final userType = DropdownButton(
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
        });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
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
                    child: SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 0,
                                ),
                                SizedBox(height: 45),
                                firstNameField,
                                SizedBox(height: 20),
                                lastNameField,
                                SizedBox(height: 20),
                                emailField,
                                SizedBox(height: 20),
                                passwordField,
                                SizedBox(height: 20),
                                confirmPasswordField,
                                SizedBox(height: 20),
                                societyNmaeField,
                                SizedBox(height: 20),
                                userType,
                                SizedBox(height: 20),
                                if (dropdownvalue == 'Admin')
                                  Container()
                                else ...[
                                  wingField,
                                  SizedBox(height: 20),
                                  flatNumberField,
                                  SizedBox(height: 20),
                                ],
                                signUpButton,
                                SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = _firstNameController.text;
    userModel.lastName = _lastNameController.text;
    userModel.societyName = _societyNameContoller.text;
    userModel.userType = dropdownvalue;
    userModel.wing = _wingController.text;
    userModel.flatNo = _flatNoController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => Homepage()), (route) => false);
  }
}
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(begin: Alignment.topCenter, colors: [
//             Colors.cyan.shade500,
//             Colors.cyan.shade300,
//             Colors.cyan.shade400,
//           ]),
//         ),
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: 80,
//             ),
//             Header(
//               isNewUser: true,
//             ),
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(60),
//                       topRight: Radius.circular(60),
//                     )),
//                 child: Container(
//                   padding: const EdgeInsets.all(30),
//                   child: Form(
                    
//                     child: SingleChildScrollView(
//                       child: Expanded(
//                         child: Column(
//                           children: [
//                             TextFormField(
//                               controller: _firstNameController,
                              
//                               decoration: const InputDecoration(
//                                   labelText: 'First Name'),
//                             ),
//                             SizedBox(height: 10),
//                             TextFormField(
//                               controller: _lastNameController,
                              
//                               decoration:
//                                   const InputDecoration(labelText: 'Last Name'),
//                             ),
//                             SizedBox(height: 10),
//                             TextFormField(
//                               controller: _emailController,
                              
//                               decoration:
//                                   const InputDecoration(labelText: 'Email'),
//                             ),
//                             SizedBox(height: 10),
//                             TextFormField(
//                               obscureText: true,
//                               controller: _passwordController,
                              
//                               decoration:
//                                   const InputDecoration(labelText: 'Password'),
//                             ),
//                             SizedBox(height: 10),
//                             TextFormField(
//                               controller: _societyNameContoller,
                              
//                               decoration: const InputDecoration(
//                                   labelText: 'Society Name'),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Container(
//                               width: double.infinity,
//                               child: DropdownButton(
//                                 value: dropdownvalue,
//                                 items: items.map((String items) {
//                                   return DropdownMenuItem(
//                                     value: items,
//                                     child: Text(items),
//                                   );
//                                 }).toList(),
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     dropdownvalue = newValue!;
//                                   });
//                                 },
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             TextFormField(
//                               controller: _wingController,
                              
//                               decoration:
//                                   const InputDecoration(labelText: 'Wing'),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             TextFormField(
//                               controller: _flatNoController,
                              
//                               decoration:
//                                   const InputDecoration(labelText: 'Flat no.'),
//                             ),
                            
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
