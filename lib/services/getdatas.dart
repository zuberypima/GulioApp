import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class GetAllDetails {
 final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



   Future<String?> getPostDetails(String postId) async {
    DocumentSnapshot snapshot =
        await _firestore.collection('Posts').doc(postId).get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      return data['userrole'] as String?;
    }
    return null;
  }
}