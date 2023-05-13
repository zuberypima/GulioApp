// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthFunction{
   final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  // Check the user is logged in
  
  signUp(
   String
    firstName,
    lastName,
    phonenumber,
    email,
   password,
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
    _userrole
  ) async {
    User? userAuth = auth.currentUser;
    if (userAuth != null) {
      await _firestore.collection('Users').doc(userAuth.email).set({
        "name": "$_firstName $_lastName",
        "email": _email,
        "phone": _phonenumber,
        "userrole": _userrole,
        "address": {
          "District": '',
          "Region": '',
        },
        'Crops':'Mazao 1'
      });
    }
  }
}
