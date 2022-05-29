// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proj/screens/widgets/list_widget.dart';

import '../../models/visitorModel.dart';

class AFeed extends StatefulWidget {
  const AFeed({Key? key}) : super(key: key);

  @override
  State<AFeed> createState() => _AFeedState();
}

class _AFeedState extends State<AFeed> {
  List<String> vtype = ['Delivery Person', 'HouseKeeper', 'Relative', 'Other'];
  List<Visitor> visitorDetails = [
    Visitor(
        name: "Shack",
        date: "26/5/2022",
        time: "18:22",
        status: false,
        visitorType: "Delivery Person",
        flatDetails: 'A-07'),
    Visitor(
        name: "Beamer",
        date: "25/05/2022",
        time: "15:33",
        status: true,
        visitorType: "HouseKeeper",
        flatDetails: 'B-28'),
    Visitor(
        name: "Neo",
        date: "12/05/2022",
        time: "14:40",
        status: true,
        visitorType: "Delivery Person",
        flatDetails: 'C-12'),
    Visitor(
        name: "Nero",
        date: "22/05/2022",
        time: "13:52",
        status: true,
        visitorType: "Relative",
        flatDetails: 'A-11'),
    Visitor(
        name: "Kabali",
        date: "22/05/2022",
        time: "13:43",
        status: true,
        visitorType: "Relative",
        flatDetails: 'A-22'),
    Visitor(
        name: "Elixer",
        date: "22/05/2022",
        time: "13:42",
        status: true,
        visitorType: "Relative",
        flatDetails: 'C-13'),
  ];

  @override
  Widget build(BuildContext context) {
    String dropdownValue = "Other";
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(title: const Text("HomePage")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Add A Visitor',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Name',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Flat No.',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Wing',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      StatefulBuilder(
                          builder: (BuildContext context, StateSetter state) {
                        return DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          onChanged: (newValue) {
                            state(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: vtype
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        );
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Fluttertoast.showToast(
                                msg: "Request Sent", // message
                                toastLength: Toast.LENGTH_SHORT, // length
                                gravity: ToastGravity.BOTTOM, // location
                                timeInSecForIosWeb: 1 // duration
                                );
                          },
                          child: Text('Submit'))
                    ],
                  ),
                );
              });
        },
      ),
      body: ListView.builder(
          itemCount: visitorDetails.length,
          itemBuilder: (BuildContext context, int index) {
            return CustomCard(
              name: visitorDetails[index].name,
              flatDetails: visitorDetails[index].flatDetails,
              date: visitorDetails[index].date,
              time: visitorDetails[index].time,
              visitStatus: visitorDetails[index].status,
              visitorType: visitorDetails[index].visitorType,
            );
          }),
    );
  }
}
