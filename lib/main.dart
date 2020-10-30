import 'package:flutter/material.dart';
import 'package:moviesta/res/theme.dart';
import 'package:moviesta/screens/authentication/signin/signin.dart';
import 'package:moviesta/screens/authentication/signup/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moviesta',
      theme: theme,
      home: SignInScreen(),
    );
  }
}