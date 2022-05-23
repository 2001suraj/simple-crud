import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class IndividualInfo extends StatelessWidget {
  const IndividualInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebase = FirebaseFirestore.instance;

    return Scaffold(
      body: Container(
          height: 1200,
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: StreamBuilder<QuerySnapshot>(
                stream: firebase.collection("Survey").snapshots(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          QueryDocumentSnapshot x = snapshot.data!.docs[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 18.0, left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Hello " + x["pname"],
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "This is simple database app, where you can get your information save in your app.",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 87, 198, 241),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  buildinfodetail(x,
                                      title: "Name : ", info: x["pname"]),
                                  buildinfodetail(x,
                                      title: "Email : ", info: x["pemail"]),
                                  buildinfodetail(x,
                                      title: "Address : ", info: x["paddress"]),
                                  buildinfodetail(x,
                                      title: "Phone : ", info: x["pphone"]),
                                  buildinfodetail(x,
                                      title: "Education : ",
                                      info: x["peducation"]),
                                  buildinfodetail(x,
                                      title: "Age : ", info: x["page"]),
                                  SizedBox(height: 30),
                                ],
                              ),
                            );
                         
                        });
                  } else {
                    return CircularProgressIndicator();
                  }
                })),
          )),
    );
  }

  Padding buildinfodetail(QueryDocumentSnapshot<Object?> x, {title, info}) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 20),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(title)),
          Expanded(
            flex: 6,
            child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.red, width: 4, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(info)),
          ),
        ],
      ),
    );
  }
}
