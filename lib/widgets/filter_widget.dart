import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/widgets/modal_title_widget.dart';
import 'package:provider/provider.dart';

class FilterWidget extends StatelessWidget {
  final List<String> _dropVals = <String>[
    "All",
    'San Antonio, TX',
    'Austin, TX',
    'Dallas, TX',
    'Houston, TX'
  ];

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
                      top: 25.0, left: 25.0, right: 25.0, bottom: 200.0),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ModalTitleWidget(title: "Filter Items"),
                      SizedBox(height: 20.0),
                      Consumer<InventoryModel>(//                  <--- Consumer
                          builder: (context, myModel, _) {
                        return Container(
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
                              value: myModel.location,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 42,
                              underline: SizedBox(),
                              onChanged: (newValue) {
                                print("new location set");
                                final model = Provider.of<InventoryModel>(
                                    context,
                                    listen: false);
                                model.filterLocation(newValue);
                              },
                              items: _dropVals
                                  .map((value) => DropdownMenuItem(
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: value,
                                      ))
                                  .toList(),
                            ));
                      })
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
