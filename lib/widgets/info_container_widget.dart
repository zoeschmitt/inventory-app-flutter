import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoContainerWidget extends StatelessWidget {
  final String label;
  final String innerTxt;

  const InfoContainerWidget({
    Key key,
    this.label,
    this.innerTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: (width - 85) / 4,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black26,
              width: 1,
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(16.0) //         <--- border radius here
                ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 18.0, bottom: 18, left: 8, right: 8),
            child: Center(
              child: Text(
                innerTxt,
                style: GoogleFonts.libreFranklin(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        SizedBox(height: 7),
        Text(
          label,
          style: GoogleFonts.sourceSansPro(
              fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
