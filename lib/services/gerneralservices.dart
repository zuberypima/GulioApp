import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class GeneralServices {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference cropsposted =
      FirebaseFirestore.instance.collection('Posts');
  CollectionReference messages =
      FirebaseFirestore.instance.collection('Messages');
  CollectionReference orderpresed =
      FirebaseFirestore.instance.collection('OrderPres');
  final DateTime sentTime = DateTime.now();
  postCrop(
    String bei,
    kipimo,
    mkulima,
    stock,
    imageUrl,
  ) {
    return cropsposted.doc(user!.email).set({
      'Bei': bei,
      'Kipimo': kipimo,
      'Mkulima': mkulima,
      'Stock': stock,
      'image': imageUrl
      // 'Location':location,
    });
  }

  updateStock(
    stock,
  ) {
    FirebaseFirestore.instance
        .collection('Posts')
        .doc('test@g.co')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        postCrop(
            documentSnapshot.get('Bei'),
            documentSnapshot.get('Kipimo'),
            documentSnapshot.get('Mkulima'),
            stock,
            documentSnapshot.get('image'));
      }
    });
  }

  sendSMS(
    String body,
    buyer,
    farmer,
    sender,
  ) {
    return messages.add({
      // 'Sender': user!.email,
      'Buyer': buyer,
      'Farmer': farmer,
      'body': body,
      'Date': 'Test Date',
      'Sender': sender,
      'SentTime': sentTime
    });
  }

  jamiiPost(
    String body,
    poster,
  ) {
    return FirebaseFirestore.instance
        .collection('JamiiPosts')
        .doc(poster + ' '+sentTime.toString())
        .set({
      'Poster': poster,
      'body': body,
      'SentTime': sentTime
    });
  }

  commentPost(
    String body,
    contributer,
  ) {
    return FirebaseFirestore.instance
        .collection('JamiiPosts')
        .doc(contributer+ " "+sentTime)
        .set({
      'Contributer': contributer,
      'body': body,
      'SentTime': sentTime
    });
  }

  oderpressed(String offered, String detaisl, seller, buyer) {
    return orderpresed.add({
      //'Selected': bidhaa,
      "ofa": offered,
      "Maelezo": detaisl,
      "Farmer": seller,
      "Buyer": buyer,
    });
  }

  Future<String?> getPostDetails(String postId) async {
    QuerySnapshot<Object?> snapshot =
        await cropsposted.where('', isEqualTo: '').get();
    // if (snapshot.exists) {
    //   Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    //   return data['userrole'] as String?;
    // }
    return null;
  }

  Future<String> uploadImageToFirebase(File imageFile) async {
    String fileName = basename(imageFile.path);
    Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = storageReference.putFile(imageFile);
    TaskSnapshot storageSnapshot = await uploadTask.whenComplete(() => null);
    String downloadUrl = await storageSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
