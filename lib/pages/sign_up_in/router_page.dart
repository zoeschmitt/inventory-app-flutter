import 'package:flutter/material.dart';
import 'package:inventory/pages/sign_up_in/sign_in_page.dart';
import 'package:inventory/pages/sign_up_in/sign_up_page.dart';

class RouterPage extends StatefulWidget {
  @override
  _RouterPageState createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {

  bool showSignIn = true;
  
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInPage(toggleView:  toggleView);
    } else {
      return SignUpPage(toggleView:  toggleView);
    }
  }
}