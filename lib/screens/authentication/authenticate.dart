import 'package:flutter/material.dart';
import 'package:moviesta/screens/authentication/signin/signin.dart';
import 'package:moviesta/screens/authentication/signup/signup.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleSignIn() => setState(()=> showSignIn = !showSignIn);

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignInScreen(toggleView: toggleSignIn,);
    } else {
      return SignUpScreen(toggleView: toggleSignIn,);
    }
  }
}