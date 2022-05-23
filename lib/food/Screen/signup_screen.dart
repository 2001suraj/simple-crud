import 'package:crud/food/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignupScreen1 extends StatefulWidget {
  const SignupScreen1({Key? key}) : super(key: key);

  @override
  State<SignupScreen1> createState() => _SignupScreen1State();
}

class _SignupScreen1State extends State<SignupScreen1> {
  Future<User?> _googleSigInUp() async {
    try {
      final GoogleSignIn _googleSignin = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final GoogleSignInAccount? googleUser = await _googleSignin.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      return user;
    } catch (e) {
      print(e);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/background.png",
                      ),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 240, 207, 205),
                      ),
                      height: 400,
                      width: 300,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text("Sign in to Continue",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Vegi",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              shadows: [
                                BoxShadow(
                                    offset: Offset(3, 3),
                                    blurRadius: 5,
                                    color: Colors.green),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SignInButton(Buttons.Google,
                              text: "Sign up with google", onPressed: () {
                            _googleSigInUp().then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => MainHomeScreen1())));
                          }),
                          SizedBox(
                            height: 20,
                          ),
                          SignInButton(Buttons.Facebook,
                              text: "Sign up with facebook", onPressed: () {}),
                          SizedBox(
                            height: 50,
                          ),
                          Text("By signing in  you are agreeing to our "),
                          Text("Terms and Privacy Policy")
                        ],
                      ),),
                ],
              )),
        ),
      
    );
  }
}
