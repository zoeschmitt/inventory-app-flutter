import 'package:flutter/material.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/pages/auth_page.dart';
import 'package:inventory/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';
import 'pages/home_page.dart';

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
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(value: AuthService().user),
        ChangeNotifierProvider<InventoryModel>(
            create: (context) => InventoryModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
