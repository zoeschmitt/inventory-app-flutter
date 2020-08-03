import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

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
          child: CustomButton(icon: SFSymbols.chevron_left),
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
