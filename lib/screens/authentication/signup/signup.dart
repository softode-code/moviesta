import 'package:flutter/material.dart';
import 'package:moviesta/screens/authentication/signup/sign_up_form.dart';
import 'package:moviesta/shared/widgets/footer.dart';
import 'package:moviesta/shared/widgets/header.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:50),
                Header(
                  title: 'Sign up',
                  subtitle: 'Start taking notes and access them anywhere.'
                ),
                SizedBox(height:70),
                SignUpForm(),
                SizedBox(height:30),
                Footer(
                  text: 'Already have an account?',
                  actionText: 'Sign in',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}