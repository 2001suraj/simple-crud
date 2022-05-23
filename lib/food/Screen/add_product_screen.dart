import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fstorage;

class AddProductScreen1 extends StatefulWidget {
  AddProductScreen1({Key? key}) : super(key: key);

  @override
  State<AddProductScreen1> createState() => _AddProductScreen1State();
}

class _AddProductScreen1State extends State<AddProductScreen1> {
  TextEditingController productNameController = TextEditingController();

  TextEditingController productPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    XFile? imageXFile;
    final ImagePicker _picker = ImagePicker();

    Future selectFile() async {
      imageXFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        imageXFile;
      });

      String sellerurl = "";
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      fstorage.Reference reference =
          fstorage.FirebaseStorage.instance.ref().child("img").child(fileName);
      fstorage.UploadTask uploadTask =
          reference.putFile(File(imageXFile!.path));
      fstorage.TaskSnapshot taskSnapshot =
          await uploadTask.whenComplete(() => null);
      await taskSnapshot.ref.getDownloadURL().then((url) {
        sellerurl = url;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Add product"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: productNameController,
              decoration: InputDecoration(
                  labelText: "Product name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: productPriceController,
              decoration: InputDecoration(
                  labelText: "Product Price",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          GestureDetector(
            onTap: () {
              selectFile();
            },
            child:CircleAvatar(radius: 60,backgroundColor:Colors.amber,child:Text("Select an image"))
          )
        ],
      ),
    );
  }
}
