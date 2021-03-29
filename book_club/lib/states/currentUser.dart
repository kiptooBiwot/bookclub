import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CurrentUser extends ChangeNotifier {
  String _uid;
  String _email;

  String get getUid => _uid;
  String get email => _email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpUser(String email, String password) async {
    bool returnValue = false;
    try {
      // Sign up user using email and password
      UserCredential _signUpResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (_signUpResult != null) {
        returnValue = true;
      }
    } catch (e) {
      print(e);
    }
    return returnValue;
  }

  Future<bool> logInUser(String email, String password) async {
    bool isLoggedIn = false;
    try {
      UserCredential _loginResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (_loginResult != null) {
        _uid = _loginResult.user.uid;
        _email = _loginResult.user.email;
        isLoggedIn = true;
      }
    } catch (e) {
      print(e);
    }

    return isLoggedIn;
  }
}
