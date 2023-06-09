// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gulio/screens/buyerorderview.dart';
import 'package:gulio/screens/buyerscreen.dart';
import 'package:gulio/screens/marketpage.dart';
import 'package:gulio/screens/profilescreen.dart';
import 'package:gulio/utilities/constantscolors.dart';

class BuyerHomePage extends StatefulWidget {
  const BuyerHomePage({super.key});

  @override
  State<BuyerHomePage> createState() => _BuyerHomePageState();
}

class _BuyerHomePageState extends State<BuyerHomePage> {
  int _currentIndex = 0;

  final List<Widget> _buyerpages = [BuyerScreen(), MarketPage(),BuyerOrders() ,ProfileScreen()];
User? user =FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(
      child: Scaffold(
        body:_buyerpages[_currentIndex],
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
