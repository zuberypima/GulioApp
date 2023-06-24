import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gulio/screens/messages.dart';
import 'package:gulio/services/gerneralservices.dart';
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
        .collection('OrderPres').where('Buyer',isEqualTo: user!.email)
        .snapshots();
  return Scaffold(
        appBar: AppBar(
          backgroundColor: ConstantsColors().mainColor(),
          title: Text('Orders'),
          automaticallyImplyLeading: false,
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
                  child: Column(
                    children: [
                      ListTile(
                        minVerticalPadding: 5.0,
                        title: Text(data['Buyer']),
                        subtitle: Row(
                          children: [
                            Text('Bei'),
                            SizedBox(
                              width: 10,
                            ),
                            Text(data['ofa'])
                          ],
                        ),
                       
                      ),
                       Divider( color: Colors.black26),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: 70,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    border: Border.all(
                                        width: 2, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                  onPressed: () {
                                    GeneralServices().makingPhoneCall();
                                  },
                                  icon: Icon(
                                    Icons.phone_enabled,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: 70,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    border: Border.all(
                                        width: 2, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {
                                       Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Messages(reciver: data['Farmer'],pagefrom: 'BuyerPage',)));
                                    },
                                    icon: Icon(
                                      Icons.sms,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                           
                             Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () {
                                    GeneralServices().deleteOder(data['Buyer']);
                                  },
                                  child: Container(
                                    width: 60,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        border: Border.all(
                                            width: 2, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Center(child: Text('Futa',style:TextStyle(color:Colors.white,))),
                                  ),
                                ),
                              ),
                          ])
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}
