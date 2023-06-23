// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gulio/providers/userdata.dart';
import 'package:gulio/screens/authscreens/accounttypepage.dart';
import 'package:gulio/screens/authscreens/autfunctions.dart';
import 'package:gulio/screens/authscreens/loginpage.dart';
import 'package:gulio/screens/buyerhome.dart';
import 'package:gulio/screens/farmerhome.dart';
import 'package:gulio/screens/postScreen.dart';
import 'package:gulio/screens/profilescreen.dart';
import 'package:gulio/screens/select_crop_page.dart';
import 'package:provider/provider.dart';
import 'screens/messages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
   ChangeNotifierProvider(create: (context)=>UserDetails(),
   child:  MyApp(),)
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? userol = FirebaseAuth.instance.currentUser;
  final FirebaseAuth auth = FirebaseAuth.instance;
  late StreamSubscription<User?> user;
  // String userRole = 'Mkulima';

  @override
  void initState(){
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user == null) {
        print('object');
      } else {
        print('object222');
      }
    });
  }

  @override
  void dispose() {
    user.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:'login',
          //FirebaseAuth.instance.currentUser == null ? 'login' : 'home',
      routes: {
        'home': (context) {
         
           String userRole =auth.currentUser!.email.toString();
          if (AuthFunction().getUserRole(userRole) == 'Mkulima') {
            return FarmerPage(userRole: userRole);
          } else {
            return BuyerHomePage();
          }
        },
        // 'mkulima': (context) => FarmerPage(),
        'profile': (context) => ProfileScreen(),
        'postscreen': (context) => PostPage(),
        'cropchoice': (context) => SelecteCropPage(),
        'login': (context) => LoginPage(),
        'register': (context) => SelectAccountType(),
        'buyer': (context) => BuyerHomePage()
        // 'order':(context) => Orders(),
      },
    );
  }
}
