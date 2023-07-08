// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_dribble_example_attempt/pages/categoriespage.dart';
import 'package:flutter_dribble_example_attempt/pages/searchpage.dart';
import 'package:flutter_dribble_example_attempt/pages/userhomepage.dart';
import 'package:flutter_dribble_example_attempt/pages/userprofilepage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    UserHomePage(),
    CategoriesPage(),
    SearchPage(),
    UserProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],

      // Navigation bar (util folder)
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: GNav(
          selectedIndex:
              _selectedIndex, // current index of the tab in navigation bar
          onTabChange: _navigateBottomBar,
          backgroundColor: Colors.white,
          rippleColor: Colors.blue[400]!,
          hoverColor: Colors.blue[300]!,
          gap: 8,
          activeColor: Colors.white,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: Duration(milliseconds: 400),
          tabBackgroundColor: Colors.blue[700]!,
          color: Colors.black,
          tabs: [
            GButton(
              icon: LineIcons.home,
              text: 'Home',
            ),
            GButton(
              icon: LineIcons.heart,
              text: 'Likes',
            ),
            GButton(
              icon: LineIcons.search,
              text: 'Search',
            ),
            GButton(
              icon: LineIcons.user,
              text: 'Profile',
            )
          ],
        ),
      ),

      body: _pages[_selectedIndex],
    );
  }
}
