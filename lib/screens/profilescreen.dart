import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gulio/screens/authscreens/autfunctions.dart';
import 'package:gulio/screens/authscreens/loginpage.dart';
import 'package:gulio/utilities/constantscolors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstantsColors().mainColor(),
        title: Text("Profile"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: CircleAvatar(
                radius: 60,
                child: Icon(
                  Icons.person,
                  size: 60,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder<DocumentSnapshot>(
              future: users.doc(user!.email).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return Text("Document does not exist");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return ListView(
                    children: [
                      Center(
                          child: Text(
                        data['name'],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )),
                      Center(
                          child: Text(
                        data['email'],
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )),
                      Divider(
                        color: Colors.black,
                      ),
                      // Divider(
                      //   color: Colors.black,
                      // ),
                      ListTile(
                        leading: Icon(Icons.home),
                        title: Text('Nyumbani'),
                        onTap: () => {},
                      ),
                      ListTile(
                        leading: Icon(Icons.verified_user),
                        title: Text('Profile'),
                        onTap: () => {Navigator.of(context).pop()},
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Mazao Yangu'),
                        onTap: () => {Navigator.of(context).pop()},
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=))
                        },
                        child: ListTile(
                          leading: Icon(Icons.border_color),
                          title: Text('Oder Zangu'),
                          onTap: () => {Navigator.of(context).pop()},
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text('Makazi'),
                        onTap: () => {Navigator.of(context).pop()},
                      ),
                      InkWell(
                        onTap: (){
                         AuthFunction().logOut();
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage(
                         )));
                        },
                        child: ListTile(
                          leading: Icon(Icons.exit_to_app),
                          title: Text('Logout'),
                        ),
                      ),
                    ],
                  );
                }

                return Text("loading");
              },
            ),
          ),
        ],
      ),
    );
  }
}
