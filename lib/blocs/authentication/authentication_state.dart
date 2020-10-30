import 'package:equatable/equatable.dart';
import 'package:moviesta/models/user_model.dart';

abstract class AuthenticationState extends Equatable{
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState{}

class AuthenticationSuccess extends AuthenticationState{
  final UserModel user;
  AuthenticationSuccess({this.user});
  @override
  List<Object> get props => [this.user];
}

class AuthenticationFailure extends AuthenticationState{}