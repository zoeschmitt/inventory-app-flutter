import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/models/category_model.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/utils/styles.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';
import 'package:inventory/widgets/custom_field_widget.dart';
import 'package:provider/provider.dart';

class AddLocationModal extends StatefulWidget {
  final ItemVariation item;

  const AddLocationModal({Key key, this.item}) : super(key: key);

  @override
  _AddLocationModalState createState() => _AddLocationModalState();
}

class _AddLocationModalState extends State<AddLocationModal> {
  final _formKey = GlobalKey<FormState>();
  String _newQuantity = "";
  String _error = ' ';
  bool loading = false;
  ItemLocationCount newLocation = ItemLocationCount();
  Locations selectedLocation = Locations(name: "All", id: "0");

  @override
  Widget build(BuildContext context) {
 
    return Padding(
      padding:
          const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0, bottom: 50),
      child: Consumer<InventoryModel>(//                  <--- Consumer
          builder: (context, model, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Add Location",
                      maxLines: 2,
                      style: GoogleFonts.libreFranklin(
                          fontSize: 30,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
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
                            print("in ontap");
                            if (_formKey.currentState.validate() &&
                                model.newLocation.name != "All") {
                              print("valid");
                              //setState(() => loading = true);
                              
                              dynamic result = await model.changeInv(
                                  widget.item.id,
                                  _newQuantity,
                                  model.newLocation.id, true);
                              if (result == null || false) {
                                setState(() {
                                  //loading = false;
                                  print('Could not update');
                                  _error = 'Could not update';
                                });
                              } else {
                                
                                Navigator.of(context).pop();
                              }
                            }
                          },
                        ),
                        SizedBox(width: 15),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Location",
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(14)),
                          child: DropdownButton<Locations>(
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.w400),
                            isExpanded: true,
                            hint: Text("Location"),
                            value: model.newLocation,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 42,
                            underline: SizedBox(),
                            onChanged: (newValue) {
                              print("new location set");
                              model.newLocationSet = newValue;
                            },
                            items: model.newlocationList == null
                                ? List<DropdownMenuItem<Locations>>()
                                : model.newlocationList
                                    .map((value) => DropdownMenuItem(
                                          child: Text(
                                            value.name,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          value: value,
                                        ))
                                    .toList(),
                          )),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: CustomFieldWidget(
                          enabled: true,
                          textCap: TextCapitalization.words,
                          fieldTitle: "Quantity",
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ], // Only numbers can be entered
                          valFunc: (val) =>
                              val.isEmpty ? 'Please enter a number' : null,
                          onChanged: (val) =>
                              setState(() => _newQuantity = val),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  _error,
                  style: TextStyle(fontSize: 14.0, color: Colors.red),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
