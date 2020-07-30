import 'package:flutter/material.dart';

class ListItem {
  final String name;
  final String sku;
  final String amount;
  final String id;

  const ListItem(this.id, {
    @required this.name,
    @required this.sku,
    @required this.amount
    });
}