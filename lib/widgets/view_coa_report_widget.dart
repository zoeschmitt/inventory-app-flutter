import 'package:flutter/material.dart';

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
              borderRadius:
                  BorderRadius.all(Radius.circular(20)),
              color: Colors.grey[200],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0,
                  bottom: 16.0,
                  left: 23.0,
                  right: 23.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.pie_chart,
                    size: 60,
                    color: Colors.black,
                  ),
                  SizedBox(width: 15),
                  Text(
                    'View COA Report',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
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