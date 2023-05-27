import 'package:flutter/material.dart';
import 'package:gulio/screens/messages.dart';
import 'package:gulio/utilities/constantscolors.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantsColors().mainColor(),
        title: Text('Orders'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Messages()));
            },
            child: Card(
              child: ListTile(
               minVerticalPadding: 5.0,
                title: Text('Juma Shabani'),
                subtitle: Row(children: [Text('Bei'),SizedBox(width: 10,),Text('10000')],),
                trailing: Icon(Icons.forward),
              ),
            ),
          );
        },
      ),
    );
  }
}