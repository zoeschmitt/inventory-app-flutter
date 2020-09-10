import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/models/category_model.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/pages/modals/add_location_modal.dart';
import 'package:inventory/pages/modals/location_modal.dart';
import 'package:inventory/pages/modals/edit_item_modal.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';
import 'package:inventory/widgets/image_carousel_widget.dart';
import 'package:inventory/widgets/location_container_widget.dart';
import 'package:inventory/widgets/small_container.dart';
import 'package:inventory/widgets/view_coa_report_widget.dart';
import 'package:provider/provider.dart';

import 'modals/coa_modal.dart';
import 'modals/photos_modal.dart';

class ItemPage extends StatefulWidget {
  final Item item;
  final int variation;

  ItemPage({Key key, this.item, this.variation}) : super(key: key);
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  String price = "";
  List<String> images = [];

  @override
  void initState() {
    super.initState();
    final model1 = Provider.of<InventoryModel>(context, listen: false);
    model1.getItemLocations(widget.item.data.variations[widget.variation].id);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print("variation image id" + widget.item.data.variations[widget.variation].imageId);
    print("item image id" + widget.item.imageId);
    return Consumer<InventoryModel>(builder: (context, model, _) {
      price = widget.item.data.variations[widget.variation].data.price.amount
          .toString();
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          model.currentLocationsSet = [];
                          Navigator.of(context).pop();
                        },
                        child: CustomButton(icon: SFSymbols.chevron_left),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                //_photosModal(context, widget.item.data.variations[widget.variation].id);
                                _photosModal(context, widget.item.id);
                              },
                              child: CustomButton(icon: Icons.image)),
                          SizedBox(width: 10),
                          GestureDetector(
                              onTap: () {
                                _editItemModal(
                                    context, widget.item, widget.variation);
                              },
                              child: CustomButton(icon: Icons.mode_edit)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          (widget.item.data.variations.length < 2
                                  ? widget.item.data.name
                                  : widget.item.data
                                      .variations[widget.variation].data.name) +
                              (widget.item.data.variations[widget.variation]
                                          .data.price !=
                                      null
                                  ? " - \$" +
                                      price.substring(0, price.length - 2) +
                                      "." +
                                      price.substring(
                                          price.length - 2, price.length)
                                  : " "),
                          maxLines: 3,
                          style: GoogleFonts.libreFranklin(
                              fontSize: 28,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(width: 10),
                      widget.item.data.categoryId != null
                          ? SmallContainer(
                              text:
                                  model.getItemCat(widget.item.data.categoryId),
                              color: Colors.grey[200],
                            )
                          : Container()
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      widget.item.data.variations[widget.variation].data.sku !=
                              null
                          ? Row(
                              children: <Widget>[
                                Icon(
                                  SFSymbols.barcode,
                                  color: Colors.black54,
                                  size: 20,
                                ),
                                SizedBox(width: 7),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Text(
                                    ("SKU " +
                                        widget
                                            .item
                                            .data
                                            .variations[widget.variation]
                                            .data
                                            .sku),
                                    maxLines: 3,
                                    style: GoogleFonts.libreFranklin(
                                        fontSize: 16,
                                        color: Colors.black26,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                      SizedBox(height: 7),
                      widget.item.data.variations.length < 2
                          ? Container()
                          : Row(
                              children: <Widget>[
                                Icon(
                                  SFSymbols.cube_box_fill,
                                  color: Colors.black54,
                                  size: 20,
                                ),
                                SizedBox(width: 7),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Text(
                                    widget.item.data.name,
                                    maxLines: 3,
                                    style: GoogleFonts.libreFranklin(
                                        fontSize: 16,
                                        color: Colors.black26,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                ImageCarouselWidget(
                  id: widget.item.id,
                ),
                SizedBox(height: 25),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25, bottom: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Builder(
                        builder: (context) =>
                                             GestureDetector(
                            onTap: () async {
                              print("tapped coa");
                              String coa = await model.getCOA(widget.item.data
                                  .variations[widget.variation].data.itemId);

                              if (coa != null && coa.isNotEmpty) {
                                _coaModal(context, coa);
                              } else {
                                final snackBar =
                                    SnackBar(content: Text('No COA Id Found'));
                                Scaffold.of(context).showSnackBar(snackBar);
                              }
                            },
                            child: ViewCOAReportWidget()),
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Locations Present',
                            maxLines: 2,
                            style: GoogleFonts.libreFranklin(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                              onTap: () {
                                _addLocationModal(
                                    context,
                                    widget.item.data
                                        .variations[widget.variation]);
                              },
                              child: SmallContainer(
                                text: "Add Location",
                                color: Colors.grey[200],
                              ))
                        ],
                      ),
                      SizedBox(height: 15),
                      model.currentLocs == null || model.loading == true
                          ? Center(child: CircularProgressIndicator())
                          : ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index1) {
                                return GestureDetector(
                                  onTap: () {
                                    _locationModal(
                                        context,
                                        model.currentLocs[index1],
                                        widget.item.data
                                            .variations[widget.variation]);
                                    //modal w location name and id, xbutton, field where you add new amount and save button.
                                  },
                                  child: AbsorbPointer(
                                      child: LocationContainerWidget(
                                    name: model.currentLocs[index1].name != null
                                        ? model.currentLocs[index1].name
                                        : model.currentLocs[index1].id,
                                    quantity: model.currentLocs[index1].amount,
                                  )),
                                );
                              },
                              itemCount: model.currentLocs.length,
                              shrinkWrap: true,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(height: 10.0);
                              },
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void _locationModal(
      BuildContext context, ItemLocationCount location, ItemVariation item) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        //height: MediaQuery.of(context).size.height * 0.5,
        child: LocationModal(location: location, item: item),
      ),
    );
  }

  void _addLocationModal(BuildContext context, ItemVariation item) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        //height: MediaQuery.of(context).size.height * 0.5,
        child: AddLocationModal(item: item),
      ),
    );
  }

  void _coaModal(BuildContext context, String id) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.9,
        child: COAModal(id: id),
      ),
    );
  }

  void _editItemModal(BuildContext context, Item item, int variation) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: EditItemModal(item: item, variation: variation),
      ),
    );
  }

  void _photosModal(BuildContext context, String id) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) => PhotosModal(id: id),
    );
  }
}
