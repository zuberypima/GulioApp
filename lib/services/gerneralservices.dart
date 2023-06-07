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

  postCrop(
    String bei,
    String kipimo,
    mkulima,
    imageUrl,
  ) {
    return cropsposted.doc(user!.email).set({
      'Bei': bei,
      'Kipimo': kipimo,
      'Mkulima': mkulima,
      'image': imageUrl
      // 'phone':phone,
      // 'Location':location,
    });
  }

  sendSMS(String body, reciver, sender) {
    return messages.add({
      // 'Sender': user!.email,
      'Receiver': reciver,
      'Sender': sender,
      'body': body,
      'Date': 'Test Date',
    });
  }

  oderpressed(String offered, String detaisl, seller) {
    return orderpresed.add({
      //'Selected': bidhaa,
      "ofa": offered,
      "Maelezo": detaisl,
      "Reciver": seller,
      "Sender": user!.email,
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
