// import 'package:flutter/material.dart';

// class Button extends StatelessWidget {
//   bool isAdminLogin;
//   bool isNewUser;
//   bool isForgotPassword;
//   Button(
//       {this.isAdminLogin = false,
//       this.isForgotPassword = false,
//       this.isNewUser = false});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       margin: EdgeInsets.symmetric(horizontal: 50),
//       decoration: BoxDecoration(
//         color: Colors.cyan[500],
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Center(
//         child: isForgotPassword
//             ? const Text(
//                 "Reset",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold),
//               )
//             : isNewUser
//                 ? const Text(
//                     "Sign Up",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold),
//                   )
//                 : const Text(
//                     "Login",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold),
//                   ),
//       ),
//     );
//   }
// }
