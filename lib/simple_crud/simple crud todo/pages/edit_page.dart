import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as fstorage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditPage1 extends StatefulWidget {
  const EditPage1({Key? key}) : super(key: key);

  @override
  State<EditPage1> createState() => _EditPage1State();
}

class _EditPage1State extends State<EditPage1> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _username = TextEditingController();
    TextEditingController _title = TextEditingController();
    TextEditingController _description = TextEditingController();
    TextEditingController id = TextEditingController();

    final firebase = FirebaseFirestore.instance;

    update() async {
      try {
        await firebase.collection("todo1").doc(id.text).update({
          "username": _username.text,
          "title": _title.text,
          "description": _description.text,
        });
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
            height: 1240,
            child: Column(children: [
              Container(
                height: 900,
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: firebase.collection("todo1").snapshots(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              QueryDocumentSnapshot ss =
                                  snapshot.data!.docs[index];
                              return Container(
                                height: 900,
                                child: Column(children: [
                                  _buildtextField(
                                    title: ss["User_id" ]+ " is your Uniqu id which can never change so please enter " + ss["User_id" ],
                                    controll: id,
                                    line: 1,
                                    bo: false,
                                  ),
                                  _buildtextField(
                                      title: ss["username"],
                                      controll: _username,
                                      bo: false,
                                      line: 1),
                                  _buildtextField(
                                      title: ss["title"],
                                      controll: _title,
                                      bo: false,
                                      line: 1),
                                  _buildtextField(
                                      title: ss["description"],
                                      controll: _description,
                                      bo: false,
                                      line: 4),
                                  SizedBox(height: 30),
                                  FlatButton(
                                    onPressed: () {
                                      if(id == ss["User_id"]){
                                        update();


                                      }
                                      else{
                                        alertDialog(context);

                                      }
                                    
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (c) => EditPage1()));
                                        _username.clear();
                                        _title.clear();
                                        _description.clear();
                                      
                                    },
                                    child: Text("Update"),
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ]),
                              );
                            });
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ]),
          ),
        ));
  }

  Padding _buildtextField({title, controll, line, fix, bo}) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 20, right: 20),
      child: TextFormField(
        readOnly: bo,
        maxLines: line,
        controller: controll,
        decoration: InputDecoration(
          prefixText: fix,
          labelText: title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  alertDialog(BuildContext context) {
    TextEditingController id = TextEditingController();
    final firebase = FirebaseFirestore.instance;

    delete() async {
      try {
        await firebase.collection("todo1").doc(id.text).delete();
      } catch (e) {
        print(e);
      }
    }

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title:Text("Wrong user id"),
          
          );
        });
  }
}
