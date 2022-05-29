import 'package:flutter/material.dart';

class ANotice extends StatefulWidget {
  const ANotice({Key? key}) : super(key: key);

  @override
  State<ANotice> createState() => _ANoticeState();
}

class _ANoticeState extends State<ANotice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Post Notice'),
      ),
      body: Column(
        children: [
          Container(
            child: const TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              style:
                  TextStyle(fontSize: 16.0, height: 2.0, color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Notice',
              ),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () {},
              child: Text('Post'))
        ],
      ),
    );
  }
}
