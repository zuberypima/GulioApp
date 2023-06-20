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
TextEditingController _stock =TextEditingController();
bool isLoading = false;

void dispose() {
  // Clean up the controller when the widget is disposed
  _bei.clear();
  _kipimo.clear();
  _stock.clear();
}

String? _selectedItem;

List<String> _items = [
  'Kilogram',
  'Debe',
  'Gunia',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            // child: FormFieldOne(hintText:'Aina ya zao lako',textContoler: , ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            // child: FormFieldOne(hintText: 'Locatio',textContoler: '',),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            // child: FormFieldOne(hintText: 'Bei kwa kilo',textContoler:'Hello',),
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
                TextFormField(
                  controller: _bei,
                  keyboardType: TextInputType.number,
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
                  'Kipimo',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),
                ),
                // TextFormField(
                //   controller: _kipimo,
                //   onChanged: (value) {

                //   },
                // ),
                DropdownButton<String>(
                  value: _selectedItem,
                  onChanged: (value) {
                    setState(() {
                      _selectedItem = value;
                    });
                  },
                  items: _items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                ),SizedBox(height: 5,
                ),
                Text(
                  'Kiasi Kilichopo',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),
                ),
                TextFormField(
                  controller: _stock,
                  keyboardType: TextInputType.number,
                ),
              ],
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
                GeneralServices()
                    .postCrop(_bei.text,_selectedItem.toString(), user!.email,_stock.text, imageUrl);

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
