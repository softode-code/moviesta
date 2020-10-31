import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesta/blocs/authentication/authentication_bloc.dart';
import 'package:moviesta/blocs/authentication/authentication_event.dart';
import 'package:moviesta/res/color.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationLoggedOut()),
        child: Icon(Icons.logout, color: onPrimary,),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}