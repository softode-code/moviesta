import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesta/blocs/authentication/authentication_bloc.dart';
import 'package:moviesta/blocs/authentication/authentication_event.dart';
import 'package:moviesta/blocs/login_bloc/login_bloc.dart';
import 'package:moviesta/repositories/user_repository.dart';
import 'package:moviesta/res/color.dart';
import 'package:moviesta/screens/authentication/signin/sign_in_form.dart';
import 'package:moviesta/shared/widgets/footer.dart';
import 'package:moviesta/shared/widgets/header.dart';
import 'package:moviesta/blocs/login_bloc/login_state.dart';

class SignInScreen extends StatelessWidget {

  final Function toggleView;

  const SignInScreen({Key key, this.toggleView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          child: BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(userRepository: UserRepository()),
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if(state.isFailure){
                  Scaffold.of(context)..removeCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sign-in failed!',
                            style: TextStyle(
                              color: onPrimary
                            ),
                          ),
                          Icon(Icons.error_outline, color: Colors.white,)
                        ],
                      ),
                      backgroundColor: Colors.redAccent,
                    )
                  );
                } 

                if (state.isSuccess) {
                  BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationLoggedIn());
                  Navigator.pop(context);
                }

                if (state.isSubmitting) {
                  Scaffold.of(context)..removeCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Signing in...',
                            style: TextStyle(
                              color: onPrimary
                            ),
                          ),
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        ],
                      ),
                      backgroundColor: primaryColor,
                    )
                  );
                }
              },
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
        ),
      ),
    );
  }
}