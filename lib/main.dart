import 'package:crud/food/Screen/signup_screen.dart';
import 'package:crud/food/home/home.dart';
import 'package:crud/simple_crud/simple%201/simple_2.dart';
import 'package:crud/simple_crud/simple%20crud%20todo/simple_todo.dart';
import 'package:crud/simple_crud/simple_2/simple_2_survery.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'simple_crud/simple 1/simple_1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Primary1(),
    );
  }
}

class Primary1 extends StatelessWidget {
  const Primary1({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text(" CRUD")),
        body: Column(
          children: [
            FlatButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage(),));},
               child: Text('simple crud'),),
            FlatButton(child: Text("simple crud 1"),onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage2(),));
            },),
              FlatButton(child: Text("simple crud 2"),onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage3(),));
            },),
              FlatButton(child: Text("simple todo 1"),onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (_)=>SimpleTodo1(),));
            },),
              FlatButton(child: Text("Food"),onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (_)=>SignupScreen1(),));
            },),

          ],
        ),
      );
  }
}
