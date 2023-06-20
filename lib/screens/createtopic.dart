import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gulio/services/gerneralservices.dart';
import 'package:gulio/utilities/constantscolors.dart';

class CreateTopic extends StatefulWidget {
  const CreateTopic({super.key});

  @override
  State<CreateTopic> createState() => _CreateTopicState();
}

class _CreateTopicState extends State<CreateTopic> {

  final User? user = FirebaseAuth.instance.currentUser;
  TextEditingController _messagebody =TextEditingController();
  final _isLoading =false;
  desaper(){
  _messagebody.clear();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantsColors().mainColor(),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Jamii Post',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey),
                ),
                ElevatedButton(
                   onPressed: () {
                    GeneralServices().jamiiPost(_messagebody.text,user!.email,);
                    desaper();
                   }, child: Text('Tuma'))
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _messagebody,
              maxLines: 20,
              decoration: InputDecoration.collapsed(
                  hintText: 'Andika hapa',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          )
        ],
      ),
    );
  }
}
