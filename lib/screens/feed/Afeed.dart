import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AFeed extends StatefulWidget {
  const AFeed({Key? key}) : super(key: key);

  @override
  State<AFeed> createState() => _AFeedState();
}

class _AFeedState extends State<AFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('hi')),
      body: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('users')
              .get()
              .then((value) => value.docs.forEach((element) {
                    print(element.data());
                  }));
        },
      ),
    );
  }
}
