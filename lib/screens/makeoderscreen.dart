import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gulio/providers/userdata.dart';
import 'package:gulio/screens/messages.dart';
import 'package:gulio/services/gerneralservices.dart';
import 'package:gulio/utilities/constantscolors.dart';
import 'package:gulio/widgets/displayedcrop.dart';
import 'package:provider/provider.dart';

class MakeOrderPage extends StatefulWidget {
  //String selerphone;
  String bei;
  //String zao;
  String seleremail;

  MakeOrderPage({super.key, required this.seleremail,required this.bei});

  @override
  State<MakeOrderPage> createState() => _MakeOrderPageState();
}

TextEditingController _offer = TextEditingController();
TextEditingController _details = TextEditingController();
final User? user = FirebaseAuth.instance.currentUser;
bool isLoading = false;

class _MakeOrderPageState extends State<MakeOrderPage> {
  @override
  Widget build(BuildContext context) {
    final _selectedbidhaa = Provider.of<UserDetails>(context);
    CollectionReference selectedPost =
        FirebaseFirestore.instance.collection('Posts');

    //     QuerySnapshot querySnapshot = await firestore
    // .collection('your_collection_name')
    // .where(fieldName, isEqualTo: fieldValue)
    // .limit(1)
    // .get();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantsColors().mainColor(),
        elevation: 0,
      ),
      body: ListView(
        children: [
          DisplayedCrop(
            farmeremail:widget.seleremail,
            bei: widget.bei,
          ), 
          // DisplayedCrop(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ofa Yangu',
                  style: TextStyle(
                   
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),
                ),
                const Divider(),
                TextFormField(
                  controller: _offer,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kiasi Unachohitaji',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),
                ),
                const Divider(),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _details,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                await GeneralServices().oderpressed(
                  _offer.text,
                  _details.text,
                  widget.seleremail,
                  user!.email
                );

                setState(() {
                  isLoading = false;
                });
              },
              child: 
                   Container(
                      width: 130,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child:isLoading
                  ? CircularProgressIndicator(): Text(
                          'Weka Oda',
                          style: TextStyle(
                              fontSize: ConstantsColors().textSizeOne,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
