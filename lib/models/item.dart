import 'package:flutter/material.dart';

class Item {
  final String name;
  final String sku;
  final String amount;

  const Item({
    @required this.name,
    @required this.sku,
    @required this.amount
    });
}