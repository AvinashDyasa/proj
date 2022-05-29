// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../screens/billing/ANotice.dart';
import '../screens/booking/Abooking.dart';
import '../screens/feed/Afeed.dart';

class AHomepage extends StatefulWidget {
  const AHomepage({Key? key}) : super(key: key);

  @override
  State<AHomepage> createState() => _AHomepageState();
}

class _AHomepageState extends State<AHomepage> {
  final List _items = [AFeed(), ABooking(), ANotice()];
  final List _labelName = ['Home', 'Amenities', 'Notice'];
  final List _icons = [Icons.home, Icons.book, Icons.receipt];
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.tra,
          unselectedItemColor: Colors.grey,
          selectedItemColor: (Colors.blue),
          currentIndex: _currentIndex,
          onTap: (int value) {
            onBottomBarClicked(context, value);
          },
          items: List.generate(
              _items.length,
              (index) => BottomNavigationBarItem(
                  icon: Icon(
                    _icons[index],
                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                  ),
                  label: _labelName[index]))),
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
          AFeed(),
          ABooking(),
          ANotice(),
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
