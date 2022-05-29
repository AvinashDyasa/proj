import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  String name;
  String date;
  String time;
  String visitorType;
  String flatDetails;
  bool visitStatus;
  CustomCard(
      {required this.name,
      required this.date,
      required this.time,
      required this.visitorType,
      required this.flatDetails,
      required this.visitStatus});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        //color: Colors.blue.shade100,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  SizedBox(
                    height: 5,
                  ),
                  Text(flatDetails),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(date),
                      SizedBox(
                        width: 5,
                      ),
                      Text(time),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(visitorType),
                ],
              ),
              visitStatus == true
                  ? Text(
                      "ACCEPTED",
                      style: TextStyle(color: Colors.green),
                    )
                  : Text(
                      "DECLINED",
                      style: TextStyle(color: Colors.red),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
