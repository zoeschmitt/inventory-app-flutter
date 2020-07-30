import 'package:flutter/material.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    InventoryApp(),
  );
}

class InventoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InventoryModel>(
      create: (context) => InventoryModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
