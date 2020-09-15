import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static const Color backgroundCol = Color(0xffEFF0F3);
  static const Color custBlue = Color(0xff4879EC);

  static TextStyle authHintStyle = GoogleFonts.sourceSansPro(
      fontSize: 16, color: Colors.black26, fontWeight: FontWeight.w400);

  static TextStyle authStyle = GoogleFonts.sourceSansPro(
      fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600);

  static returnDec(String hint) {
    return InputDecoration(
      errorMaxLines: 2,
      hintText: hint,
      hintStyle: authHintStyle,
      contentPadding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
      filled: true,
      fillColor: backgroundCol,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide.none,
      ),
    );
  }
}
