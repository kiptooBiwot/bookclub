import 'package:book_club/screens/login/login.dart';
import 'package:book_club/states/currentUser.dart';
import 'package:book_club/utils/ourTheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          CurrentUser(), //Makes the CurrentUser global. Any part of the app can access the CurrentUser
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: OurTheme().buildTheme(context),
        title: 'My Book Club',
        home: MyLogin(),
      ),
    );
  }
}
