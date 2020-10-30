import 'package:flutter/material.dart';
import 'package:moviesta/res/color.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Moviesta',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(primaryColor),)
          ],
        ),
      ),
    );
  }
}