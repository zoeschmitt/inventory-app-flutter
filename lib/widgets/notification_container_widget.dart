import 'package:flutter/material.dart';

class NotificationContainerWidget extends StatelessWidget {
  final String title;
  final String body;
  final String date;
  const NotificationContainerWidget({
    Key key,
    this.title,
    this.body,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            //put image or icon here
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.grey[300],
            ),
            height: 70,
            width: 70,
          ),
          SizedBox(width: 15.0),
          Flexible(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                      maxLines: 1,
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      date,
                      style: TextStyle(fontSize: 15.0, color: Colors.black26),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  body,
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
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
