// ignore_for_file: avoid_unnecessary_containers

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gulio/screens/messages.dart';
import 'package:gulio/services/gerneralservices.dart';
import 'package:gulio/utilities/constantscolors.dart';
import 'package:gulio/widgets/formfildone.dart';
import 'package:image_picker/image_picker.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

final picker = ImagePicker();
File? _imageFile;
CollectionReference cropsposted =
    FirebaseFirestore.instance.collection('Usersss');
// String _bei = "";
TextEditingController _bei = TextEditingController();
// String _kipimo = "";
TextEditingController _kipimo = TextEditingController();
TextEditingController _stock = TextEditingController();
bool isLoading = false;

void dispose() {
  // Clean up the controller when the widget is disposed
  _bei.clear();
  _kipimo.clear();
  _stock.clear();
}

String _initialkipimo = "Chagua Kipimo";
String? _selectedItem;
String? _mazao;

List<String> _items = [
  'Kilogram',
  'Debe',
  'Gunia',
];

List<String> _mazaoList = [
  'Mahindi',
  'Mchele',
  'Maharage',
  'Ufuta',
  'Mtama',
  'Kahawa',
  'Chai'
];

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uza Mazao yako'),
        elevation: 0,
        backgroundColor: ConstantsColors().mainColor(),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              child: _imageFile == null
                  ? IconButton(
                      onPressed: () async {
                        _pickImage();
                      },
                      icon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Gusa hapa kuweka picha,',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 60,
                          ),
                        ],
                      ))
                  : Image.file(_imageFile!),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 10, right: 10),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         'Mazao',
          //         style: TextStyle(
          //             fontSize: 18,
          //             fontWeight: FontWeight.w500,
          //             color: Colors.blueGrey),
          //       ),
          //       TextFormField(
          //         controller: _bei,
          //         keyboardType: TextInputType.number,
          //         decoration: InputDecoration(
          //             enabledBorder: OutlineInputBorder(),
          //             focusedBorder: OutlineInputBorder()),
          //       ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButton<String>(
                hint: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Chagua Zao'),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                value: _mazao,
                onChanged: (value) {
                  setState(() {
                    _mazao = value;
                  });
                },
                items: _mazaoList.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 100, left: 10),
                      child: Text(
                        item,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bei',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),
                ),
                Container(
                  height: 40,
                  child: TextFormField(
                    controller: _bei,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButton<String>(
                hint: Text('Chagua Kipimo'),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                value: _selectedItem,
                onChanged: (value) {
                  setState(() {
                    _selectedItem = value;
                  });
                },
                items: _items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item, style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kiasi Kilichopo',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey),
                  ),
                  Container(
                    height: 40,
                    child: TextFormField(
                      controller: _stock,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                String imageUrl =
                    await GeneralServices().uploadImageToFirebase(_imageFile!);
                GeneralServices().postCrop(_bei.text, _selectedItem.toString(),
                    user!.email, _stock.text, imageUrl);

                setState(() {
                  isLoading = false;
                  dispose();
                });
              },
              child: Container(
                width: 130,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.cyan,
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: isLoading
                        ? CircularProgressIndicator()
                        : Text(
                            'Uza',
                            style: TextStyle(
                                fontSize: ConstantsColors().textSizeOne,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Pick image for garlary
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }
}
