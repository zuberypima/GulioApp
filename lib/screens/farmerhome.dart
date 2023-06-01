// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gulio/screens/selerscreen.dart';
import 'package:gulio/screens/marketpage.dart';
import 'package:gulio/screens/orders.dart';
import 'package:gulio/screens/postScreen.dart';
import 'package:gulio/screens/profilescreen.dart';
import 'package:gulio/utilities/constantscolors.dart';
import 'package:gulio/widgets/homegridIcon.dart';
import 'package:gulio/widgets/navdrawer.dart';

class FarmerPage extends StatefulWidget {
  const FarmerPage({super.key});

  @override
  State<FarmerPage> createState() => _FarmerPageState();
}

class _FarmerPageState extends State<FarmerPage> {
  int _currentIndex = 0;

  final List<Widget> _selerpages = [SelerScreen(), MarketPage(), Orders(),ProfileScreen()];
  final List<Widget> _buyerpages = [SelerScreen(), MarketPage(), Orders(),ProfileScreen()];
User? user =FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(
      child: Scaffold(
        body:_selerpages[_currentIndex],
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
