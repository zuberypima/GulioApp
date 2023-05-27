import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gulio/services/gerneralservices.dart';
import 'package:gulio/utilities/constantscolors.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

final User? user = FirebaseAuth.instance.currentUser;

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.email)
        .collection('Messages')
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstantsColors().mainColor(),
        title: Text('Sender Addres'),
      ),
      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(data['body']),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right:40,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(),
                  )),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 0,
            child: IconButton(
            onPressed: () {
              GeneralServices().sendSMS();
            },
            icon: Icon(Icons.send,size: 38,color: ConstantsColors().mainColor(),),))
        ],
      ),
    );
  }
}
