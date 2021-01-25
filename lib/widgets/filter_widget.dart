import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/models/category_model.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/widgets/modal_title_widget.dart';
import 'package:provider/provider.dart';

import 'buttons/custom_button.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({
    Key key,
  }) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  List<String> locations = ['All', 'San Antonio, TX', 'Dallas, TX', 'Austin, TX', 'Houston, TX', 'Boulder, CO', 'Denver, CO', 'Tucson, AZ', 'Pheonix, AZ'];
  List<String> categories = ['All', 'Tincture', 'Topical', 'Capsules', 'Flower', 'Edibles', 'Skin', 'Pets'];
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
          child: IconButton(
            icon: const Icon(
              SFSymbols.slider_horizontal_3,
              size: 28.0,
              color: Colors.black26,
            ),
            onPressed: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                context: context,
                isScrollControlled: false,
                builder: (context) => Padding(
                  padding: const EdgeInsets.only(
                      top: 25.0, left: 25.0, right: 25.0, bottom: 80.0),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      //ModalTitleWidget(title: "Filters"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                "Filters",
                                maxLines: 1,
                                style: GoogleFonts.libreFranklin(
                                    fontSize: 30,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600),
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
                      //_loading ? Container(child: CircularProgressIndicator()) : Container(),
                      SizedBox(height: 20.0),
                      Consumer<InventoryModel>(//                  <--- Consumer
                          builder: (context, myModel, _) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //category
                            Text(
                              "Category",
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 14,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 10),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(14)),
                                child: DropdownButton<String>(
                                  style: GoogleFonts.sourceSansPro(
                                      fontSize: 18,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w400),
                                  isExpanded: true,
                                  hint: Text("Category"),
                                  value: "All",
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 42,
                                  underline: SizedBox(),
                                  onChanged: (newValue) async {
                                    
                                  },
                                  items: 
                                      categories
                                          .map((value) => DropdownMenuItem(
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                value: value,
                                              ))
                                          .toList(),
                                )),
                            SizedBox(height: 20),
                            //location
                            Text(
                              "Location",
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 14,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 10),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(14)),
                                child: DropdownButton(
                                  style: GoogleFonts.sourceSansPro(
                                      fontSize: 18,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w400),
                                  isExpanded: true,
                                  hint: Text("Location"),
                                  value: "All",
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 42,
                                  underline: SizedBox(),
                                  onChanged: (newValue) async {
                                    
                                  },
                                  items: locations
                                          .map((value) => DropdownMenuItem(
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                value: value,
                                              ))
                                          .toList(),
                                )),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
