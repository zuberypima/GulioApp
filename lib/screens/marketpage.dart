import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gulio/utilities/constantscolors.dart';
import 'package:gulio/widgets/productcard.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  final User? user =FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _userposts =FirebaseFirestore.instance.collection("Users").doc(user!.email).collection('Posts').snapshots();
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: ConstantsColors().mainColor(),
        elevation: 0,
        title: Center(child: Text('Sokoni')),
      ),
      body: StreamBuilder<QuerySnapshot>(
      stream: _userposts,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
             final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: documents.length,
          itemBuilder: (BuildContext context, int index) {
          final items = documents[index].data();
            return ProductCard(
            imageUrl: 'assets/maize.png',
            productlabel:'1000',
            pricelable: '11000 Tsh/Kg',
          );
          },
        );

        // return ListView(
        //   children: snapshot.data!.docs.map((DocumentSnapshot document) {
        //   Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        //     return ListTile(
        //       title: Text('full_name'),
        //       subtitle: Text('company'),
        //     );
        //   }).toList(),
        // );
        },
      ),
    );
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