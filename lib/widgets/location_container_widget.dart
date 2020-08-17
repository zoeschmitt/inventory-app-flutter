import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/utils/styles.dart';


class LocationContainerWidget extends StatelessWidget {
  final String name;
  final String quantity;

  const LocationContainerWidget({Key key, this.name, this.quantity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              color: Styles.backgroundCol,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 16.0, left: 23.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      name,
                      style: GoogleFonts.libreFranklin(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                      maxLines: 1,
                      textAlign: TextAlign.start,
                    ),
                    
                  ),
                  Text(
                      quantity,
                      style: GoogleFonts.libreFranklin(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.w300),
                      maxLines: 1,
                      textAlign: TextAlign.start,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
