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
                        trailing:data['Status']=='Pending'? Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            border: Border.all(width: 2,color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(child: Text(data['Status'],style: TextStyle(fontSize: 16,color: Colors.white))),):
                          Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(width: 2,color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(child: Text(data['Status'],style: TextStyle(fontSize: 16,color: Colors.white))),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text('Kiasi Kinachohitajika ::',style: TextStyle(
                                fontSize: 16,fontWeight: FontWeight.w500
                              ),),
                              SizedBox(width: 10,),
                              Text(data['Kiasi'].toString(),style: TextStyle(fontSize: 16),),
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
                                       GeneralServices().makingPhoneCall('07456789');
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
                                  onTap: () {;
                                  GeneralServices().updateOrder(document.id);
                                    //int updateStock = int.parse(data['Maelezo']) +int.parse(data['Maelezo']) ;
                                    GeneralServices().getPostDetails(data['Farmer'],data['Kiasi']);
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
                                child: InkWell(
                                  onTap: () {
                                    GeneralServices().rejectOrder(document.id);
                                  },
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
