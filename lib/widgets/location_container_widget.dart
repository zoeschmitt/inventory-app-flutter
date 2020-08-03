import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/utils/styles.dart';

class LocationContainerWidget extends StatefulWidget {
  const LocationContainerWidget({
    Key key,
  }) : super(key: key);

  @override
  _LocationContainerWidgetState createState() =>
      _LocationContainerWidgetState();
}

class _LocationContainerWidgetState extends State<LocationContainerWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                  top: 16.0, bottom: 16.0, left: 23.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Location",
                          style: GoogleFonts.libreFranklin(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                          maxLines: 1,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "1234 Example Rd, Austin TX 78260",
                          style: GoogleFonts.libreFranklin(
                        fontSize: 15,
                        color: Colors.black38,
                        fontWeight: FontWeight.w400),
                          maxLines: 2,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    //flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          width: (width - 50) / 2,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                            color: Colors.grey[400],
                          ),
                          child: Text("1234"),
                        ),
                      ],
                    ),
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