// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:proj/screens/billing/billing_screen.dart';
import 'package:proj/screens/booking/booking_screen.dart';
import 'package:proj/screens/feed/feed_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List _items = [Feed, BookingScreen(), BillingScreen()];
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          // unselectedItemColor: Colors.redAccent,
          // selectedItemColor: (Colors.blueAccent),
          currentIndex: _currentIndex,
          onTap: (int value) {
            onBottomBarClicked(context, value);
          },
          items: List.generate(
              _items.length,
              (index) => BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_task_sharp,
                    color: _currentIndex == index ? Colors.red : Colors.blue,
                  ),
                  label: 'Hi'))),
      // appBar: AppBar(
      //   backgroundColor: Colors.cyan.shade500,
      //   title: const Text('Homepage'),
      // ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: const [
          // Container(),
          // Container(),
          // Container(),
          Feed(),
          BookingScreen(),
          BillingScreen(),
        ],
      ),
    );
  }

  onBottomBarClicked(context, value) {
    _pageController.jumpToPage(value);
    setState(() {
      _currentIndex = value;
    });
  }
}
