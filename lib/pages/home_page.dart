import 'package:flutter/material.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/pages/item_page.dart';
import 'package:inventory/utils/styles.dart';
import 'package:inventory/widgets/filter_widget.dart';
import 'package:inventory/widgets/item_container_widget.dart';
import 'package:inventory/widgets/menu_item_widget.dart';
import 'package:inventory/widgets/search_bar_widget.dart';
import 'package:inventory/widgets/top_menu_widget.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class MyHomePage extends StatelessWidget{
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
    return Scaffold(
      backgroundColor: Styles.backgroundCol,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 25.0, right: 25, top: 55, bottom: 45),
          child: Column(
            children: <Widget>[
              TopMenuWidget(),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MenuItemWidget(
                    title: 'Scan',
                    icon: Icons.stay_current_portrait,
                  ),
                  SizedBox(width: 14),
                  MenuItemWidget(
                    title: 'Add',
                    icon: Icons.add_box,
                  ),
                  SizedBox(width: 14),
                  MenuItemWidget(
                    title: 'Export',
                    icon: Icons.file_upload,
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Inventory",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "524 Items",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black26,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  SearchBarWidget(
                      searchQueryController: _searchQueryController),
                  SizedBox(width: 10),
                  GestureDetector(
                      onTap: () {
                        print("object");
                      },
                      child: FilterWidget()),
                ],
              ),
              //SizedBox(height: 5),
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
                    child: ItemContainerWidget(
                      name: products[index].name ?? "Loading...",
                      sku: products[index].sku ?? ".......",
                      amount: products[index].amount ?? " ",
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
    );
  }
}
