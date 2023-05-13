// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gulio/providers/userdata.dart';
import 'package:gulio/screens/authscreens/loginpage.dart';
import 'package:gulio/screens/homepage.dart';
import 'package:gulio/screens/select_crop_page.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
       ChangeNotifierProvider(create: (_)=>UserDetails())
  ],
  child: MyApp(),
  ),
  
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginPage()
    );
  }
}

