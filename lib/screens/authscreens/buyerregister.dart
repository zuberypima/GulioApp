
import 'package:flutter/material.dart';
import 'package:gulio/screens/authscreens/autfunctions.dart';
import 'package:gulio/screens/select_crop_page.dart';
import 'package:gulio/utilities/constantscolors.dart';


class BuyerRegPage extends StatelessWidget {
  const BuyerRegPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      'First Name',
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
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        hintText: 'First Name',
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
                      'Last Name',
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
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        hintText: 'Last Name',
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
                      'Phone Number',
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
                      'Wilaya',
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
                      'Mkoa',
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
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        hintText: 'eg.Tanga',
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SelecteCropPage()));
                },
                child: InkWell(
                  onTap: () {
                    // AuthFunction().signUp('', '');
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
