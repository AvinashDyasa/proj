import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  String name;
  String date;
  String timeFrom;
  String timeTo;
  String aminityType;
  BookingCard({
    required this.name,
    required this.date,
    required this.timeFrom,
    required this.timeTo,
    required this.aminityType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        //color: Colors.blue.shade100,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(name),
              SizedBox(
                height: 5,
              ),
              Text(date),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text("From: " + timeFrom),
                  SizedBox(
                    width: 5,
                  ),
                  Text("To: " + timeTo),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(aminityType),
            ],
          ),
        ),
      ),
    );
  }
}
