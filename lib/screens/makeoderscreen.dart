import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gulio/providers/userdata.dart';
import 'package:gulio/services/gerneralservices.dart';
import 'package:gulio/utilities/constantscolors.dart';
import 'package:gulio/widgets/displayedcrop.dart';
import 'package:provider/provider.dart';

class MakeOrderPage extends StatefulWidget {
  String selerphone;
  String price;
  String zao;
  String location;
  MakeOrderPage({super.key,required this.selerphone,required this.price,required this.zao,required this.location});

  @override
  State<MakeOrderPage> createState() => _MakeOrderPageState();
}

TextEditingController _offer = TextEditingController();
TextEditingController _details = TextEditingController();

class _MakeOrderPageState extends State<MakeOrderPage> {
  @override
  Widget build(BuildContext context) {
    final _selectedbidhaa = Provider.of<UserDetails>(context);
       CollectionReference selectedPost = FirebaseFirestore.instance.collection('Posts');

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
         DisplayedCrop(farmeremail:'Bei',), // DisplayedCrop(),
       
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ofa Yangu',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),
                ),
                Divider(),
                TextFormField(
                  controller: _offer,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Maelezo mafupi',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),
                ),
                Divider(),
                TextFormField(
                  controller: _details,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MakeOrderPage()));
                GeneralServices().oderpressed(
                    _offer.text, _details.text, 
                    // _selectedbidhaa.toString()
                    'test1','test2',
                    );
                    print(_selectedbidhaa);
              },
              child: Container(
                width: 130,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.cyan,
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
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
