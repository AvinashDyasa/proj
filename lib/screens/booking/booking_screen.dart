import 'button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_range/time_range.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? date;
  String dropdownvalue = 'Club House';
  var items = ['Club House', 'Lawn', 'Theatre'];

  String getText() {
    if (date == null) {
      return 'Select Date';
    } else {
      return DateFormat('MM/dd/yyyy').format(date!);
      // return '${date.month}/${date.day}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final amenities = DropdownButton(
        value: dropdownvalue,
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalue = newValue!;
          });
        });
    final book = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.green,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {},
          child: const Text(
            "Book Slot",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Book Amenities'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            amenities,
            SizedBox(height: 1),
            ButtonHeaderWidget(
              title: 'Date',
              text: getText(),
              onClicked: () => pickDate(context),
            ),
            TimeRange(
              fromTitle: const Text(
                'From',
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 151, 151, 151)),
              ),
              toTitle: const Text(
                'To',
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 151, 151, 151)),
              ),
              titlePadding: 20,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.black87),
              activeTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
              backgroundColor: Colors.transparent,
              activeBackgroundColor: Colors.green,
              firstTime: const TimeOfDay(hour: 00, minute: 00),
              lastTime: const TimeOfDay(hour: 23, minute: 50),
              timeStep: 30,
              timeBlock: 30,
              onRangeCompleted: (range) => setState(() => print(range)),
            ),
            SizedBox(
              height: 10,
            ),
            book
          ],
        ),
      ),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 2),
    );

    if (newDate == null) return;

    setState(() => date = newDate);
  }
}
