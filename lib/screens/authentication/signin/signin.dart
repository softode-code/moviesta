import 'package:flutter/material.dart';
import 'package:moviesta/screens/authentication/signin/sign_in_form.dart';
import 'package:moviesta/shared/widgets/footer.dart';
import 'package:moviesta/shared/widgets/header.dart';

class SignInScreen extends StatelessWidget {

  final Function toggleView;

  const SignInScreen({Key key, this.toggleView}) : super(key: key);

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
                  title: 'Sign In',
                  subtitle: 'Continue tracking your movies'
                ),
                SizedBox(height:70),
                SignInForm(),
                SizedBox(height:30),
                Footer(
                  text: 'Not a member?',
                  actionText: 'Sign up',
                  onPressed: toggleView,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}