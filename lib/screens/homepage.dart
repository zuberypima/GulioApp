// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gulio/screens/Screenhome.dart';
import 'package:gulio/screens/marketpage.dart';
import 'package:gulio/screens/orders.dart';
import 'package:gulio/screens/postScreen.dart';
import 'package:gulio/screens/profilescreen.dart';
import 'package:gulio/utilities/constantscolors.dart';
import 'package:gulio/widgets/homegridIcon.dart';
import 'package:gulio/widgets/navdrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [HomeScreen(), MarketPage(), Orders(),ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          // ignore: prefer_const_literals_to_create_immutables
          currentIndex: _currentIndex,
          selectedItemColor: ConstantsColors().mainColor(),
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Sokoni',
            ),
           BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),

          
          ],
        ),
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
