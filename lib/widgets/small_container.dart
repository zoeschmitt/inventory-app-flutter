import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallContainer extends StatelessWidget {
  const SmallContainer({
    Key key,
    @required this.text, this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: color),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.sourceSansPro(
                fontSize: 16,
                color: Colors.black45,
                fontWeight: FontWeight.w600),
            maxLines: 1,
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
