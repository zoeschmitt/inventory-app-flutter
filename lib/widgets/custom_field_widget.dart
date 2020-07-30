import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFieldWidget extends StatefulWidget {
  
  final String fieldTitle;
  final bool enabled;
  final TextEditingController controller;
  final String text;
  final Function valFunc;
  final List<TextInputFormatter> inputFormatters;
  final double maxLines;

  CustomFieldWidget({
    Key key,
    this.fieldTitle,
    this.enabled,
    this.controller,
    this.text,
    this.valFunc,
    this.inputFormatters,
    this.maxLines = 1,
  }) : super(key: key);
  @override
  _CustomFieldWidgetState createState() => _CustomFieldWidgetState();
}

class _CustomFieldWidgetState extends State<CustomFieldWidget> {
  //FormFieldValidator vali;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.fieldTitle,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13.0),
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          initialValue: widget.text,
          controller: widget.controller,
          enabled: widget.enabled,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16.0),
          textCapitalization: TextCapitalization.sentences,
          autovalidate: false,
          inputFormatters: widget.inputFormatters,
          minLines: 1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.0),
              borderSide: BorderSide.none,
            ),
          ),
          validator: widget.valFunc,
        ),
      ],
    );
  }
}