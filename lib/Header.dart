import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  bool isAdminLogin;
  bool isNewUser;
  bool isForgotPassword;
  Header(
      {this.isAdminLogin = false,
      this.isForgotPassword = false,
      this.isNewUser = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: isAdminLogin
                ? Text(
                    "Admin Login",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )
                : isNewUser
                    ? Text("New Login",
                        style: TextStyle(color: Colors.white, fontSize: 40))
                    : isForgotPassword
                        ? Text("Forgot Password",
                            style: TextStyle(color: Colors.white, fontSize: 40))
                        : Text("Login",
                            style:
                                TextStyle(color: Colors.white, fontSize: 40)),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "ComCon",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
