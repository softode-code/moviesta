import 'package:firebase_auth/firebase_auth.dart';

class UserModel{
  String uid;
  String email;
  String username;
  String profilePicURL;

  UserModel({this.email, this.uid, this.profilePicURL, this.username});

  UserModel.fromMap(Map<String, dynamic> map){
    this.email = map['email'];
    this.profilePicURL = map['profilePicURL'];
    this.uid = map['uid'];
    this.username = map['username'];
  }

  Map<String, dynamic> toMap(){
    return {
      'email': this.email,
      'profilePicURL' : this.profilePicURL,
      'username' : this.username,
      'uid' : this.uid
    };
  }

  UserModel.fromUserRepository(User user){
    this.uid = user.uid;
    this.email = user.email;
    this.profilePicURL = user.photoURL;
    this.username = user.displayName;
  }

}