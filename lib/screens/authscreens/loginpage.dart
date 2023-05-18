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
    // String _email = '';
    // String _password = '';

    final _email = TextEditingController();
    final _password = TextEditingController();
    bool isLoading = false;
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
          Padding(
            padding: const EdgeInsets.all(10),
            child: FormFieldOne(
              hintText: 'Barua pepe',
              textContoler: _email,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: FormFieldOne(
              hintText: 'Neeo la Siri',
              textContoler: _password,
            ),
          ),
          Center(
              child: InkWell(
            onTap: () async {
              setState(() {
                isLoading = true;
                _loadingIndicator(isLoading);
              });
              try {
                await AuthFunction()
                    .login(context, _email.text, _password.text);
              } catch (e) {
               
                print(e);
              }
               setState(() {
                  isLoading = false;
                  _loadingIndicator(isLoading);
                }
                );
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

  // Loading Indicator

  _loadingIndicator(bool isactie) {
    if (isactie == true) {
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
              child: Text("Verify"),
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
