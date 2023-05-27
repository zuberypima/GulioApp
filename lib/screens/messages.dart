import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gulio/utilities/constantscolors.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) { 
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstantsColors().mainColor(),
        title: Text('Sender Addres'),),
      
      body: StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Container(
              decoration: BoxDecoration(),
              child: Text('data'),);
          }).toList(),
        );
      },
    ),
    );
  }
}