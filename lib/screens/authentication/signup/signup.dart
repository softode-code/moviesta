import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesta/blocs/authentication/authentication_bloc.dart';
import 'package:moviesta/blocs/authentication/authentication_event.dart';
import 'package:moviesta/blocs/register_bloc/register_bloc.dart';
import 'package:moviesta/blocs/register_bloc/register_state.dart';
import 'package:moviesta/repositories/user_repository.dart';
import 'package:moviesta/res/color.dart';
import 'package:moviesta/screens/authentication/signup/sign_up_form.dart';
import 'package:moviesta/shared/widgets/footer.dart';
import 'package:moviesta/shared/widgets/header.dart';

class SignUpScreen extends StatelessWidget {

  final Function toggleView;
  const SignUpScreen({Key key, this.toggleView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          child: BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(userRepository: UserRepository()),
            child: BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state){
                if(state.isSubmitting){
                  Scaffold.of(context)..removeCurrentSnackBar()..
                  showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Signing In...',
                            style: TextStyle(
                              color: onPrimary
                            ),
                          ),
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(onPrimary),
                          )
                        ],
                      ),
                      backgroundColor: primaryColor,
                    )
                  );
                }
                if(state.isFailure){
                  Scaffold.of(context)..removeCurrentSnackBar()..
                  showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Couldn\'t sign in!',
                            style: TextStyle(
                              color: onPrimary
                            ),
                          ),
                          Icon(
                            Icons.error_outline,
                            color: onPrimary,
                          )
                        ],
                      ),
                      backgroundColor: Colors.redAccent,
                    )
                  );
                }
                if(state.isSuccess){
                  BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationLoggedIn());
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height:50),
                    Header(
                      title: 'Sign up',
                      subtitle: 'Start tracking your movies.'
                    ),
                    SizedBox(height:70),
                    SignUpForm(),
                    SizedBox(height:30),
                    Footer(
                      text: 'Already have an account?',
                      actionText: 'Sign in',
                      onPressed: toggleView,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}