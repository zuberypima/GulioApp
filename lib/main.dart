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
import 'package:gulio/widgets/dividerpage.dart';
import 'package:provider/provider.dart';
import 'screens/messages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => UserDetails(),
    child: MyApp(),
  ));
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
  void initState() {
    super.initState();
    checkAuthorization();
    final req = AuthFunction()
        .getUserRole(FirebaseAuth.instance.currentUser.toString());
    user = FirebaseAuth.instance.authStateChanges().listen((user) async {});
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
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? 'login' : 'home',
      routes: {
        'home': (context) {
          String rew = Provider.of<UserDetails>(context).userRole.toString();
          print(rew);
          if (rew == 'Mkulima') {
            return FarmerPage();
          } else {
            return BuyerHomePage();
          }
        },
        // 'mkulima': (context) => FarmerPage(),
        'direct': (context) =>
            DividerPage(role: checkAuthorization().toString()),
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

  checkAuthorization() async {
    String role = await AuthFunction()
        .getUserRole(auth.currentUser!.email.toString()) as String;
    Provider.of<UserDetails>(context, listen: false).setUserRole(role);
    print(role);
    return role.toString();
  }
}
