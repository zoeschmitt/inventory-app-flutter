import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/pages/settings_page.dart';


class TopMenuWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            'Inventory',
            maxLines: 2,
            style: GoogleFonts.libreFranklin(
                fontSize: 35,
                color: Colors.black87,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(width: 5),
        IconButton(
            icon: const Icon(
              SFSymbols.gear,
              size: 34,
              color: Colors.black,
            ),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            })
      ],
    );
  }
}






