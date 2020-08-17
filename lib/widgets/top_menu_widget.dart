import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/pages/modals/new_item_modal.dart';
import 'package:inventory/pages/settings_page.dart';
import 'package:provider/provider.dart';


class TopMenuWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<InventoryModel>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            'Inventory',
            maxLines: 2,
            style: GoogleFonts.libreFranklin(
                fontSize: 35,
                color: Colors.black87,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(width: 5),
        IconButton(
            icon: const Icon(
              SFSymbols.gear,
              size: 34,
              color: Colors.black,
            ),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            })
      ],
    );
  }
}

  // _newItemModal(BuildContext context) {
  //   //final photos = [1, 2, 3, 4, 5];
  //   final photosMultiplier = 0.1;
  //   showModalBottomSheet(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(16.0),
  //         topRight: Radius.circular(16.0),
  //       ),
  //     ),
  //     context: context,
  //     isScrollControlled: true,
  //     builder: (context) => SingleChildScrollView(
  //       child: NewItemModal(photosMultiplier: photosMultiplier),
  //     ),
  //   );
  // }






