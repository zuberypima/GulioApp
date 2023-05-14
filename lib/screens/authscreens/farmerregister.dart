// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gulio/screens/authscreens/autfunctions.dart';
import 'package:gulio/screens/select_crop_page.dart';
import 'package:gulio/utilities/constantscolors.dart';


class FarmerRegPage extends StatelessWidget {
 FarmerRegPage({Key? key}) : super(key: key);
  // User authUser =User

  @override
  Widget build(BuildContext context) {
    String _firstName='', _lastName='',_phonenumber='', _email='', _password='';
           User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      // backgroundColor: ConstantsColors().mainColor(),
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
                        _firstName=value;
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
                        _lastName=value;
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
                        _email=value;
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
                        _phonenumber=value;
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
                        _password=value;
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
                  onTap: () async{
                    await AuthFunction().signUp(_firstName,_lastName,_phonenumber,_email,_password,'Tanzaia');
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SelecteCropPage()));
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
}
