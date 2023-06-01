import 'package:flutter/material.dart';
import 'package:gulio/providers/userdata.dart';
import 'package:gulio/services/gerneralservices.dart';
import 'package:gulio/utilities/constantscolors.dart';
import 'package:provider/provider.dart';

class MakeOrderPage extends StatefulWidget {
  const MakeOrderPage({super.key});

  @override
  State<MakeOrderPage> createState() => _MakeOrderPageState();
}

TextEditingController _offer = TextEditingController();
TextEditingController _details = TextEditingController();

class _MakeOrderPageState extends State<MakeOrderPage> {
  @override
  Widget build(BuildContext context) {
    final _selectedbidhaa = Provider.of<UserDetails>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantsColors().mainColor(),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 30),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: ConstantsColors().mainColor(),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Muuzaji:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('Juma Mgunda',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 30),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone_in_talk_outlined,
                            color: ConstantsColors().mainColor(),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Simu:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('+255 718934183',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 30),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: ConstantsColors().mainColor(),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Bei:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('11000/Kg',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 30),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: ConstantsColors().mainColor(),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Zao:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('Karoti',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 30),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: ConstantsColors().mainColor(),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Location:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('Juma Mgunda',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ofa Yangu',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),
                ),
                Divider(),
                TextFormField(
                  controller: _offer,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Maelezo mafupi',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),
                ),
                Divider(),
                TextFormField(
                  controller: _details,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MakeOrderPage()));
                GeneralServices().oderpressed(
                    _offer.text, _details.text, 
                    // _selectedbidhaa.toString()
                    'test1','test2',
                    );
                    print(_selectedbidhaa);
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
                    'Weka Oda',
                    style: TextStyle(
                        fontSize: ConstantsColors().textSizeOne,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
