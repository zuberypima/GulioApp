import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gulio/screens/messages.dart';
import 'package:gulio/utilities/constantscolors.dart';

class BuyerOrders extends StatefulWidget {
  const BuyerOrders({super.key});

  @override
  State<BuyerOrders> createState() => _BuyerOrdersState();
}

class _BuyerOrdersState extends State<BuyerOrders> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _odersStream = FirebaseFirestore.instance
        .collection('OrderPres').where('Sender',isEqualTo: user!.email)
        .snapshots();
  return Scaffold(
        appBar: AppBar(
          backgroundColor: ConstantsColors().mainColor(),
          title: Text('Orders'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _odersStream,
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
                return Card(
                  child: ListTile(
                    minVerticalPadding: 5.0,
                    title: Text(data['Sender']),
                    subtitle: Row(
                      children: [
                        Text('Bei'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(data['ofa'])
                      ],
                    ),
                    trailing: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Messages(reciver: data['Reciver'],)));
                        },
                        child: Icon(Icons.forward)),
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}
