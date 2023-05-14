import 'package:flutter/material.dart';
import 'package:gulio/screens/authscreens/accounttypepage.dart';
import 'package:gulio/screens/authscreens/autfunctions.dart';
import 'package:gulio/screens/homepage.dart';
import 'package:gulio/utilities/constantscolors.dart';
import 'package:gulio/widgets/formfildone.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    return Scaffold(
      // backgroundColor: ConstantsColors().mainColor(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 4),
                  borderRadius: BorderRadius.circular(100)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('assets/applogo.png'),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: FormFieldOne(
          //     hintText: 'Barua pepe',
          //     textContoler: email,
          //   ),
          // ),
          Container(
            height: 45,
            color: Colors.white,
            child: TextFormField(
              // controller: widget.textContoler,
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: InputDecoration(
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 2)),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 2)),
                  hintText: 'Email Address'),
            ),
          ),
                Container(
            height: 45,
            color: Colors.white,
            child: TextFormField(
              obscureText: true,
              // controller: widget.textContoler,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: InputDecoration(
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 2)),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 2)),
                  hintText: 'Password'),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: FormFieldOne(
          //     hintText: 'Neeo la Siri',
          //     textContoler: password,
          //   ),
          // ),
          Center(
              child: InkWell(
            onTap: () {
              AuthFunction().login(context, email, password);
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
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
                  'Ingia',
                  style: TextStyle(
                      fontSize: ConstantsColors().textSizeOne,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )),
          Container(
            height: 40,
            width: 78,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Hapana bado sijajisajili  !"),
                TextButton(
                    onPressed: (() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SelectAccountType()));
                    }),
                    child: const Text(
                      'Jisajili',
                      style: TextStyle(fontSize: 16),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
