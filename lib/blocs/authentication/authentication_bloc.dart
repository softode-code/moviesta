import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesta/blocs/authentication/authentication_event.dart';
import 'package:moviesta/blocs/authentication/authentication_state.dart';
import 'package:moviesta/repositories/user_repository.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final UserRepository _userRepository;

  AuthenticationBloc({UserRepository userRepository}) 
    : _userRepository = userRepository,
       super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AuthenticationStarted){
      yield* _mapAuthenticationStartedToState();
    } else if (event is AuthenticationLoggedIn){
      yield* _mapAuthenticationLoggedInToState();
    } else if (event is AuthenticationLoggedOut){
      yield* _mapAuthenticationLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAuthenticationStartedToState() async* {
    if(_userRepository.isSignedIn()) {
      yield AuthenticationSuccess(user: _userRepository.getUser());
    } else {
      yield AuthenticationFailure();
    }
  }

  Stream<AuthenticationState> _mapAuthenticationLoggedInToState() async* {
    yield AuthenticationSuccess(user: _userRepository.getUser());
  }

  Stream<AuthenticationState> _mapAuthenticationLoggedOutToState() async* {
    yield AuthenticationFailure();
    _userRepository.signOut();
  }

}