import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/services/firebase_auth_service.dart';
import 'package:inventory/utils/loading.dart';
import 'package:inventory/utils/styles.dart';
import 'package:inventory/widgets/buttons/main_button.dart';

class SignInPage extends StatefulWidget {
  final Function toggleView;
  SignInPage({this.toggleView});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Styles.backgroundCol,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * .85,
                  child: Column(
                    //mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //SizedBox(height: MediaQuery.of(context).size.height / 5),
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 35,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              error,
                              style:
                                  TextStyle(fontSize: 14.0, color: Colors.red),
                            ),
                            SizedBox(height: 10),
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
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        //controller: widget.controller,
                                        //enabled: widget.enabled,
                                        style: Styles.authStyle,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        autovalidate: false,
                                        onChanged: (val) {
                                          setState(() => email = val);
                                        },
                                        //inputFormatters: widget.inputFormatters,
                                        minLines: 1,
                                        decoration: Styles.returnDec("Email"),
                                        validator: (val) =>
                                            val.isEmpty || !val.contains("@")
                                                ? 'Enter a valid email'
                                                : null,
                                      ),
                                      SizedBox(height: 15),
                                      TextFormField(
                                        obscureText: true,
                                        //controller: widget.controller,
                                        //enabled: widget.enabled,
                                        style: Styles.authStyle,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        autovalidate: false,
                                        onChanged: (val) {
                                          setState(() => password = val);
                                        },
                                        //inputFormatters: widget.inputFormatters,
                                        minLines: 1,
                                        decoration:
                                            Styles.returnDec("Password"),
                                        validator: (val) => val.length < 6
                                            ? 'Password Invalid'
                                            : null,
                                      ),
                                      SizedBox(height: 15),
                                      MainButton(
                                        title: "Sign In",
                                        onPressed: () async {
                                          if (_formKey.currentState
                                              .validate()) {
                                            print("valid");
                                            setState(() => loading = true);
                                            dynamic result = await _auth
                                                .signInWithEmailAndPassword(
                                                    email, password);
                                            if (result == null) {
                                              setState(() {
                                                loading = false;
                                                error =
                                                    'Could not sign in with those credentials';
                                              });
                                            }
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  // Text(
                                  //   "Forgot Password?",
                                  //   style: GoogleFonts.sourceSansPro(
                                  //       fontSize: 15,
                                  //       color: Colors.black87,
                                  //       fontWeight: FontWeight.w400),
                                  // ),
                                  GestureDetector(
                                    onTap: () => widget.toggleView(),
                                    child: Text(
                                      "Sign Up",
                                      style: GoogleFonts.sourceSansPro(
                                          fontSize: 15,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
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
          );
  }
}
