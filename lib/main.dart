import 'package:flutter/material.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/pages/home_page.dart';
import 'package:inventory/pages/sign_up_in/sign_in_page.dart';
import 'package:inventory/pages/sign_up_in/sign_up_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    InventoryApp(),
  );
}
//multi provider, auth model, inventory model (items list + filters + searching + adding/deleting), notifications (only for modal), 
//item model (get one item), QR model?
class InventoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InventoryModel>(
      create: (context) => InventoryModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: MyHomePage(),
        home: SignUpPage (),
      ),
    );
  }
}
