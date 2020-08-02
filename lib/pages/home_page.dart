import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/pages/scanner_page.dart';
import 'package:inventory/utils/styles.dart';
import 'package:inventory/widgets/circle_widget.dart';
import 'package:inventory/widgets/filter_widget.dart';
import 'package:inventory/widgets/lists/items_list_widget.dart';
import 'package:inventory/widgets/search_bar_widget.dart';
import 'package:inventory/widgets/top_menu_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _searchQueryController = TextEditingController();

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
      backgroundColor: Colors.grey[100],
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
                ItemsListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

  

