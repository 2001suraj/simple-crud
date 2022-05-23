import 'package:flutter/material.dart';

class ReviewCartScreen extends StatelessWidget {
  const ReviewCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Review Cart")),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
          child: Column(children: [
        Divider(),

        reviewcarditem(),
        Divider(),
        reviewcarditem(),
        Divider(),


      ])),
    );
  }

  Padding reviewcarditem() {
    return Padding(
        padding: const EdgeInsets.all(28.0),
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
                SizedBox(height:30),
                Text("50 gram"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.delete,size:40)),
                ),
                RaisedButton(
                  color: Colors.transparent,
                  elevation: 0,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side:BorderSide(style:BorderStyle.solid)),
                  onPressed: () {},
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove),
                      ),
                        Text("1"),
                         IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}
