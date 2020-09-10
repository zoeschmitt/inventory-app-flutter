import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';
import 'package:inventory/widgets/buttons/main_button.dart';
import 'package:inventory/widgets/custom_field_widget.dart';
import 'package:provider/provider.dart';

class EditItemModal extends StatefulWidget {
  final Item item;
  final int variation;
  const EditItemModal({
    Key key,
    this.variation,
    this.item,
  }) : super(key: key);

  @override
  _EditItemModalState createState() => _EditItemModalState();
}

class _EditItemModalState extends State<EditItemModal> {
  String _error = ' ';
  bool loading = false;
  Item editedItem = Item();

  final _formKey = GlobalKey<FormState>();
  String name = '';
  String price = '';

  @override
  void initState() {
    super.initState(); 
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    editedItem = widget.item;
    price = editedItem.data.variations[widget.variation].data.price != null
        ? editedItem.data.variations[widget.variation].data.price.amount
            .toString()
        : " ";
    name = (editedItem.data.variations.length < 2
        ? editedItem.data.name
        : editedItem.data.variations[widget.variation].data.name);
    return Container(
      //height: MediaQuery.of(context).size.height * 0.93,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    //widget.item.data.variations[widget.variation].data.name,
                    (widget.item.data.variations.length < 2
                        ? widget.item.data.name
                        : widget
                            .item.data.variations[widget.variation].data.name),
                    maxLines: 3,
                    style: GoogleFonts.libreFranklin(
                        fontSize: 28,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CustomButton(icon: Icons.clear)),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Text(
              _error,
              style: TextStyle(fontSize: 14.0, color: Colors.red),
            ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CustomFieldWidget(
                    textCap: TextCapitalization.words,
                    enabled: true,
                    fieldTitle: "Name",
                    initialText: (widget.item.data.variations.length < 2
                        ? widget.item.data.name
                        : widget
                            .item.data.variations[widget.variation].data.name),
                    valFunc: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => editedItem.data.variations[widget.variation].data
                              .name = val),
                  ),
                  SizedBox(height: 10),
                  CustomFieldWidget(
                    fieldTitle: "Price",
                    initialText: widget.item.data.variations[widget.variation]
                        .data.price.amount
                        .toString(),
                    valFunc: (val) =>
                        val.isEmpty ? 'Please enter a valid price' : null,
                    onChanged: (val) => setState(() => editedItem.data.variations[widget.variation].data.price.amount = int.parse(val)),
                    textCap: TextCapitalization.words,
                    enabled: true,
                  ),
                  SizedBox(height: 50),
                  MainButton(
                    title: "Update Item",
                    onPressed: () async {
                      final model =
                          Provider.of<InventoryModel>(context, listen: false);
                      if (_formKey.currentState.validate()) {
                        print("valid");
                        //send images
                        setState(() {
                          loading = true;   
                        });
                        bool result = await model.updateProd(editedItem);
                        if (result == null || result == false) {
                          setState(() {
                            loading = false;
                            print("Could not update");
                            _error = "No COA Id Found";
                          });
                        }
                      }
                    },
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
