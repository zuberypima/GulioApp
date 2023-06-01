import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gulio/providers/userdata.dart';
import 'package:gulio/screens/makeoderscreen.dart';
import 'package:gulio/utilities/constantscolors.dart';
import 'package:gulio/widgets/productcard.dart';
import 'package:provider/provider.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _userposts = FirebaseFirestore.instance
        .collection('Posts')
        .snapshots();
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: ConstantsColors().mainColor(),
          elevation: 0,
          title: Center(child: Text('Sokoni')),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _userposts,
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
                  padding: const EdgeInsets.only(left: 10, right: 10,top:10),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: BoxDecoration(
                      color: 
                      Colors.white,
                      border: Border.all( color: 
                      Colors.white,),
                      borderRadius: BorderRadius.circular(
                        10
                      )
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/beans.png'),
                        )),),
                        Divider(),
                        ListTile(
                          title: Text(data['Bei']),
                          subtitle: Text(data['Kipimo']),
                          trailing:ElevatedButton(onPressed: (){
                            
                             // UserDetails().bidhaaname(data['Bei']);
                             Provider.of<UserDetails>(context,listen:false).bidhaaname(data['Bei']);
                            
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MakeOrderPage()));
                          }, child:Text('Oda'))
                        ),
                        
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
 
          // ProductCard(
          //   imageUrl: 'assets/beans.png',
          //   productlabel: 'Mahindi',
          //   pricelable: '11000 Tsh/Kg',
          // ),
          // ProductCard(
          //   imageUrl: 'assets/coffee.jpg',
          //   productlabel: 'Kahawa',
          //   pricelable: '11000 Tsh/Kg',
          // ),
          // ProductCard(
          //   imageUrl: 'assets/watermelon.png',
          //   productlabel: 'Mahindi',
          //   pricelable: '11000 Tsh/Kg',
          // ),
          // ProductCard(
          //   imageUrl: 'assets/tomato.png',
          //   productlabel: 'Mahindi',
          //   pricelable: '11000 Tsh/Kg',
          // ),