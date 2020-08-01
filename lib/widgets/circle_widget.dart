import 'package:flutter/material.dart';
import 'package:inventory/utils/styles.dart';

class CircleWidget extends StatelessWidget {

  final double top; // -100
  final double bottom; // left -120
  final double right;
  final double left;
  final double mult; //1.4


  const CircleWidget({
    Key key, this.top, this.bottom, this.right, this.left, this.mult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: Container(
        width: MediaQuery.of(context).size.width / mult,
        height: MediaQuery.of(context).size.width / mult,
        decoration:
            BoxDecoration(color: Styles.custBlue, shape: BoxShape.circle),
      ),
    );
  }
}