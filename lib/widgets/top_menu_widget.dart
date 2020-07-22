import 'package:flutter/material.dart';

class TopMenuWidget extends StatelessWidget {
  const TopMenuWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            'Welcome Back, Zoe',
            maxLines: 2,
            style: TextStyle(
              fontSize: 30,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 5),
        IconButton(
            icon: Icon(
              Icons.notifications,
              size: 36,
              color: Colors.black,
            ),
            onPressed: null),
        SizedBox(width: 4),
        IconButton(
            icon: Icon(
              Icons.settings,
              size: 36,
              color: Colors.black,
            ),
            onPressed: null)
      ],
    );
  }
}