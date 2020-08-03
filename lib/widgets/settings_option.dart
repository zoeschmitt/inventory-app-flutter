import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'buttons/custom_button.dart';

class SettingsOption extends StatelessWidget {
  final String title;
  final IconData icon;
  const SettingsOption({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CustomButton(icon: icon),
        SizedBox(width: 20),
        Text(
          title,
          maxLines: 2,
          style: GoogleFonts.sourceSansPro(
              fontSize: 22, color: Colors.black87, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}