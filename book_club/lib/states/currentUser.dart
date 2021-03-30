import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<String> signInWithGoogle() async {
    String returnValue = 'Error';
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    try {
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: _googleAuth.accessToken,
        idToken: _googleAuth.idToken,
      );

      UserCredential _loginResult =
          await _auth.signInWithCredential(credential);

      _uid = _loginResult.user.uid;
      _email = _loginResult.user.email;

      returnValue = 'Success';
    } catch (e) {
      returnValue = e.message;
    }

    return returnValue;
  }
}
