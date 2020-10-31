import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesta/blocs/register_bloc/register_event.dart';
import 'package:moviesta/blocs/register_bloc/register_state.dart';
import 'package:moviesta/repositories/user_repository.dart';
import 'package:moviesta/shared/validators.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  final UserRepository _userRepository;

  RegisterBloc({UserRepository userRepository}) :
    _userRepository = userRepository,
    super(RegisterState.initial()
    );

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterEmailChange){
      yield* _mapRegisterEmailChangeToState(event.email);
    } else if (event is RegisterPasswordChange){
      yield* _mapRegisterPasswordChangeToState(event.password);
    } else if(event is RegisterWithCredentialsPressed){
      yield* _mapRegisterWithCredentialsPressedToState(event.email, event.password);
    } else if(event is RegisterWithGooglePressed){
      yield* _mapRegisterWithGooglePressedToState();
    }
  }

  Stream<RegisterState> _mapRegisterEmailChangeToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email)
    );
  }

  Stream<RegisterState> _mapRegisterPasswordChangeToState(String password) async* {
    yield state.update(
      isPasswordValid: password.length < 6 ? false : true
    );
  }

  Stream<RegisterState> _mapRegisterWithCredentialsPressedToState(String email, String password) async* {
    yield RegisterState.loading();
    try{
      final result = await _userRepository.registerUserWithCredentials(email, password);
      if(result != null){
        yield RegisterState.success();
      } else {
        yield RegisterState.failure();
      }
    } catch(e){
      yield RegisterState.failure();
    }
  }

  Stream<RegisterState> _mapRegisterWithGooglePressedToState() async*{
    yield RegisterState.loading();
    try {
      final result = await _userRepository.googleSignIn();
      if(result != null){
        yield RegisterState.success();
      } else {
        RegisterState.failure();
      }
    } catch(e){
      RegisterState.failure();
    }
  }
 
}