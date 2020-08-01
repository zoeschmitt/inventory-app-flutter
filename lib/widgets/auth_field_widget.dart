import 'package:flutter/material.dart';
import 'package:inventory/utils/styles.dart';

class AuthFieldWidget extends StatelessWidget {
  const AuthFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: "Email",
      //controller: widget.controller,
      //enabled: widget.enabled,
      style: TextStyle(
          color: Colors.black26, fontWeight: FontWeight.normal, fontSize: 16.0),
      textCapitalization: TextCapitalization.none,
      autovalidate: false,
      //inputFormatters: widget.inputFormatters,
      minLines: 1,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        filled: true,
        fillColor: Styles.custBlue.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: BorderSide.none,
        ),
      ),
      //validator: widget.valFunc,
    );
  }
}