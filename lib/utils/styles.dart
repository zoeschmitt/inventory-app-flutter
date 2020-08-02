import 'package:flutter/material.dart';

class Styles {

  static const Color backgroundCol = Color(0xffF1F2F6);
  static const Color custBlue = Color(0xff4879EC);
  static const TextStyle authHintStyle = TextStyle(
      color: Colors.black26, fontWeight: FontWeight.normal, fontSize: 16.0);
  static const TextStyle authStyle = TextStyle(
      color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16.0);

  static returnDec(String hint) {
    return InputDecoration(
      errorMaxLines: 2,
      hintText: hint,
      hintStyle: authHintStyle,
      contentPadding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
      filled: true,
      fillColor: custBlue.withOpacity(0.1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.0),
        borderSide: BorderSide.none,
      ),
    );
  }
}
