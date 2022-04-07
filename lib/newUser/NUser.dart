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
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
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
            return ("Second Name cannot be Empty");
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
          hintText: "Second Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),);
    final emailField = TextFormField(
        autofocus: false,
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
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
        ));
    




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
