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
      width: MediaQuery.of(context).size.width - 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            //put item image here
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.grey[300],
            ),
            height: MediaQuery.of(context).size.width / 4.8,
            width: MediaQuery.of(context).size.width / 4.8,
          ),
          SizedBox(width: 13.0),
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        name,
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600),
                        maxLines: 3,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(width: 5),
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
