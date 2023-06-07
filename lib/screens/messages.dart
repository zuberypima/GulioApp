import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gulio/services/gerneralservices.dart';
import 'package:gulio/utilities/constantscolors.dart';

class Messages extends StatefulWidget {
  String reciver;
  Messages({super.key,required this.reciver});

  @override
  State<Messages> createState() => _MessagesState();
}

final User? user = FirebaseAuth.instance.currentUser;
TextEditingController _messagebody = TextEditingController();

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('Messages').where('Receiver', isEqualTo: widget.reciver)
        .snapshots();

    return Scaffold(
      backgroundColor: Colors.greenAccent[100],
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
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 5, top: 5),
                    child: Flexible(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(data['body']),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 40,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color:  Colors.greenAccent[100],
                      border: Border.all(
                        color: Colors.indigoAccent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: _messagebody,
                    ),
                  )),
            ),
          ),
          Positioned(
              bottom: 10,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white38,
                radius: 25,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      GeneralServices().sendSMS(_messagebody.text,widget.reciver,user!.email);
                    },
                    icon: Icon(
                      Icons.send,
                      size: 30,
                      color: Colors.indigoAccent,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
