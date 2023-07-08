import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gulio/services/gerneralservices.dart';
import 'package:gulio/utilities/constantscolors.dart';

class Messages extends StatefulWidget {
  String reciver;
  String pagefrom;
  Messages({super.key, required this.reciver, required this.pagefrom});

  @override
  State<Messages> createState() => _MessagesState();
}

final User? user = FirebaseAuth.instance.currentUser;
TextEditingController _messagebody = TextEditingController();
void clearText() {
  _messagebody.clear();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _buyesrside = FirebaseFirestore.instance
        .collection('Messages') .orderBy('SentTime',descending: false)
        .where('Farmer', isEqualTo: widget.reciver)
        .where('Buyer', isEqualTo: user!.email)
        .snapshots();

    final Stream<QuerySnapshot> _farmerside = FirebaseFirestore.instance
        .collection('Messages').orderBy('SentTime',descending: false) 
        .where('Buyer', isEqualTo: widget.reciver)
        .where('Farmer', isEqualTo: user!.email) 
    .snapshots();
  // final Stream<QuerySnapshot> _messages = FirebaseFirestore.instance
  //       .collection('Messages') .orderBy('SentTime',descending: false)
  //       .where('Reciever', isEqualTo: widget.reciver)
  //       .where('Sender', isEqualTo: user!.email)
  //       .snapshots();

    return Scaffold(
      backgroundColor: Colors.greenAccent[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstantsColors().mainColor(),
        title: Text('Sender Addres'),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder<QuerySnapshot>(
            stream: widget.pagefrom == 'BuyerPage' ? _buyesrside : _farmerside,
              //  stream: _messages,
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
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        child: data['Sender'] == user!.email
                            ? Padding(
                              padding: const EdgeInsets.only(left: 60,right: 10),
                              child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 4,
                                        color: Colors.grey),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                            data['body'],
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 16),
                                          ),
                                  ),
                                ),
                            )
                            : Padding(
                              padding: const EdgeInsets.only(left: 10,right: 60),
                              child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 4,
                                          color: Color.fromARGB(188, 77, 161, 230)),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child:Text(
                                            data['body'],
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 16),
                                          ),
                                  ),
                                ),
                            ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
           Positioned(
            bottom: 10,
            right: 5,
            left: 5,
                         child: Row(children: [
              Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                  height: 45,
                   width: MediaQuery.of(context).size.width/1.3,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent[100],
                      border: Border.all(
                        color: Colors.indigoAccent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: _messagebody,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  )),
                     ),
                     CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 25,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    //  GeneralServices().sendSMS(_messagebody.text,
                    //       user!.email, widget.reciver,);
                    if (widget.pagefrom == 'BuyerPage') {
                      GeneralServices().sendSMS(_messagebody.text,
                          user!.email, widget.reciver,user!.email);
                      clearText();
                    } else {
                      GeneralServices().sendSMS(_messagebody.text,
                          widget.reciver, user!.email, user!.email);
                      clearText();
                    }
                   },
                  icon: Icon(
                    Icons.send,
                    size: 30,
                    color: Colors.indigoAccent,
                  ),
                ),
              ),
                     )
                     ],),
           )
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){}),
    );
  }
}
