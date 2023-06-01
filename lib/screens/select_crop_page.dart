// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gulio/screens/farmerhome.dart';
import 'package:gulio/utilities/constantscolors.dart';
import 'package:gulio/widgets/cropcard.dart';

class SelecteCropPage extends StatefulWidget {
  const SelecteCropPage({super.key});

  @override
  State<SelecteCropPage> createState() => _SelecteCropPageState();
}

bool _isSelected = false;

class _SelecteCropPageState extends State<SelecteCropPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: ConstantsColors().mainColor(),
            title: const Text('Chagua Mazao')),
        body: ListView(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  border: Border.all(
                    // width: 3,
                    color: Colors.grey,
                  ),
                  // ignore: prefer_const_constructors
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              // ignore: prefer_const_constructors
              child: Center(
                // ignore: prefer_const_constructors
                child: Text(
                  'Tafadhali chagua Mazao unayojihusishanayo',
                  // ignore: prefer_const_constructors
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: 109,
                child: GridView.count(
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 2,
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  children: <Widget>[
                    SelectedCard(cardlabel:'Mahindi',imageUrl: 'assets/maize.png',color: Color.fromARGB(174, 255, 214, 64),),
                    SelectedCard(cardlabel:'Maharage',imageUrl: 'assets/beans.png',color: Color.fromARGB(153, 245, 92, 81),),
                    SelectedCard(cardlabel:'Tikiti Maji',imageUrl: 'assets/watermelon.png',color: Color.fromARGB(153, 245, 92, 81),),
                    SelectedCard(cardlabel:'Mpunga',imageUrl: 'assets/rice.png',color: Color.fromARGB(153, 220, 245, 81),),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FarmerPage()));
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
                    'Endelea',
                    style: TextStyle(
                        fontSize: ConstantsColors().textSizeOne,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
