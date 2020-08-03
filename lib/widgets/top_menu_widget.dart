import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/pages/modals/add_item_modal.dart';
import 'package:inventory/pages/modals/new_item_modal.dart';
import 'package:inventory/pages/modals/notifications_modal.dart';
import 'package:inventory/pages/settings_page.dart';

class TopMenuWidget extends StatefulWidget {
  const TopMenuWidget({
    Key key,
  }) : super(key: key);

  @override
  _TopMenuWidgetState createState() => _TopMenuWidgetState();
}


class _TopMenuWidgetState extends State<TopMenuWidget> {
  final _searchQueryController = TextEditingController();
  final _scrollController = ScrollController();

  final products = [
    Item(name: "Product", sku: "02342834923", amount: "227"),
    Item(name: "Lorem Ipsum", sku: "02342834923", amount: "227"),
    Item(name: "A Product", sku: "02342834923", amount: "227"),
    Item(name: "Product", sku: "02342834923", amount: "227"),
    Item(name: "Product", sku: "02342834923", amount: "227"),
    Item(name: "Lorem Ipsum", sku: "02342834923", amount: "227"),
    Item(name: "A Product", sku: "02342834923", amount: "227"),
    Item(name: "Product", sku: "02342834923", amount: "227")
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Inventory',
                maxLines: 2,
                style: GoogleFonts.libreFranklin(
                    fontSize: 35,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "524 Items",
                style: GoogleFonts.sourceSansPro(
                    fontSize: 20,
                    color: Colors.black38,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        SizedBox(width: 5),
        IconButton(
            icon: const Icon(
              SFSymbols.plus_square_fill,
              //Icons.add_box,
              size: 34,
              color: Colors.black,
            ),
            onPressed: () {
              _addItemActionSheet(context);
            }),
        SizedBox(width: 5),
        IconButton(
            icon: const Icon(
              SFSymbols.bell_fill,
              size: 34,
              color: Colors.black,
            ),
            onPressed: () {
              _notificationsModal(context);
            }),
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

  _notificationsModal(BuildContext context) {
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
        height: MediaQuery.of(context).size.height * 0.93,
        child: NotificationsModal(),
      ),
    );
  }

  _addItemActionSheet(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
              actions: <Widget>[
                CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _newItemModal(context);
                    },
                    child: Text("Create New Item")),
                CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _addItemModal(context);
                    },
                    child: Text("Add Existing Item"))
              ],
              cancelButton: CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel")),
            ));
  }

  _newItemModal(BuildContext context) {
    //final photos = [1, 2, 3, 4, 5];
    final photosMultiplier = 0.1;
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
        child: NewItemModal(photosMultiplier: photosMultiplier),
      ),
    );
  }

  _addItemModal(BuildContext context) {
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
        height: MediaQuery.of(context).size.height * 0.93,
        child: AddItemModal(searchQueryController: _searchQueryController, products: products),
      ),
    );
  }
}





