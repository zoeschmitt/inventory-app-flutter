import 'package:flutter/material.dart';

class ListItem {
  String name;
  String sku;
  String amount;
  String id;

  ListItem(
      {@required this.id,
      @required this.name,
      @required this.sku,
      @required this.amount});
}
