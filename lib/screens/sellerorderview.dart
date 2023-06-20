import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gulio/screens/messages.dart';
import 'package:gulio/services/gerneralservices.dart';
import 'package:gulio/utilities/constantscolors.dart';

class SelerOrders extends StatefulWidget {
  const SelerOrders({super.key});

  @override
  State<SelerOrders> createState() => _SelerOrdersState();
}

class _SelerOrdersState extends State<SelerOrders> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _odersStream = FirebaseFirestore.instance
        .collection('OrderPres')
        .where('Farmer', isEqualTo: user!.email)
        .snapshots();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 224, 224),
        appBar: AppBar(
          backgroundColor: ConstantsColors().mainColor(),
          title: Text('Orders'),
          elevation: 0,
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
                return InkWell(
                  onTap: () {},
                  child: Card(
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
                                    onPressed: () {},
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
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => Messages(
                                                      reciver: data['Buyer'],
                                                      pagefrom: 'Farmer',
                                                    )));
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
                                    GeneralServices().updateStock(data['Maelezo']);
                                  },
                                  child: Container(
                                    width: 70,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        border: Border.all(
                                            width: 2, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Center(child: Text('Pokea',style:TextStyle(color:Colors.white))),
                                  ),
                                ),
                              ),
                               Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: 60,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      border: Border.all(
                                          width: 2, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(child: Text('Kataa',style:TextStyle(color:Colors.white,))),
                                ),
                              ),
                            ])
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}
