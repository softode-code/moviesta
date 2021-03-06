import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moviesta/blocs/login_bloc/login_bloc.dart';
import 'package:moviesta/blocs/login_bloc/login_event.dart';
import 'package:moviesta/res/color.dart';
import 'package:moviesta/shared/constants.dart';
import 'package:moviesta/shared/widgets/circular_google_btn.dart';
import 'package:moviesta/shared/widgets/form_primary_button.dart';
import 'package:moviesta/shared/widgets/or_divider.dart';
import 'package:moviesta/shared/widgets/text_form_field_bg.dart';
import 'package:moviesta/blocs/login_bloc/login_state.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  final _formkey = GlobalKey<FormState>();
  bool showPassword = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginBloc _loginBloc;

  bool get isPopulated => _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormFieldBackground(
                child: TextFormField(
                  decoration: inputDecoration.copyWith(
                    hintText: 'Email',
                    icon: Icon(
                      Icons.email_outlined,
                    )
                  ),
                  validator: (val) => state.isEmailValid ? null : 'Please enter your email.',
                  controller: _emailController,
                ),
              ),
              SizedBox(height:20.0),
              TextFormFieldBackground(
                child: Stack(
                  children: [
                    TextFormField(
                      decoration: inputDecoration.copyWith(
                        hintText: 'Password',
                        icon: Icon(
                          Icons.lock
                        )
                      ),
                      obscureText: !showPassword,
                      validator: (val) =>state.isPasswordValid ? 'Password should be at least 6 characters long.' : null,
                      controller: _passwordController,
                    ),
                    Positioned(
                      bottom: 10,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => setState(()=> showPassword = !showPassword),
                        child: SvgPicture.asset(
                          showPassword ? 'assets/disabled_eye.svg' : 'assets/eye.svg',
                          color: white40,
                        )
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height:20.0),
              Center(
                child: FormPrimaryButton(
                  text: 'Sign in',
                  onPressed: (){
                    if(isButtonEnabled(state)){
                      _onSignInWithCredentialPressed();
                    }
                  },
                ),
              ),
              SizedBox(height:35.0),
              OrDivider(),
              SizedBox(height:50.0),
              Center(
                child: CircluarGoogleButton(
                  onPressed: _onSignInWithGooglePressed,
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  void _onEmailChanged(){
    _loginBloc.add(LoginEmailChange(email: _emailController.text));
  }

  void _onPasswordChanged(){
    _loginBloc.add(LoginPasswordChange(password: _passwordController.text));
  }

  void _onSignInWithCredentialPressed(){
    _loginBloc.add(LoginWithCredentialsPressed(email: _emailController.text, password: _passwordController.text));
  }

  void _onSignInWithGooglePressed() {
    _loginBloc.add(LoginWithGooglePressed());
  }

}