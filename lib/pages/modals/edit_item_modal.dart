import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/models/single_item.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';
import 'package:inventory/widgets/buttons/main_button.dart';
import 'package:inventory/widgets/custom_field_widget.dart';
import 'package:provider/provider.dart';

import '../../models/item.dart';

class EditItemModal extends StatefulWidget {
  final String id;
  final Item item;
  final int variation;

  const EditItemModal({
    Key key,
    this.id,
    this.variation, this.item,
  }) : super(key: key);

  @override
  _EditItemModalState createState() => _EditItemModalState();
}

class _EditItemModalState extends State<EditItemModal> {
  String _error = ' ';
  bool _loading = false;
  SingleItem item;

  final _formKey = GlobalKey<FormState>();
  String name = '';
  String price = '';

  @override
  void initState() {
    super.initState();
    getItem();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getItem() async {
    final model1 = Provider.of<InventoryModel>(context, listen: false);
    //var result = await model1.getSingleItem(widget.id);

    setState(() {
     // item = result;
      _loading = false;
    });
    // print("item");
    // print(item.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
                //height: MediaQuery.of(context).size.height * 0.93,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
                  child: Padding(
                    padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                fit: FlexFit.tight,
                                child: Text(
                                  (widget.item.data.variations != null
                                      ? widget.item.data.name
                                      : widget.item.data.variations[widget.variation].data
                                          .name),
                                  maxLines: 3,
                                  style: GoogleFonts.libreFranklin(
                                      fontSize: 24,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(width: 15),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: CustomButton(icon: Icons.clear)),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            _error,
                            style: TextStyle(fontSize: 14.0, color: Colors.red),
                          ),
                          SizedBox(height: 10.0),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                CustomFieldWidget(
                                  textInputAction: TextInputAction.done,
                                  textCap: TextCapitalization.words,
                                  enabled: true,
                                  fieldTitle: "Item Name",
                                  initialText: widget.item.data.name,
                                  valFunc: (val) =>
                                      val.isEmpty ? 'Please enter a name' : null,
                                  onChanged: (val) =>
                                      setState(() => widget.item.data.name = val),
                                ),
                                SizedBox(height: 13),
                                CustomFieldWidget(
                                  textInputAction: TextInputAction.done,
                                  textCap: TextCapitalization.words,
                                  enabled: true,
                                  fieldTitle: "Variation Name",
                                  initialText: widget.item.data.variations != null
                                      ? widget.item.data.variations[widget.variation].data
                                          .name
                                      : "",
                                  valFunc: (val) =>
                                      val.isEmpty ? 'Please enter a name' : null,
                                  onChanged: (val) => setState(() => widget.item.data
                                      .variations[widget.variation].data.name = val),
                                ),
                                SizedBox(height: 13),
                                CustomFieldWidget(
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.number,
                                  fieldTitle: "Price",
                                  
                                  initialText: widget.item.data.variations != null
                                      ? widget.item.data.variations[widget.variation].data
                                          .price.amount
                                          .toString()
                                      : "",
                                  valFunc: (val) => val.isEmpty
                                      ? 'Please enter a valid price'
                                      : null,
                                  // onChanged: (val) => setState(() => item
                                  //     .itemData
                                  //     .variations[widget.variation]
                                  //     .priceMoney
                                  //     .amount = int.parse(val)),
                                  textCap: TextCapitalization.words,
                                  enabled: true,
                                ),
                                SizedBox(height: 13),
                                CustomFieldWidget(
                                  textInputAction: TextInputAction.done,
                                  fieldTitle: "Description",
                                  initialText: "These phytocannabinoid-rich (PCR) hemp oil products are created using full spectrum hemp oil and mixed with coconut oil (MCT) with no added flavor. 250mg / 30ml serving size bottle. Each 1ml dropper contains approximately 10MG CBD.",
                                  onChanged: (val) => setState(
                                      () => item.itemData.description = val),
                                  textCap: TextCapitalization.sentences,
                                  enabled: true,
                                ),
                                SizedBox(height: 50),
                                MainButton(
                                  title: "Update Item",
                                  onPressed: () async {
                                    final model = Provider.of<InventoryModel>(
                                        context,
                                        listen: false);
                                    if (_formKey.currentState.validate()) {
                                      //print("valid");
                                      //send images
                                      // setState(() {
                                      //   _loading = true;
                                      // });

                                      // //bool result = await model.updateProd(item);

                                      // if (result == null || result == false) {
                                      //   setState(() {
                                      //     _loading = false;
                                      //     //print("Could not update");
                                      //     _error = "Could Not Update";
                                      //   });
                                      // } else {
                                      //   setState(() {
                                      //     _loading = false;
                                      //   });
                                      //   model.productService();
                                      //   Navigator.of(context).pop();
                                      // }
                                    }
                                  },
                                ),
                                SizedBox(height: 50),
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
