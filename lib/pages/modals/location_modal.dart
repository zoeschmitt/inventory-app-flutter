import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/models/category_model.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/utils/styles.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';
import 'package:provider/provider.dart';

class LocationModal extends StatefulWidget {
  final ItemLocationCount location;
  final ItemVariation item;

  const LocationModal({Key key, this.location, this.item}) : super(key: key);

  @override
  _LocationModalState createState() => _LocationModalState();
}

class _LocationModalState extends State<LocationModal> {
  final _formKey = GlobalKey<FormState>();
  String _newQuantity = "";
  String _error = ' ';
  bool loading = false;
  int add = 0;

  @override
  Widget build(BuildContext context) {
    //_newQuantity = widget.location.amount;
    double width = MediaQuery.of(context).size.width.toDouble();
    final model = Provider.of<InventoryModel>(context, listen: false);
    return Padding(
      padding:
          const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0, bottom: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: <Widget>[
                    Text(
                      widget.location.name != null &&
                              (widget?.location?.name?.isNotEmpty ?? false)
                          ? widget.location.name
                          : widget.location.id,
                      maxLines: 4,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.libreFranklin(
                          fontSize: 24,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      widget.location.name != null &&
                              (widget?.location?.name?.isNotEmpty ?? false)
                          ? ("Id: " + widget.location.id)
                          : "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.libreFranklin(
                          fontSize: 16,
                          color: Colors.black26,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 5.0),
              Row(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Styles.custBlue,
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: model.loading == true
                              ? CircularProgressIndicator()
                              : Text(
                                  'Save',
                                  style: TextStyle(
                                      color: (Colors.white),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0),
                                ),
                        )),
                    onTap: () async {
                      //print("in ontap");
                      if (_formKey.currentState.validate()) {
                        //print("valid");
                        //setState(() => loading = true);
                        //print("new quanitty" + _newQuantity);
                        dynamic result = await model.changeInv(
                            widget.item.id,
                            _newQuantity,
                            widget.location.id,
                            add == 0 ? true : false);
                        if (result == null || false) {
                          setState(() {
                            //loading = false;
                            _error = 'Could not update';
                          });
                        } else {
                          Navigator.of(context).pop();
                        }
                      }
                    },
                  ),
                  SizedBox(width: 15.0),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CustomButton(icon: Icons.clear)),
                ],
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CupertinoSegmentedControl(
                    children: {
                      0: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Add")),
                      1: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Remove")),
                    },
                    selectedColor: Styles.custBlue,
                    borderColor: Styles.custBlue,
                    groupValue: add,
                    onValueChanged: (value) {
                      setState(() => add = value);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Quantity",
                    style: GoogleFonts.sourceSansPro(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 4),
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        enabled: true,
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400),
                        autovalidate: false,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: widget.location.amount,
                          hintMaxLines: 1,
                          hintStyle: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            color: Colors.black38,
                            fontWeight: FontWeight.w400),
                          contentPadding: EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 15),
                          filled: true,
                          fillColor: Styles.backgroundCol,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Please enter a number' : null,
                        onChanged: (val) {
                          setState(() {
                            _newQuantity = val;
                          });
                        }
                        // (val) =>
                        //     setState(() => _newQuantity = val),
                        ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Text(
            _error,
            style: TextStyle(fontSize: 14.0, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
