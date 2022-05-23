import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController password = TextEditingController();
    final firebase = FirebaseFirestore.instance;
    create() async {
      try {
        await firebase.collection("User").doc(name.text).set({
          "name": name.text,
          "password": password.text,
        });
      } catch (e) {
        print(e);
      }
    }

    update() async {
      try {
        await firebase
            .collection("User")
            .doc(name.text)
            .update({"password": password.text});
      } catch (e) {
        print(e);
      }
    }

    delete() async {
      try {
        await firebase.collection("User").doc(name.text).delete();
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("crud"),
        ),
        body: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(labelText: "password"),
            ),
            Row(
              children: [
                FlatButton(
                    onPressed: () {
                      create();
                      name.clear();
                      password.clear();
                    },
                    child: Text("create")),
                FlatButton(
                    onPressed: () {
                      update();
                      name.clear();
                      password.clear();
                    },
                    child: Text("update")),
                FlatButton(
                    onPressed: () {
                      delete();
                      name.clear();
                      password.clear();
                    },
                    child: Text("delete")),
              ],
            ),
            Container(
              height: 300,
              child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: firebase.collection("User").snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, i) {
                                QueryDocumentSnapshot x =
                                    snapshot.data!.docs[i];

                                return ListTile(
                                  title: Text("User name : " +
                                    x['name'],
                                  ),
                                  subtitle:Text("User password : "+ x['password'])
                                );
                              });
                        } else {
                          return CircularProgressIndicator();
                        }
                      })),
            ),
          ],
        ));
  }
}
