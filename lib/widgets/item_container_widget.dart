import 'package:flutter/material.dart';

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
            //put trailer image here
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
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey[300]),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                        child: Center(
                          child: Text(
                            amount,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black38),
                            maxLines: 1,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ),
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
