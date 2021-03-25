import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OurTheme {
  Color _lightBrown = Colors.brown[100];
  Color _primaryBrown = const Color(0xFF7F5539);
  Color _textColor = Color.fromRGBO(0, 0, 0, 0.64);
  Color _formGrey = Color.fromRGBO(0, 0, 0, 0.39);

  ThemeData buildTheme(context) {
    return ThemeData(
      canvasColor: _lightBrown,
      primaryColor: _primaryBrown,
      accentColor: _formGrey,
      secondaryHeaderColor: _textColor,
      textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context).textTheme,
      ),
      hintColor: _formGrey,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: _formGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: _formGrey),
        ),
        isDense: true,
        contentPadding: EdgeInsets.zero,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: _primaryBrown,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        minWidth: 200.0,
        height: 40.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
    );
  }
}
