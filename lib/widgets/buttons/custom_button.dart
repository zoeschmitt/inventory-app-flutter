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
          height: 42,
          width: 42,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
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
