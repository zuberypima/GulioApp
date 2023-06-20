import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gulio/providers/userdata.dart';
import 'package:gulio/screens/createtopic.dart';
import 'package:gulio/screens/makeoderscreen.dart';
import 'package:gulio/utilities/constantscolors.dart';
import 'package:provider/provider.dart';

class JamiiPage extends StatefulWidget {
  const JamiiPage({super.key});

  @override
  State<JamiiPage> createState() => _JamiiPageState();
}

class _JamiiPageState extends State<JamiiPage> {
  final Stream<QuerySnapshot> _jamiiposts =
      FirebaseFirestore.instance.collection('JamiiPosts').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 207, 202, 202),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstantsColors().mainColor(),
        title: Text('Mada na Maswali'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _jamiiposts,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Container(
                  
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['Poster']),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data['body'],
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 19, 66, 90)),
                          ),
                        ),
                        Divider(),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_border_outlined,color: Colors.blueGrey,),
                                )),
                             IconButton(
                                onPressed: () {},
                                icon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.comment_outlined,color: Colors.blueGrey,),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ConstantsColors().mainColor(),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreateTopic()));
        },
        child: Text('Post'),
      ),
    );
  }
}
