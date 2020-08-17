import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/utils/styles.dart';
import 'package:inventory/widgets/filter_widget.dart';
import 'package:inventory/widgets/lists/items_list_widget.dart';
import 'package:inventory/widgets/search_bar_widget.dart';
import 'package:inventory/widgets/top_menu_widget.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController controller;

  void _scrollListener() {
    final model = Provider.of<InventoryModel>(context, listen: false);
    
    if (controller.position.pixels == controller.position.maxScrollExtent) {
     
      model.productService((model.products.length + 20).toString());
    }
  }

  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<InventoryModel>(context, listen: false);
    return Scaffold(
      // backlogged QR Scanner
      // floatingActionButton: OpenContainer(
      //     closedBuilder: (_, openContainer) {
      //       return Padding(
      //           padding: const EdgeInsets.all(10),
      //           child: const Icon(
      //         SFSymbols.qrcode_viewfinder,
      //             color: Colors.white,
      //             size: 36,
      //           ));
      //     },
      //     closedColor: Styles.custBlue,
      //     closedElevation: 4.0,
      //     closedShape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.all(Radius.circular(17.0))),
      //     openBuilder: (_, closeContainer) {
      //       return ScannerPage(context: _, closedContainer: closeContainer);
      //     }),
      backgroundColor: Styles.backgroundCol,
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: () async {
            model.productService("20");
          },
          child: SingleChildScrollView(
            controller: controller,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 25.0, right: 25, top: 20, bottom: 45),
              child: Column(
                children: <Widget>[
                  TopMenuWidget(),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      SearchBarWidget(),
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
      ),
    );
  }
}
