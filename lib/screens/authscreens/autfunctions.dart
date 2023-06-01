// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gulio/screens/buyerhome.dart';
import 'package:gulio/screens/farmerhome.dart';
import 'package:gulio/screens/selerscreen.dart';

class AuthFunction {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool loading = false;
   Future<String?> getUserRole(String uid) async {
    DocumentSnapshot snapshot =
        await _firestore.collection('Users').doc(uid).get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      return data['userrole'] as String?;
    }
    return null;
  }
  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        String? userRole = await getUserRole(auth.currentUser!.email.toString());
        if (userRole == 'Mkulima') {
         // Navigator.pushReplacementNamed(context, '/admin_screen');
          Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => FarmerPage()));
        } else if (userRole == 'Buyer') {
          //Navigator.pushReplacementNamed(context, '/user_screen');
             Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => BuyerHomePage()));
        }
      }

   
    } on FirebaseAuthException catch (e) {
      // _errorMessage = e.message!;
      // notifyListeners();
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Hello check your detail')),
      );
    }
  }

  // User sign up first time;
Future<void>  signUp( BuildContext context,String firstName, lastName, email,phonenumber, password,userrole, userlocation,
      ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      userDataCollections(
          firstName, lastName,email,phonenumber, userrole, userlocation);
          if (userCredential !=null){
            // String? userRole = await getUserRole(auth.currentUser!.email.toString());
        if (userrole == 'Mkulima') {
          // Navigator.pushReplacementNamed(context, '/admin_screen');
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const FarmerPage()));
        } else if (userrole == 'Buyer') {
          //Navigator.pushReplacementNamed(context, '/user_screen');
            // Navigator.of(context)
          //.push(MaterialPageRoute(builder: (context) => BuyerHomePage()));
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const BuyerHomePage()));
        }
          }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  userDataCollections(String _firstName,_lastName, _email, _phonenumber,
      _userrole, userlocation) async {
    User? userAuth = auth.currentUser;
    if (userAuth != null) {
      await _firestore
          .collection('Users')
          .doc(_userrole)
          .collection(userAuth.email.toString())
          .doc(userAuth.email)
          .set({
        "name": "$_firstName $_lastName",
        "email": _email,
        "phone": _phonenumber,
        "userrole": _userrole,
        "location": userlocation,
        'Crops': 'Mazao 1'
      });
    }
  }
// homepage (){
//   Navigator.of(context as BuildContext).push(MaterialPageRoute(builder: (context)=>const SelerScreen()));
// }  
}
