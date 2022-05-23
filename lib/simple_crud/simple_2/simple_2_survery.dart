import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/simple_crud/simple_2/info_screen.dart';
import 'package:flutter/material.dart';


class HomePage3 extends StatelessWidget {
  const HomePage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    TextEditingController _email = TextEditingController();
    TextEditingController _address = TextEditingController();
    TextEditingController _age = TextEditingController();
    TextEditingController _phone = TextEditingController();
    TextEditingController _education = TextEditingController();
    final firebase = FirebaseFirestore.instance;
    int id;

    create() async {
      try {
        firebase.collection("Survey").doc(_email.text).set({
          "pname": _name.text,
          "pemail": _email.text,
          "paddress": _address.text,
          "page": _age.text,
          "pphone": _phone.text,
          "peducation": _education.text,
        });
      } catch (e) {
        print(e);
      }
    }

    delete() async {
      try {
        firebase.collection("Survey").doc(_email.text).delete();
      } catch (e) {
        print(e);
      }
    }

    update() async {
      try {
        firebase.collection("Survey").doc(_email.text).update({
          "pname": _name.text,
          "pemail": _email.text,
          "paddress": _address.text,
          "page": _age.text,
          "pphone": _phone.text,
          "peducation": _education.text,
        });
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("Survey")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 15, right: 15),
          child: Column(
            children: [
              _buildtextfield(Pname: "Name", controll: _name),
              _buildtextfield(Pname: "E_mail", controll: _email),
              _buildtextfield(Pname: "Address", controll: _address),
              _buildtextfield(Pname: "Age", controll: _age),
              _buildtextfield(
                Pname: "Phone",
                controll: _phone,
              ),
              _buildtextfield(Pname: "Education", controll: _education),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {
                      create();
                      _name.clear();
                      _age.clear();
                      _address.clear();
                      _phone.clear();
                      _education.clear();
                      _email.clear();
                    },
                    child: Text("Create"),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  FlatButton(
                    onPressed: () {
                      update();
                      _name.clear();
                      _age.clear();
                      _address.clear();
                      _phone.clear();
                      _education.clear();
                      _email.clear();
                    },
                    child: Text("Update"),
                    color: Color.fromARGB(255, 212, 243, 33),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  FlatButton(
                    onPressed: () {
                      delete();
                      _name.clear();
                      _age.clear();
                      _address.clear();
                      _phone.clear();
                      _education.clear();
                      _email.clear();
                    },
                    child: Text("Delete"),
                    color: Color.fromARGB(255, 243, 33, 68),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              FlatButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowInfo1()));},
               child: Text("show info ",style:TextStyle(color:Colors.blue))),

            
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildtextfield({Pname, controll}) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: TextField(
        controller: controll,
        decoration: InputDecoration(
          labelText: Pname,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
