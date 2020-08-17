import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/models/category_model.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/utils/styles.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';
import 'package:inventory/widgets/custom_field_widget.dart';
import 'package:provider/provider.dart';

class LocationModal extends StatefulWidget {
  final ItemLocationCount location;
  final String id;

  const LocationModal({Key key, this.location, this.id}) : super(key: key);

  @override
  _LocationModalState createState() => _LocationModalState();
}

class _LocationModalState extends State<LocationModal> {
  final _formKey = GlobalKey<FormState>();
  String _newQuantity = "";
  String _error = ' ';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<InventoryModel>(context, listen: false);
    return Padding(
      padding:
          const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.location.name,
                        maxLines: 2,
                        style: GoogleFonts.libreFranklin(
                            fontSize: 30,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        "Id: " + widget.location.id,
                        maxLines: 2,
                        style: GoogleFonts.libreFranklin(
                            fontSize: 16,
                            color: Colors.black26,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CustomButton(icon: Icons.clear)),
                ],
              ),
              SizedBox(height: 30.0),
              CustomFieldWidget(
                key: ,
                textCap: TextCapitalization.words,
                enabled: true,
                fieldTitle: "Quantity",
                initialText: widget.location.amount,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
                valFunc: (val) => val.isEmpty ? 'Please enter a number' : null,
                onChanged: (val) => setState(() => _newQuantity = val),
              ),
            ],
          ),
          GestureDetector(
            child: Container(
                decoration: BoxDecoration(
                  color: Styles.custBlue,
                  borderRadius: BorderRadius.circular(9.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: loading
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
              if (_formKey.currentState.validate()) {
                print("valid");
                setState(() => loading = true);
                dynamic result =
                    await model.changeInv();
                if (result == null) {
                  setState(() {
                    loading = false;
                    _error = 'Could not sign in with those credentials';
                  });
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
