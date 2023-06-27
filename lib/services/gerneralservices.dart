import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:gulio/screens/makeoderscreen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneralServices {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference cropsposted =
      FirebaseFirestore.instance.collection('Posts');
  CollectionReference messages =
      FirebaseFirestore.instance.collection('Messages');
  CollectionReference orderpresed =
      FirebaseFirestore.instance.collection('OrderPres');
  final DateTime sentTime = DateTime.now();


  // Function for post Crop
  postCrop(
    String bei,
    kipimo,
    mkulima,
    stock,
    imageUrl,
    mazao,
    simu
  ) {
    return cropsposted.doc(mkulima).set({
      'Bei': bei,
      'Kipimo': kipimo,
      'Mkulima': mkulima,
      'Stock': stock,
      'image': imageUrl,
      'Mazao':mazao,
      'Simu':simu,
    });
  }


// Function when the Order is Created
  oderpressed(String offered, kiasi, String seller, buyer) {
    return orderpresed.doc(buyer).set({
      "ofa": offered,
      "Kiasi": kiasi,
      "Farmer": seller,
      "Buyer": buyer,
      'Status': 'Pending'
    });
  }

  // Function to check Order Status
  void updateOrder(String buyerID) {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('OrderPres').doc(buyerID);

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



// Function for update Stock

  void updateStock(String selerID, newquantity) {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('Posts').doc(selerID);

    // Update the document fields
    docRef.update({
      'Stock': newquantity,
      // Add more fields to update
    }).then((value) {
      print('Document updated successfully!');
    }).catchError((error) {
      print('Failed to update document: $error');
    });
  }


// Functiuon to delete the Orders
  void deleteOder(String buyerID) {
    // Get a reference to the document you want to delete
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('OrderPres').doc(buyerID);

    // Delete the document
    docRef.delete().then((value) {
      print('Document deleted successfully!');
    }).catchError((error) {
      print('Failed to delete document: $error');
    });
  }

// Functio to get Post Details 
  void getPostDetails(String selerID, orderquantity) {
    // Get a reference to the document you want to retrieve
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('Posts').doc(selerID);
    print(orderquantity.runtimeType);
    // Retrieve the document
    docRef.get().then((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        // Document exists, retrieve its data
        Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
        var stock = double.parse(data!['Stock'].toString());
        var quant = double.parse(orderquantity);
        var newtock = (stock - quant).toString();
        updateStock(selerID, newtock);
      } else {
        // Document does not exist
        print('Document does not exist');
      }
    }).catchError((error) {
      print('Failed to retrieve document: $error');
    });
  }


// Function to make the phone Call
  makingPhoneCall() async {
    final url = Uri.parse("tel:9776765434");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
callNumber() async{
  const number = '0859211'; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}
  recivedOder(odervalue) {
    FirebaseFirestore.instance
        .collection('RecievdeOders')
        .add({'SoldStock': odervalue});
  }




// Function to send SMS 
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



// Function for Postion on forum
  jamiiPost(
    String body,
    poster,
  ) {
    return FirebaseFirestore.instance
        .collection('JamiiPosts')
        .doc(poster + ' ' + sentTime.toString())
        .set({'Poster': poster, 'body': body, 'SentTime': sentTime});
  }



  commentPost(
    String body,
    contributer,
  ) {
    return FirebaseFirestore.instance
        .collection('JamiiPosts')
        .doc(contributer + " " + sentTime)
        .set({'Contributer': contributer, 'body': body, 'SentTime': sentTime});
  }


// Function to Post Image
  Future<String> uploadImageToFirebase(File imageFile) async {
    String fileName = basename(imageFile.path);
    Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = storageReference.putFile(imageFile);
    TaskSnapshot storageSnapshot = await uploadTask.whenComplete(() => null);
    String downloadUrl = await storageSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }



}
