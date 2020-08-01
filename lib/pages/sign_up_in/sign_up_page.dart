import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inventory/utils/styles.dart';
import 'package:inventory/widgets/auth_field_widget.dart';
import 'package:inventory/widgets/buttons/main_button.dart';
import 'package:inventory/widgets/circle_widget.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          CircleWidget(
            left: -120,
            top: -100,
            mult: 1.4,
          ),
          CircleWidget(
            right: -190,
            top: 185,
            mult: 1.4,
          ),
          CircleWidget(
            left: -100,
            bottom: -80,
            mult: 1.2,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 65.0, sigmaY: 65.0),
            child: Container(
              color: Colors.white.withOpacity(0.75),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25, top: 20, bottom: 50),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height / 5),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 34,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 6),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 18.0,
                                spreadRadius: 7.0,
                                color: Colors.black.withOpacity(0.03)),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: <Widget>[
                            AuthFieldWidget(),
                            SizedBox(height: 15),
                            AuthFieldWidget(),
                            SizedBox(height: 15),
                            AuthFieldWidget(),
                            SizedBox(height: 15),
                            AuthFieldWidget(),
                            SizedBox(height: 15),
                            MainButton(
                              title: "Sign Up",
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
