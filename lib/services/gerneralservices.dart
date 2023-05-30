import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GeneralServices {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference cropsposted =
      FirebaseFirestore.instance.collection('Users');
  CollectionReference messages = FirebaseFirestore.instance.collection('Users');
  CollectionReference orderpresed =
      FirebaseFirestore.instance.collection('Users');
  postCrop(String bei, String kipimo) {
    return cropsposted.doc(user!.email).collection('Posts').add({
      'Bei': bei,
      'Kipimo': kipimo,
    });
  }

  sendSMS(String body) {
    return messages.doc(user!.email).collection('Messages').add({
      'Sender': user!.email,
      'Receiver': 'Receiver',
      'body': body,
      'Date': 'Test Date',
    });
  }

  oderpressed(String offered, String detaisl,String bidhaa) {
    return orderpresed.doc(user!.email).collection('OrderPres').add({
      'Selected':bidhaa,
      "ofa": offered,
      "Maelezo": detaisl,
      "Buyer":user!.email,
    });
  }
}
