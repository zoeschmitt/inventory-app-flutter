import 'package:flutter/material.dart';
import 'package:inventory/utils/styles.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const List<Color> colors = [Styles.custBlue, Colors.white];
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
