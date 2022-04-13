import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Colors.cyan,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                  child: Container(
                    height: 250,
                    width: double.infinity,
                  ),
                  color: Colors.red),
              Card(
                child: Container(
                  height: 100,
                  width: double.infinity,
                ),
                color: Colors.blue,
              ),
              Card(
                child: Container(
                  height: 200,
                  width: double.infinity,
                ),
                color: Colors.green,
              )
            ],
          ),
        ));
  }
}
