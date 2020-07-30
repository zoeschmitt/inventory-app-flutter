import 'package:flutter/material.dart';

import 'buttons/custom_button.dart';

class ModalTitleWidget extends StatelessWidget {
  final String title;
  const ModalTitleWidget({
    Key key, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          maxLines: 2,
          style: TextStyle(
            fontSize: 28,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: CustomButton(icon: Icons.clear)),
      ],
    );
  }
}