import 'package:crud/food/Screen/const_screen.dart';
import 'package:crud/food/Screen/drawer_screen.dart';
import 'package:crud/food/Screen/product_screen.dart';
import 'package:crud/food/Screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainHomeScreen1 extends StatefulWidget {
  const MainHomeScreen1({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen1> createState() => _MainHomeScreen1State();
}

class _MainHomeScreen1State extends State<MainHomeScreen1> {


  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            color: Colors.white60,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => SearchScreen1()));
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            color: Colors.white60,
            onPressed: () {},
            icon: Icon(Icons.shop),
          ),
          SizedBox(width: 12),
        ],
      ),
      drawer: DrawerScreen1(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              buildProductRow(),
              col(
                  top_special: "Top special ",
                  view_all: "View All",
                  img: image,
                  heading: title,
                  rate: price,
                  plusindex: " per items"),
              SizedBox(height: 40),
              col(
                  top_special: "Top fruits ",
                  view_all: "View All",
                  img: image1,
                  heading: title1,
                  rate: price1,
                  plusindex: " per kg"),
              SizedBox(height: 20),
              col(
                  top_special: "Top Shoes ",
                  view_all: "View All",
                  img: image2,
                  heading: title2,
                  rate: price,
                  plusindex: " shoes"),
              SizedBox(height: 20),
              col(
                  top_special: "Top Dogs ",
                  view_all: "View All",
                  img: image3,
                  heading: title3,
                  rate: price,
                  plusindex: " dog"),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Padding col({top_special, view_all, img, heading, rate, plusindex}) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(top_special, style: TextStyle(fontWeight: FontWeight.bold)),
              FlatButton(
                onPressed: () {},
                child: Text(view_all),
              ),
            ],
          ),
          Container(
            height: 310,
            child: ListView.builder(
                itemCount: image.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => ProductScreen1(
                                  producPrice: rate[index % rate.length],
                                  productRate:
                                      rate[index % rate.length] + plusindex,
                                  productImage: img[index % img.length],
                                  productName: heading[index])));
                    },
                    child: Container(
                      width: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            height: 190,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(img[index % img.length]),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(heading[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(rate[index % rate.length] + plusindex,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(right: 38.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.lightGreenAccent),
                                  width: 70,
                                  height: 34,
                                  child: Text("$fooditem  items",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  height: 34,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:
                                          Color.fromARGB(255, 165, 231, 240)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () => setState(() {
                                          fooditem++;
                                        }),
                                        icon: Icon(Icons.add),
                                      ),
                                      Text(fooditem.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            fooditem--;
                                          });
                                        },
                                        icon: Icon(Icons.remove),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class buildProductRow extends StatelessWidget {
  const buildProductRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => ProductScreen1(
                producPrice: "\$4.9",
                productRate: "\$8",
                productImage: "assets/images/food1/4.jpeg",
                productName: "Vegi"),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: AspectRatio(
          aspectRatio: 2,
          child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    opacity: 0.81,
                    image: AssetImage("assets/images/food1/4.jpeg"),
                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -50,
                    left: 1,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.cyan),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 48.0),
                        child: Text(
                          "Vegi",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              BoxShadow(
                                offset: Offset(6, 6),
                                color: Color.fromARGB(255, 2, 17, 3),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  Positioned(
                      bottom: 40,
                      left: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "30% off",
                            style: TextStyle(
                                color: Color.fromARGB(255, 7, 1, 1),
                                fontSize: 46),
                          ),
                          Text(
                            "on all products ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 8, 0, 0)),
                          ),
                        ],
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
