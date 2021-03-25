import 'package:book_club/screens/login/local%20widgets/loginForm.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 0),
                  child: Image.asset('assets/images/book_club_logo.png'),
                ),
                SizedBox(height: 0),
                OurLoginForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
