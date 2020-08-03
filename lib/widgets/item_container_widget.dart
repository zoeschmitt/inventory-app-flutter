import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/widgets/small_container.dart';

class ItemContainerWidget extends StatelessWidget {
  final String name;
  final String sku;
  final String amount;

  const ItemContainerWidget({
    Key key,
    this.name,
    this.sku,
    this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            //put item image here
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.grey[300],
            ),
            height: 75,
            width: 75,
          ),
          SizedBox(width: 15.0),
          Flexible(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      name,
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                      maxLines: 1,
                      textAlign: TextAlign.start,
                    ),
                    SmallContainer(text: amount),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      SFSymbols.barcode,
                      color: Colors.black54,
                      size: 20,
                    ),
                    SizedBox(width: 7),
                    Text(
                      sku,
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.w400),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
