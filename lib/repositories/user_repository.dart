import 'package:firebase_auth/firebase_auth.dart';
import 'package:moviesta/models/user_model.dart';

class UserRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerUserWithCredentials(String email, String password) async {
    UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    //TODO: write user to database
    return UserModel.fromUserRepository(credential.user);
  }

  Future signInWithCredentials(String email, String password) async {
    UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return UserModel.fromUserRepository(credential.user);
  }

  Future signOut() async {
    return await _auth.signOut();
  }

  bool isSignedIn() {
    return _auth.currentUser != null;
  }

  UserModel getUser() {
    return UserModel.fromUserRepository(_auth.currentUser);
  }
}