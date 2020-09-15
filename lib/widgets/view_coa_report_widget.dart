import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/utils/styles.dart';

class ViewCOAReportWidget extends StatelessWidget {
  const ViewCOAReportWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Styles.backgroundCol,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 13.0, bottom: 13.0, left: 20.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    SFSymbols.chart_pie_fill,
                    size: 60,
                    color: Styles.custBlue,
                  ),
                  SizedBox(width: 15),
                  Text(
                    'View COA Report',
                    maxLines: 2,
                    style: GoogleFonts.libreFranklin(
                        fontSize: 22,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
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
