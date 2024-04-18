import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:price_tracker/screens/home.dart';
import 'package:price_tracker/screens/reset_screen.dart';
import 'package:price_tracker/screens/signup.dart';

import '../reusableWidgets/reusableWidgets.dart';
class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Color.fromRGBO(18, 26, 59, 1)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.25, 20, 0),
            child: Column(
              children: <Widget>[
                Text(
                  "Price Tracker",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ) ,
                ),
                const SizedBox(
                  height: 60,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5 ,
                ),
                forgetPassword(context),
                firebaseUIButton(context, "Login", (){
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text).then((value) {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => homeScreen()));
                  });

                }),
                const SizedBox(
                  height: 50,
                ),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }


}


