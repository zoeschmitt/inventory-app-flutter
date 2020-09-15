import 'package:flutter/material.dart';
import 'package:inventory/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;

  const CustomButton({
    Key key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Styles.backgroundCol,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Icon(icon, size: 26, color: Colors.black,),
      ),
    );
  }
}
