import 'package:flutter/material.dart';
import 'package:inventory/utils/styles.dart';

class EditButton extends StatefulWidget {
  final bool isEditing;
  const EditButton({
    Key key, this.isEditing,
  }) : super(key: key);

  @override
  _EditButton createState() => _EditButton();

}

class _EditButton extends State<EditButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: widget.isEditing ? BoxDecoration(
          color: Styles.custBlue,
        borderRadius: BorderRadius.circular(9.0),) : 
        BoxDecoration(
            border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(9.0),),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 7, bottom: 7),
          child: Text(
            widget.isEditing ? 'Save' : 'Edit',
            style: TextStyle(color: (widget.isEditing ? Colors.white : Colors.black), fontWeight: FontWeight.normal, fontSize: 14.0),
          ),
        ));
  }
}