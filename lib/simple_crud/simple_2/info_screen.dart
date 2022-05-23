import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/simple_crud/simple_2/individual_info.dart';
import 'package:flutter/material.dart';

class ShowInfo1 extends StatelessWidget {
  const ShowInfo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebase = FirebaseFirestore.instance;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => IndividualInfo()));
        },
        child: Container(
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
                            QueryDocumentSnapshot x =
                                snapshot.data!.docs[index];

                            return Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red),
                                      child: Text(x["pname"])),
                                  title: Text(x["pname"]),
                                  subtitle: Text(x["pemail"]),
                                ),
                              ],
                            );
                          });
                    } else {
                      return CircularProgressIndicator();
                    }
                  })),
            )),
      ),
    );
  }
}
