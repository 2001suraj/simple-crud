import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    TextEditingController _studentID = TextEditingController();
    TextEditingController _studentProgressID = TextEditingController();
    TextEditingController _gpa = TextEditingController();

    final firebase = FirebaseFirestore.instance;
    create() async {
      try {
        await firebase.collection("StudentInfo").doc(_studentID.text).set({
          "Student_name": _name.text,
          "Student_ID": _studentID.text,
          "Student_Progress_Id": _studentProgressID.text,
          "gpa": _gpa.text,
        });
      } catch (e) {
        print(e);
      }
    }

    update() async {
      try {
        await firebase.collection("StudentInfo").doc(_studentID.text).update({
          "Student_name": _name.text,
          "Student_Progress_Id": _studentProgressID.text,
          "gpa": _gpa.text,
        });
      } catch (e) {
        print(e);
      }
    }

    delete() async {
      try {
        await firebase.collection("StudentInfo").doc(_studentID.text).delete();
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("My firebase"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 18.0,
            left: 18,
            right: 18,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _studentID,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Student ID",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _studentProgressID,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Student Progress ID",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _gpa,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "GPA",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.blue,
                      onPressed: () {
                        create();
                        _name.clear();
                        _studentID.clear();
                        _studentProgressID.clear();
                        _gpa.clear();
                      },
                      child: Text(
                        "Create",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.red,
                      onPressed: () {
                        delete();
                        _name.clear();
                        _studentID.clear();
                        _studentProgressID.clear();
                        _gpa.clear();
                      },
                      child: Text(
                        "delete",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.yellow,
                      onPressed: () {
                        update();
                        _name.clear();
                        _studentID.clear();
                        _studentProgressID.clear();
                        _gpa.clear();
                      },
                      child: Text(
                        "update",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 400,
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: firebase.collection("StudentInfo").snapshots(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Student"),
                                  Text("Student ID"),
                                  Text("Student Progress ID"),
                                  Text("Student GPA"),
                                ],
                              ),
                                                SizedBox(height:20),
          
                              ListView.builder(
                                  physics: ScrollPhysics(),
                                  itemCount: snapshot.data!.docs.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    QueryDocumentSnapshot as =
                                        snapshot.data!.docs[i];
                                    return SingleChildScrollView(
                                      child: Container(
                                        height: 40,
                                        width: double.infinity,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                        
                                                  Container(
                                                    width: 55,
                                                    height:40,
                                                    child: Text(
                                                      as["Student_name"],
                                                    ),
                                                  ),
                                                  SizedBox(width:50),
                                                  Container(
                                                    width: 50,
                                                    height:40,
                                                    child: Text(
                                                      as["Student_ID"],
                                                    ),
                                                  ),
                                                  SizedBox(width:50),
                                        
                                                  Container(
                                                    width: 50,
                                                    height:40,
                                        
                                                    child: Text(
                                                      as["Student_Progress_Id"],
                                                    ),
                                                  ),
                                                  SizedBox(width:50),
                                        
                                                  Container(
                                                    width: 50,
                                                    height:40,
                                                    
                                                    child: Text(as["gpa"])),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
