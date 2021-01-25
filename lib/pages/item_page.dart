import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/models/category_model.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/models/single_item.dart';
import 'package:inventory/pages/coa_page.dart';
import 'package:inventory/pages/modals/add_location_modal.dart';
import 'package:inventory/pages/modals/location_modal.dart';
import 'package:inventory/pages/modals/edit_item_modal.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';
import 'package:inventory/widgets/image_carousel_widget.dart';
import 'package:inventory/widgets/location_container_widget.dart';
import 'package:inventory/widgets/small_container.dart';
import 'package:inventory/widgets/view_coa_report_widget.dart';
import 'package:provider/provider.dart';
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
  SingleItem singleItem = SingleItem();
  String coa;
  List<String> numbers = ['21', '29', '43'];
  List<String> locations = ['San Antonio, TX', 'Dallas, TX', 'Austin, TX', 'Houston, TX', 'Boulder, CO', 'Denver, CO', 'Tucson, AZ', 'Pheonix, AZ'];
  List<String> categories = ['Tincture', 'Topical', 'Capsules', 'Flower', 'Edibles', 'Skin', 'Pets'];
  @override
  void initState() {
    super.initState();
    //getItemInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getItemInfo() async {
    // final model1 = Provider.of<InventoryModel>(context, listen: false);
    // model1.getItemLocations(widget.item.data.variations[widget.variation].id);
    // var itemCOA =
    //     await model1.getCOA(widget.item.data.variations[widget.variation].id);
    // setState(() {
    //   coa = itemCOA;
    // });
  }

  @override
  Widget build(BuildContext context) {
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
                          model.setCurrentItemLocations = [];
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
                          (widget.item.data.variations == null
                                  ? widget.item.data.name
                                  : widget.item.data
                                      .variations[widget.variation].data.name),
                          maxLines: 5,
                          style: GoogleFonts.libreFranklin(
                              fontSize: 26,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(width: 10),
                      SmallContainer(
                              text:
                                  'Tincture',
                              color: Colors.grey[200],
                            )
                          
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
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
                                        '2094582092784'),
                                    maxLines: 4,
                                    style: GoogleFonts.libreFranklin(
                                        fontSize: 16,
                                        color: Colors.black26,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            )
                          ,
                      SizedBox(height: 7),
                      widget.item.data.variations == null
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
                SizedBox(height: 20),
                ImageCarouselWidget(
                  
                ),
                SizedBox(height: 15),
                Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, bottom: 25.0),
                        child: RichText(
                          text: TextSpan(
                            text: "These phytocannabinoid-rich (PCR) hemp oil products are created using full spectrum hemp oil and mixed with coconut oil (MCT) with no added flavor. 250mg / 30ml serving size bottle. Each 1ml dropper contains approximately 10MG CBD.",
                            style: GoogleFonts.libreFranklin(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25, bottom: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                              onTap: () async {
                                //print("tapped coa");
                                if (coa != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => COAPage(id: coa)),
                                  );
                                }
                              },
                              child: ViewCOAReportWidget())
                          ,
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
                      ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index1) {
                                return GestureDetector(
                                  onTap: () {
                                    _locationModal(
                                        context,
                                        locations[index1],
                                        widget.item.data
                                            .variations[widget.variation]);
                                    //modal w location name and id, xbutton, field where you add new amount and save button.
                                  },
                                  child: AbsorbPointer(
                                      child: LocationContainerWidget(
                                    name: locations[index1],
                                    quantity: numbers[index1],
                                  )),
                                );
                              },
                              itemCount: 3,
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
      BuildContext context, String location, ItemVariation item) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) => LocationModal(location: location, item: item),
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
      builder: (context) => Container(
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
