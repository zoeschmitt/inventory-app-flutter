import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/utils/styles.dart';

class CustomFieldWidget extends StatefulWidget {
  
  final String fieldTitle;
  final bool enabled;
  final TextEditingController controller;
  final String initialText;
  final Function valFunc;
  final Function onChanged;
  final List<TextInputFormatter> inputFormatters;
  final double maxLines;
  final TextCapitalization textCap;
  final TextInputType keyboardType;

  CustomFieldWidget({
    Key key,
    this.fieldTitle,
    this.enabled,
    this.controller,
    this.initialText,
    this.valFunc,
    this.inputFormatters,
    this.maxLines = 1, this.textCap, this.onChanged, this.keyboardType,
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
          style: GoogleFonts.sourceSansPro(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          keyboardType: widget.keyboardType == null ? null : widget.keyboardType,
          initialValue: widget.initialText,
          controller: widget.controller,
          enabled: widget.enabled,
          style: GoogleFonts.sourceSansPro(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400),
          textCapitalization: widget.textCap,
          autovalidate: false,
          inputFormatters: widget.inputFormatters,
          minLines: 1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            filled: true,
            fillColor: Styles.backgroundCol,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.0),
              borderSide: BorderSide.none,
            ),
          ),
          validator: widget.valFunc,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}