import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class GeneralServices{
 User? user =FirebaseAuth.instance.currentUser;
   CollectionReference cropsposted = FirebaseFirestore.instance.collection('Users');
    CollectionReference messages = FirebaseFirestore.instance.collection('Users');
 postCrop (String bei ,String kipimo){
       return cropsposted.doc(user!.email).collection('Posts').add({
        'Bei':bei,
        'Kipimo':kipimo,
       });
  }

  sendSMS (){
    return messages.doc(user!.email).collection('Messages').add({
      'Sender':'Sender',
      'Receiver':'Receiver',
      'body':'Test Message Body',
      'Date':'Test Date',
    });

  }
    

}