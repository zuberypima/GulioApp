import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gulio/screens/makeoderscreen.dart';
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
    return cropsposted.doc(mkulima).set({
      'Bei': bei,
      'Kipimo': kipimo,
      'Mkulima': mkulima,
      'Stock': stock,
      'image': imageUrl,
     
    });
  }

  oderpressed(String offered, String kiasi, seller, buyer) {
    return orderpresed.doc(buyer).set({
      "ofa": offered,
      "Kiasi": kiasi,
      "Farmer": seller,
      "Buyer": buyer,
      'Status':'Pending'
    });
  }


void updateOrder(String buyerID) {
  DocumentReference docRef = FirebaseFirestore.instance.collection('OrderPres').doc(buyerID);

  // Update the document fields
  docRef.update({
    'Status': 'Accepted',
    // Add more fields to update
  }).then((value) {
    print('Document updated successfully!');
  }).catchError((error) {
    print('Failed to update document: $error');
  });
}


  updateStock(
    stock,
  ) {
    FirebaseFirestore.instance
        .collection('Posts')
        .doc(user!.email)
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
  

  recivedOder( 
    odervalue
  ) {
    FirebaseFirestore.instance
        .collection('RecievdeOders')
        .add({
          'SoldStock':odervalue
        });
    
  }
  
  // void postCrop(param0, param1, param2, stock, param4) {
  // }

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
