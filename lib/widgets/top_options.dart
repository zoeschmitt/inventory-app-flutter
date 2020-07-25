import 'package:flutter/material.dart';

import 'buttons/custom_button.dart';

class TopOptions extends StatelessWidget {

  const TopOptions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: CustomButton(icon: Icons.arrow_back_ios),
        ),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                //Navigator.of(context).pop();
              },
              child: CustomButton(icon: Icons.share),
            ),
            SizedBox(width: 5),
            GestureDetector(
                onTap: () {
                  //Navigator.of(context).pop();
                },
                child: CustomButton(icon: Icons.mode_edit)),
          ],
        ),
      ],
    );
  }

  
}
