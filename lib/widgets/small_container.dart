import 'package:flutter/material.dart';

class SmallContainer extends StatelessWidget {
  const SmallContainer({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.grey[300]),
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
        child: Center(
          child: Text(
            text,
            style:
                TextStyle(fontSize: 14.0, color: Colors.black87),
            maxLines: 1,
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}