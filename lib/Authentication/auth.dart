import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth firebaseauth = FirebaseAuth.instance;

  Stream<User?> get authStateChange => firebaseauth.authStateChanges();

  void signOut()async {
    try{
      await firebaseauth.signOut();
    }catch(e){
      //print(e.message);
    }
  }

  Future<String?> signIn(String email, String password) async {
    try {
      await firebaseauth.signInWithEmailAndPassword(
          email: email, password: password);
          print('signedIn');
          //Navigator.pop();
      return 'Signed In';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp(String email, String password, String verify, BuildContext ctx) async {
    if (verify == password) {
      try {
        await firebaseauth.createUserWithEmailAndPassword(
            email: email, password: password);
            Navigator.pop(ctx);
        return 'Signed Up';
      } on FirebaseAuthException catch (e) {
        return e.message;
      }
    }else{
      return 'Not same password';
    }
  }


}
