import 'package:flutter/material.dart';

class SearchScreen1 extends StatelessWidget {
  const SearchScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool bool1 = false;
    return Scaffold(
      appBar: AppBar(title: Text("Search"), actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "items",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Search",
                  hintText: "Search fot the items in the store",
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              searchitem(),
              searchitem(),
              searchitem(),
            ],
          ),
        ),
      ),
    );
  }

  Padding searchitem( ) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage("assets/images/food1/1.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Product name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "\$50 per  gram",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black45,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(style: BorderStyle.solid),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text("50 gram"),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_drop_down,
                                  color: Colors.cyan),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
          RaisedButton(
            color: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(style: BorderStyle.solid)),
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.add, color: Colors.cyan),
                Text("Add", style: TextStyle(color: Colors.cyan)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
