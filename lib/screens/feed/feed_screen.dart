// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
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
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Card(
                    elevation: 5,
                    child: Container(
                      child: Center(
                        child: Text(
                          "Visitor Data will apper here!",
                          style: TextStyle(fontSize: 25, color: Colors.grey),
                        ),
                      ),
                      height: 150,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    child: FloatingActionButton(
                      child: Icon(Icons.person),
                      onPressed: () {},
                    ),
                    top: -20,
                    right: 160,
                  ),
                  Positioned(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        FloatingActionButton(
                          child: Icon(Icons.cancel_outlined),
                          onPressed: () {},
                        ),
                        Positioned(
                          child: Text("Deny"),
                          top: 60,
                          left: 13,
                        )
                      ],
                    ),
                    bottom: -25,
                    left: 60,
                  ),
                  Positioned(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        FloatingActionButton(
                          child: Icon(Icons.done),
                          onPressed: () {},
                        ),
                        Positioned(
                          child: Text("Accept"),
                          top: 60,
                          left: 9,
                        )
                      ],
                    ),
                    bottom: -25,
                    right: 60,
                  ),
                ],
              ),
              SizedBox(height: 80),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.attach_file),
                        Text(
                          'Notice',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    CarouselSlider(
                      options: CarouselOptions(height: 100),
                      items: [1, 2, 3].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(color: Colors.amber),
                                child: Text(
                                  'there are no notices',
                                  style: TextStyle(fontSize: 16.0),
                                ));
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              // Card(
              //   child: Container(
              //     height: 100,
              //     width: double.infinity,
              //   ),
              //   color: Color.fromARGB(255, 231, 228, 207),
              // ),
              Card(
                color: Colors.green,
                child: Container(
                  width: double.infinity,
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Name',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Purpose',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Action',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                    rows: const <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Sarah')),
                          DataCell(Text('19')),
                          DataCell(Text('Student')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Janine')),
                          DataCell(Text('43')),
                          DataCell(Text('Professor')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
