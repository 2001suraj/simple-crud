// ignore_for_file: deprecated_member_use



import 'package:awesome_icons/awesome_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/simple_crud/simple%20crud%20todo/pages/attractions_page.dart';
import 'package:crud/simple_crud/simple%20crud%20todo/pages/edit_page.dart';
import 'package:crud/simple_crud/simple%20crud%20todo/pages/info_input_page.dart';
import 'package:flutter/material.dart';

class SimpleTodo1 extends StatelessWidget {
  const SimpleTodo1({Key? key}) : super(key: key);

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
          "User_id": id.value,
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.amberAccent,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 28.0, left: 11, right: 11),
          child: Column(
            children: [
              Text("Topics",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              _buildflatbuttondrawer(context,
                  routepage: AttractionPage1(),
                  icon: Icons.attractions,
                  title: "Attractions"),
              _buildflatbuttondrawer(context,
                  routepage: AttractionPage1(),
                  icon: Icons.dining,
                  title: "Dining"),
              _buildflatbuttondrawer(context,
                  routepage: AttractionPage1(),
                  icon: FontAwesomeIcons.pen,
                  title: "Education"),
              _buildflatbuttondrawer(context,
                  routepage: AttractionPage1(),
                  icon: Icons.health_and_safety,
                  title: "Health"),
              _buildflatbuttondrawer(context,
                  routepage: AttractionPage1(),
                  icon: FontAwesomeIcons.layerGroup,
                  title: "Family"),
              _buildflatbuttondrawer(context,
                  routepage: AttractionPage1(),
                  icon: FontAwesomeIcons.home,
                  title: "Office"),
              _buildflatbuttondrawer(context,
                  routepage: AttractionPage1(),
                  icon: FontAwesomeIcons.procedures,
                  title: "Promotions"),
              _buildflatbuttondrawer(context,
                  routepage: AttractionPage1(),
                  icon: Icons.radio,
                  title: "Radio"),
              _buildflatbuttondrawer(context,
                  routepage: AttractionPage1(),
                  icon: Icons.food_bank,
                  title: "Food"),
              _buildflatbuttondrawer(context,
                  routepage: AttractionPage1(),
                  icon: Icons.sports,
                  title: "Sports"),
              _buildflatbuttondrawer(context,
                  routepage: AttractionPage1(),
                  icon: FontAwesomeIcons.bus,
                  title: "Travels"),
            ],
          ),
        )),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 500,
          child: Stack(
            children: [
              Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                    color: Colors.purple,
                  ),
                  width: 600,
                  height: 90,
                  alignment: Alignment.center,
                  child: Text("My Files",
                      style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
              Padding(
                padding: const EdgeInsets.only(left: 38.0, top: 60),
                child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InfoInputPage1()));
                    },
                    child: Icon(Icons.add),
                    backgroundColor: Colors.lightBlueAccent),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35.0, top: 140),
                child: Column(
                  children: [
                    Text(
                      "Today",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black45),
                    ),
                    Divider(),
                    Container(
                      height: 300,
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
                                    return ListTile(
                                      leading: CircleAvatar(
                                        child: Text(ss["username"]),
                                      ),
                                      title: Text(ss["username"]),

                                      subtitle: Text(
                                        ss["title"],
                                      ),
                                      trailing: PopupMenuButton(
                                        icon: Icon(Icons.more_vert),
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            child: Row(
                                              children: const [
                                                Icon(Icons.delete),
                                                SizedBox(width: 7),
                                                Text("delete"),
                                              ],
                                            ),
                                            value: 0,
                                          ),
                                          PopupMenuItem(
                                              value: 1,
                                              child: Row(
                                                children: const [
                                                  Icon(Icons.edit),
                                                  SizedBox(width: 7),
                                                  Text("edit"),
                                                ],
                                              )),
                                          PopupMenuItem(
                                              child: Text(
                                                "User id : " + ss["User_id"],
                                              ),
                                              value: 3),
                                        ],
                                        onSelected: (item) =>
                                            onSelect(context, item),
                                      ),
                                    );
                                  });
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
            ],
          ),
        ),
      ),
    );
  }

  FlatButton _buildflatbuttondrawer(BuildContext context,
      {routepage, icon, title}) {
    return FlatButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) => routepage));
        },
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 12,
            ),
            Text(title)
          ],
        ));
  }

  onSelect(BuildContext context, Object? item) {
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
              title: Text("Delete"),
              content: Container(
                height: 300,
                width: 400,
                child: Column(
                  children: [
                    TextField(
                      controller: id,
                      decoration: InputDecoration(
                        labelText: "User Id",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    FlatButton(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.blue,
                      onPressed: () {
                        delete();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => SimpleTodo1()));
                      },
                      child: Text("Delete"),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    switch (item) {
      case 0:
        alertDialog(context);
        break;
      case 1:

        Navigator.push(
            context, MaterialPageRoute(builder: (c) => EditPage1()));

        break;
      case 2:
        break;
    }
  }
}
