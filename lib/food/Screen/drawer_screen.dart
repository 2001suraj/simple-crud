import 'package:crud/food/Screen/add_product_screen.dart';
import 'package:crud/food/Screen/profile_screen.dart';
import 'package:crud/food/Screen/review_cart_screen.dart';
import 'package:crud/food/home/home.dart';
import 'package:flutter/material.dart';

class DrawerScreen1 extends StatelessWidget {
  const DrawerScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget listTile( {IconData? icon, String? title, Widget? key }) {
      return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) => key!));
          },
          child: ListTile(leading: Icon(icon!, size: 30), title: Text(title!)));
    }

    return Drawer(
        child: Container(
      color: Colors.amberAccent,
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 238, 217, 153),
                  radius: 40,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.amber,
                    backgroundImage: AssetImage("assets/images/1.jpg"),
                    child: Text(
                      "Vegi",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          BoxShadow(
                            offset: Offset(3, 3),
                            color: Color.fromARGB(255, 2, 17, 3),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome to Guest"),
                    OutlineButton(
                      onPressed: () {},
                      child: Text("Login"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          listTile(icon: Icons.home, title: "home",key:MainHomeScreen1(),),
          listTile(icon: Icons.shop, title: "Review cart",key:ReviewCartScreen(),),
          listTile(icon: Icons.people, title: "Profile",key:MyProfileScreen1()),
          listTile(icon: Icons.notifications, title: "Notification",key:MainHomeScreen1(),),
          listTile(icon: Icons.star, title: "Review and Rating",key:MainHomeScreen1(),),
          listTile(icon: Icons.favorite_border, title: "Wishlist",key:MainHomeScreen1(),),
          listTile(icon: Icons.copy, title: "Raise a complain",key:MainHomeScreen1(),),
          listTile(icon: Icons.format_quote_outlined, title: "FAQs",key:AddProductScreen1(),),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 30),
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text("Contact Support",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Call us : +977-9809176512"),
                  SizedBox(
                    height: 15,
                  ),
                  Text("mail us: Hello@gmail.com")
                ])),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
              child: Text(
            "V.10(4)",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ],
      ),
    ));
  }
}
