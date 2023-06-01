// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gulio/screens/authscreens/autfunctions.dart';
import 'package:gulio/screens/select_crop_page.dart';
import 'package:gulio/utilities/constantscolors.dart';

class FarmerRegPage extends StatefulWidget {
  FarmerRegPage({Key? key}) : super(key: key);

  @override
  State<FarmerRegPage> createState() => _FarmerRegPageState();
}

class _FarmerRegPageState extends State<FarmerRegPage> {
  // User authUser =User
  final FirebaseAuth auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    String _firstName = '',
        _lastName = '',
        _phonenumber = '',
        _email = '',
        _password = '';
    User? user = FirebaseAuth.instance.currentUser;

    bool _isLoading = false;
    return Scaffold(
      // backgroundColor: ConstantsColors().mainColor(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstantsColors().mainColor(),
        title: Text('Usajili wa Mkulima'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 0, 5),
                    child: Text(
                      'Jina la Kwanza',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    color: Colors.white,
                    child: TextFormField(
                      onChanged: (value) {
                        _firstName = value;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        hintText: 'Juma ',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 0, 5),
                    child: Text(
                      'Jina la Mwisho',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    color: Colors.white,
                    child: TextFormField(
                      onChanged: (value) {
                        _lastName = value;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        hintText: 'Kilungi',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 0, 5),
                    child: Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    color: Colors.white,
                    child: TextFormField(
                      onChanged: (value) {
                        _email = value;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 0, 5),
                    child: Text(
                      'Number ya Simu',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    color: Colors.white,
                    child: TextFormField(
                      onChanged: (value) {
                        _phonenumber = value;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        hintText: '+255 67 890 786',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 0, 5),
                    child: Text(
                      'Neno la Siri',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    color: Colors.white,
                    child: TextFormField(
                      obscureText: true,
                      onChanged: (value) {
                        _password = value;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        hintText: '**********',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 0, 5),
                    child: Text(
                      'Rudia Neno la Siri',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    color: Colors.white,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        hintText: '******',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
              child: Center(
                  child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SelecteCropPage()));
                },
                child: InkWell(
                  onTap: () async {
                    // await AuthFunction().signUp(_firstName,_lastName,_phonenumber,_email,_password,'Tanzaia');
                  //  setState(() {
                   //   _isLoading = true;
                   // });
                  //  _loadingIndicator(_isLoading);
                   // await signUp(_firstName, _lastName, _phonenumber, _email,
                       // _password,'Tanzania','Mkulima');
                    await AuthFunction().signUp(_firstName,_lastName,_email,_phonenumber,
                       _password,'Mkulima','Tanzania');
                    //setState(() {
                     // _isLoading = false;
                   // });
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
                        'Sajili',
                        style: TextStyle(
                            fontSize: ConstantsColors().textSizeOne,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }

  signUp(
    String firstName,
    lastName,
    phonenumber,
    email,
    password,
    userlocation,
    role
  ) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

     await userDataCollections(
          firstName, lastName, phonenumber, email, role, userlocation);
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SelecteCropPage()));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  userDataCollections(String _firstName,_lastName, _email, _phonenumber,
      _userrole, userlocation) async {
    User? userAuth = auth.currentUser;
    if (userAuth != null) {
      await _firestore.collection('Users').doc(userAuth.email).set({
        "name": "$_firstName $_lastName",
        "email": _email,
        "phone": _phonenumber,
        "userrole": _userrole,
        "location": userlocation,
        'Crops': 'Mazao 1'
      });
    }
  }

  _loadingIndicator(bool isactive) {
    if (isactive) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Tafadhali Subiri'),
            content: Container(
              height: MediaQuery.of(context).size.height / 5,
              child: Center(
                  child: CircularProgressIndicator(
                color: ConstantsColors().mainColor(),
              )),
            ),
            actions: [
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Tafadhali Subiri'),
            content: Container(
              child: Text("Please check your conection"),
            ),
            actions: [
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
