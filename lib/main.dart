import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesta/blocs/authentication/authentication_bloc.dart';
import 'package:moviesta/blocs/authentication/authentication_event.dart';
import 'package:moviesta/blocs/authentication/authentication_state.dart';
import 'package:moviesta/blocs/simple_bloc_observer.dart';
import 'package:moviesta/repositories/user_repository.dart';
import 'package:moviesta/res/theme.dart';
import 'package:moviesta/screens/authentication/authenticate.dart';
import 'package:moviesta/screens/main/main_screen.dart';
import 'package:moviesta/screens/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(
        userRepository: userRepository
      )..add(AuthenticationStarted()),
      child: MyApp(
        userRepository: userRepository,
      )
    )
  );
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({Key key, this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moviesta',
      theme: theme,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state){
          if(state is AuthenticationInitial){
            return SplashScreen();
          }
          if(state is AuthenticationSuccess){
            return MainScreen();
          }
          if(state is AuthenticationFailure){
            return Authenticate();            
          }
        },
      ),
    );
  }
}