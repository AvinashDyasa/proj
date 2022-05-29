import 'package:flutter/material.dart';
import 'package:proj/models/bookingModel.dart';
import 'package:proj/models/visitorModel.dart';
import 'package:proj/screens/widgets/booking_widget.dart';
import 'package:proj/screens/widgets/list_widget.dart';

class ABooking extends StatefulWidget {
  const ABooking({Key? key}) : super(key: key);

  @override
  State<ABooking> createState() => _ABookingState();
}

class _ABookingState extends State<ABooking> {
  List<Booking> bookingDetails = [
    Booking(
        name: "Shack",
        date: "26/5/2022",
        aminityType: 'Club House',
        timeFrom: '18:30',
        timeTo: '22:00'),
    Booking(
        name: "Beamer",
        date: "25/05/2022",
        aminityType: 'Lawn',
        timeFrom: '16:00',
        timeTo: '18:00'),
    Booking(
        name: "Neo",
        date: "12/05/2022",
        aminityType: 'Theatre',
        timeFrom: '20:00',
        timeTo: '22:00'),
    Booking(
        name: "Nero",
        date: "22/05/2022",
        aminityType: 'Lawn',
        timeFrom: '10:00',
        timeTo: '20:00'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        title: const Text("Amenities"),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
          itemCount: bookingDetails.length,
          itemBuilder: (BuildContext context, int index) {
            return BookingCard(
              name: bookingDetails[index].name,
              date: bookingDetails[index].date,
              timeFrom: bookingDetails[index].timeFrom,
              timeTo: bookingDetails[index].timeTo,
              aminityType: bookingDetails[index].aminityType,
            );
          }),
    );
  }
}
