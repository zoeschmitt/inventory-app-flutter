import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/pages/item_page.dart';
import 'package:inventory/pages/scanner_page.dart';
import 'package:inventory/utils/styles.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';
import 'package:inventory/widgets/filter_widget.dart';
import 'package:inventory/widgets/item_container_widget.dart';
import 'package:inventory/widgets/menu_item_widget.dart';
import 'package:inventory/widgets/modal_title_widget.dart';
import 'package:inventory/widgets/search_bar_widget.dart';
import 'package:inventory/widgets/top_menu_widget.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _searchQueryController = TextEditingController();
  
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
    return Scaffold(
      floatingActionButton: OpenContainer(
          closedBuilder: (_, openContainer) {
            return Padding(
                padding: const EdgeInsets.all(15),
                child: Icon(
                  Icons.select_all,
                  color: Colors.white,
                ));
          },
          closedColor: Styles.custBlue,
          closedElevation: 4.0,
          closedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(17.0))),
          openBuilder: (_, closeContainer) {
            return ScannerPage(context: _, closedContainer: closeContainer);
          }),
      backgroundColor: Styles.backgroundCol,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25, top: 20, bottom: 45),
            child: Column(
              children: <Widget>[
                TopMenuWidget(),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    SearchBarWidget(
                        searchQueryController: _searchQueryController),
                    SizedBox(width: 10),
                    FilterWidget(),
                  ],
                ),
                SizedBox(height: 25),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ItemPage()),
                        );
                      },
                      child: AbsorbPointer(
                        child: ItemContainerWidget(
                          name: products[index].name ?? "Loading...",
                          sku: products[index].sku ?? ".......",
                          amount: products[index].amount ?? " ",
                        ),
                      ),
                    );
                  },
                  itemCount: products.length,
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 10.0);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
  

