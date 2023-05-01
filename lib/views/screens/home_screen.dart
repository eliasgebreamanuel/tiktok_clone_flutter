import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/views/widgets/custom_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // this is used to seth tebottom navigatiuon bar
        bottomNavigationBar: BottomNavigationBar(
          // this is used to handle teh onTap event
          onTap: (idx) {
            setState(() {
              pageIdx = idx;
            });
          },
          // this is used to set teh type of the bottom navigation
          type: BottomNavigationBarType.fixed,
          // this is used to set the background color of the bottomnavigtaiuon bar item
          backgroundColor: backgroundColor,
          // this is used to set the color of the selected item
          selectedItemColor: Colors.red,
          // this is used to set the current index value
          currentIndex: pageIdx,
          // this is used to set the color of the unselected item color
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 30), label: "Search"),
            BottomNavigationBarItem(icon: CustomIcon(), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.message, size: 30), label: "Message"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 30), label: "Profile")
          ],
        ),
        body: pages[pageIdx]
        );
  }
}
