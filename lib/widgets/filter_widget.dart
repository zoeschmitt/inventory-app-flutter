import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Center(
          child: Icon(
            Icons.tune,
            size: 28.0,
            color: Colors.black26,
          ),
        ),
      ),
    );
  }
}