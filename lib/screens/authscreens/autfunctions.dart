// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthFunction{
   final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  // Check the user is logged in

  // usre login 
   Future<void> login(BuildContext context, String email ,password) async {
    try {
      
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      // _errorMessage = e.message!;
      // _loading = false;
      // notifyListeners();
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Hello check your detail')),
      );
    }
  }
  // User sign up first time;
  signUp(
   String
    firstName,
    lastName,
    phonenumber,
    email,
   password,
   userlocation,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      userDataCollections(
        firstName,
        lastName,
        phonenumber,
        email,
        'Mkulima',
        userlocation
      );
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

  userDataCollections(
    String _firstName,
    String _lastName,
    _email,
    _phonenumber,
    _userrole,userlocation
  ) async {
    User? userAuth = auth.currentUser;
    if (userAuth != null) {
      await _firestore.collection('Users').doc(userAuth.email).set({
        "name": "$_firstName $_lastName",
        "email": _email,
        "phone": _phonenumber,
        "userrole": _userrole,
       "location":userlocation,
        'Crops':'Mazao 1'
      });
    }
  }
}
