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
      backgroundColor: Styles.backgroundCol,
      body: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          CircleWidget(
            left: -120,
            top: -100,
            mult: 1.4,
          ),
          CircleWidget(
            right: -120,
            top: -100,
            mult: 1.4,
          ),
          CircleWidget(
            right: -190,
            top: 185,
            mult: 1.4,
          ),
          CircleWidget(
            left: -100,
            bottom: -80,
            mult: 1.2,
          ),
          CircleWidget(
            left: -120,
            top: 220,
            mult: 1.4,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 65.0, sigmaY: 65.0),
            child: Container(
              color: Colors.white.withOpacity(0.9),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          SafeArea(
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
        ],
      ),
    );
  }
}

  

