import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moviesta/models/user_model.dart';

class UserRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerUserWithCredentials(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      //TODO: write user to database
      return UserModel.fromUserRepository(credential.user);
    } catch(e){
      print(e.toString());
      return null;
    }
    
  }

  Future signInWithCredentials(String email, String password) async {
    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      print('Couldn\'t sign in');
      print(e.toString());
      return null;
    }
  }

  Future googleSignIn() async {
    try{
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication signInAuthentication = await googleSignInAccount.authentication;

      AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: signInAuthentication.accessToken,
        idToken: signInAuthentication.idToken
      );

      UserCredential userCredential = await _auth.signInWithCredential(authCredential);
      User user = userCredential.user;
      return user;
    } catch(e){
      print('Couldn\'t sign in');
      print(e.toString());
      return null;
    }
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