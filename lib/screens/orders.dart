import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gulio/screens/messages.dart';
import 'package:gulio/utilities/constantscolors.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  @override
  Widget build(BuildContext context) {
       final Stream<QuerySnapshot> _odersStream = FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.email)
        .collection('Messages')
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantsColors().mainColor(),
        title: Text('Orders'),
      ),
      body: StreamBuilder<QuerySnapshot>(
      stream: _odersStream,
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
            return  Card(
              child: ListTile(
               minVerticalPadding: 5.0,
                title: Text('Juma Shabani'),
                subtitle: Row(children: [Text('Bei'),SizedBox(width: 10,),Text('10000')],),
                trailing: Icon(Icons.forward),
              ),
            );
          }).toList(),
        );
      },
    )
    );
  }
}



