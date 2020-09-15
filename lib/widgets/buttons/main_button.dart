import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/utils/styles.dart';

class MainButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onPressed;

  const MainButton({
    Key key,
    this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            color: Styles.custBlue,
            textColor: Colors.white,
            padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            onPressed: onPressed,
            child: Text(
              title,
              style: GoogleFonts.sourceSansPro(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
