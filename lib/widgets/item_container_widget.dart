import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/widgets/small_container.dart';

class ItemContainerWidget extends StatelessWidget {
  final String name;
  final String itemName;
  final String amount;
  final String imageId;
  static const IMG_BASE_URL = 'https://shop.imgix.net/';

  const ItemContainerWidget({
    Key key,
    this.name,
    this.itemName,
    this.amount, this.imageId, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // possible backlogged, item image
          Container(
            decoration: BoxDecoration(
              image: (imageId != null && imageId.isNotEmpty) ? DecorationImage(
        fit: BoxFit.cover, image: NetworkImage(IMG_BASE_URL + imageId)) : null,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.width / 5,
            width: MediaQuery.of(context).size.width / 5,
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
                    SizedBox(width: 10),
                    SmallContainer(
                      text: amount,
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        itemName,
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
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
