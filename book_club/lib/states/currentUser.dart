import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CurrentUser extends ChangeNotifier {
  String _uid;
  String _email;

  String get getUid => _uid;
  String get email => _email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUser(String email, String password) async {
    String returnValue = 'Error';
    try {
      // Sign up user using email and password
      UserCredential _signUpResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (_signUpResult != null) {
        returnValue = 'Success';
      }
    } catch (e) {
      returnValue = e.message;
    }
    return returnValue;
  }

  Future<String> logInUserWithEmail(String email, String password) async {
    // bool isLoggedIn = false;
    String returnValue = 'Error';
    try {
      UserCredential _loginResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      _uid = _loginResult.user.uid;
      _email = _loginResult.user.email;
      returnValue = 'Success';
    } catch (e) {
      returnValue = e.message;
    }

    return returnValue;
  }
}
