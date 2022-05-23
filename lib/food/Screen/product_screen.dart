import 'package:flutter/material.dart';

enum SigninCharacter { fill, outline }

class ProductScreen1 extends StatefulWidget {
  String productName;
  String productImage;
  String productRate;
  String producPrice;

  ProductScreen1(
      {required this.productImage,
      required this.productName,
      required this.producPrice,
      required this.productRate});

  @override
  State<ProductScreen1> createState() => _ProductScreen1State();
}

class _ProductScreen1State extends State<ProductScreen1> {
  SigninCharacter _character = SigninCharacter.fill;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Product Overview")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.productName,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.productRate,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.red, Colors.cyan, Colors.amberAccent]),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(widget.productImage),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Text(
                "Available Options ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 3,
                    backgroundColor: Colors.green,
                  ),
                  Radio(
                      value: SigninCharacter.fill,
                      groupValue: _character,
                      activeColor: Colors.lightGreenAccent,
                      onChanged: (v) {
                        setState(() {
                          _character = SigninCharacter.outline;
                        });
                      }),
                  Text(
                    widget.producPrice,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                  FlatButton(
                    highlightColor: Colors.blue,
                    splashColor: Colors.black,
                    textColor: Colors.amberAccent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        Text("ADD"),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                "About this product",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "In marketing , a product is an oject ot system made  available for consumer use; it is anything  that can be offered  to  market  to satisfy  the desire or need of  costumer  ",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: FlatButton(
                          onPressed: () {},
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.favorite),
                                  SizedBox(width:20),

                                  Text("Add to  Wishlist")
                                ],
                              )),
                        )),
                    Expanded(
                        flex: 2,
                        child: FlatButton(
                          onPressed: () {},
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.yellowAccent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.shop),
                                  SizedBox(width:20),
                                  Text("Go to cart")
                                ],
                              )),
                        ))
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
