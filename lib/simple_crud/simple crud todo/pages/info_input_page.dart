import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/simple_crud/simple%20crud%20todo/pages/edit_page.dart';
import 'package:crud/simple_crud/simple%20crud%20todo/simple_todo.dart';
import 'package:firebase_storage/firebase_storage.dart' as fstorage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InfoInputPage1 extends StatefulWidget {
  const InfoInputPage1({Key? key}) : super(key: key);

  @override
  State<InfoInputPage1> createState() => _InfoInputPage1State();
}

class _InfoInputPage1State extends State<InfoInputPage1> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _username = TextEditingController();
    TextEditingController _title = TextEditingController();
    TextEditingController _description = TextEditingController();
    TextEditingController id = TextEditingController();

    final firebase = FirebaseFirestore.instance;

    create() async {
      try {
        await firebase.collection("todo1").doc(id.text).set({
          "User_id": id.text,
          "username": _username.text,
          "title": _title.text,
          "description": _description.text,
        });
      } catch (e) {
        print(e);
      }
    }

    delete() async {
      try {
        await firebase.collection("todo1").doc(id.text).delete();
      } catch (e) {
        print(e);
      }
    }

    XFile? imageXFile;
    final ImagePicker _picker = ImagePicker();

    Future selectFile() async {
      imageXFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        imageXFile;
      });

      String sellerurl = "";
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      fstorage.Reference reference = fstorage.FirebaseStorage.instance
          .ref()
          .child("seller")
          .child(fileName);
      fstorage.UploadTask uploadTask =
          reference.putFile(File(imageXFile!.path));
      fstorage.TaskSnapshot taskSnapshot =
          await uploadTask.whenComplete(() => null);
      await taskSnapshot.ref.getDownloadURL().then((url) {
        sellerurl = url;
      });
    }

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            height: 900,
            child: Column(children: [
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  selectFile();
                },
                child: CircleAvatar(
                  // radius: 70,
                   
                  // backgroundImage: imageXFile == null
                  //     ? null
                  //     : FileImage(
                  //         File(imageXFile!.path),
                  //       ),
                  radius: MediaQuery.of(context).size.width * 0.20,
                backgroundColor: Color.fromARGB(255, 235, 48, 48),
                    backgroundImage:imageXFile == null ? null : FileImage(File(imageXFile!.path)),
                child: imageXFile == null
                    ? Icon(Icons.add_photo_alternate,
                        size: MediaQuery.of(context).size.width * 0.20,
                        color: Colors.grey)
                    : null,
                ),
              ),
            
              _buildtextField(title: "User Id", controll: id, line: 1),
              _buildtextField(title: "UserName", controll: _username, line: 1),
              _buildtextField(title: "Title", controll: _title, line: 1),
              _buildtextField(
                  title: "Description", controll: _description, line: 4),
              SizedBox(height: 30),
              FlatButton(
                onPressed: () {
                  create();
                   Navigator.push(
            context, MaterialPageRoute(builder: (c) => SimpleTodo1()));
                  id.clear();
                  _username.clear();
                  _title.clear();
                  _description.clear();
                },
                child: Text("save"),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
             
              
            ]),
          ),
        ));
  }

  Padding _buildtextField({title, controll, line}) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 20, right: 20),
      child: TextField(
        maxLines: line,
        controller: controll,
        decoration: InputDecoration(
          labelText: title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
