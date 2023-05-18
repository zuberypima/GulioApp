import 'package:flutter/material.dart';
import 'package:gulio/utilities/constantscolors.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstantsColors().mainColor(),
        title: Text("Profile"),),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: CircleAvatar(radius: 60,child: Icon(Icons.person,size: 60,),),
                  
            
            ),
            
          ),
          Center(child: Text('Mr Kuku Mkulima',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)),
          Center(child: Text('test@email.com',style: TextStyle(fontSize: 15,),)),
          Divider(color: Colors.black,),
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
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Oder Zangu'),
            onTap: () => {Navigator.of(context).pop()},
          ),
           ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Makazi'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],),
    );
  }
}
