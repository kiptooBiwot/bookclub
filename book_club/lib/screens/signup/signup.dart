import 'package:book_club/screens/signup/local%20widgets/signupForm.dart';
import 'package:flutter/material.dart';

class MySignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.brown[50],
      //   elevation: 0.0,
      // ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BackButton(),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0),
                  child: Image.asset('assets/images/book_club_logo.png'),
                ),
                SignupForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
