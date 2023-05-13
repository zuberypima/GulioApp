import 'package:flutter/material.dart';


class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // ignore: prefer_const_constructors
          DrawerHeader(
           child: Row(children: [
            CircleAvatar(radius: 40,),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
              child: Column(children: [
                Text('Mr Mkulima '),
                Text('mkulima@gamil.com')

              ],),
            )
           ],),
          ),
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
        ],
      ),);
  }
}