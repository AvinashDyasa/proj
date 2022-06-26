import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proj/homePage/AHomePage.dart';
import 'package:proj/homePage/HomePage.dart';
import 'package:proj/screens/feed/Afeed.dart';
import 'LoginPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AHomepage(),
    );
  }
}
