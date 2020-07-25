import 'package:flutter/material.dart';
import 'package:inventory/widgets/small_container.dart';

class ItemContainerWidget extends StatelessWidget {
  
  final String name;
  final String sku;
  final String amount;

  const ItemContainerWidget({
    Key key, this.name, this.sku, this.amount,
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
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                      maxLines: 1,
                      textAlign: TextAlign.start,
                    ),
                    SmallContainer(text: amount),
                  ],
                ),
                Text(
                  sku,
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}