import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final IconData icon;

  const CustomButton({
    Key key, this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Icon(
            icon,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
    );
  }
}
