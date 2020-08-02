import 'package:flutter/material.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/models/user.dart';
import 'package:inventory/pages/home_page.dart';
import 'package:inventory/pages/sign_up_in/router_page.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    
    if (user == null){
      return RouterPage();
    } else {
      
      return MyHomePage();
    }
  }
}