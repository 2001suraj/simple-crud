import 'package:crud/food/Screen/drawer_screen.dart';
import 'package:flutter/material.dart';

class MyProfileScreen1 extends StatelessWidget {
  const MyProfileScreen1({Key? key}) : super(key: key);
  @override

  // ignore: override_on_non_overriding_member
  Widget listTile({IconData? icon, String? title}) {
    return Column(children: [
      Divider(height: 1),
      ListTile(
        leading: Icon(icon),
        title: Text(title!),
        trailing:
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
      ),
    ]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("My Profile"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: DrawerScreen1(),
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Colors.cyan,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 118.0),
            child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80),
                  ),
                ),
                height: 710,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 37.0,left:12,right:15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(width: 150),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ram Hari Jung Thapa",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                                      SizedBox(height:14),
                              Text("RamHariJungThapa@gmail.com",style: TextStyle(color:Colors.black45),),
                            ],
                          ),
                          Expanded(child: CircleAvatar(radius: 25, child: Icon(Icons.edit))),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    listTile(icon: Icons.shop, title: "My Orders"),
                    listTile(icon: Icons.location_city, title: "My Delivery Address"),
                    listTile(icon: Icons.people, title: "Refer a friend"),
                    listTile(icon: Icons.file_copy, title: "Terms and condition"),
                    listTile(icon: Icons.policy, title: "Privacy policy"),
                    listTile(icon: Icons.add_chart, title: "About"),
                    listTile(icon: Icons.exit_to_app, title: "Log out"),

                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 68.0, left: 60),
            child: CircleAvatar(
              radius: 53,
              backgroundColor: Colors.cyan,
              child: CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage("assets/images/1.jpg"),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
