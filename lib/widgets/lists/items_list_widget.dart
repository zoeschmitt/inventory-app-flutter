import 'package:flutter/material.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/pages/item_page.dart';
import 'package:inventory/widgets/item_container_widget.dart';
import 'package:provider/provider.dart';

class ItemsListWidget extends StatelessWidget {
  const ItemsListWidget({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("list built");
    return Consumer<InventoryModel>( 
        builder: (context, model, _) => model.products == null
            ? CircularProgressIndicator()
            : ListView.separated(           
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return model.products.isEmpty
                      ? Text("pull to refresh")
                      : ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index1) {                           
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ItemPage()),
                                );
                              },
                              child: AbsorbPointer(
                                child: ItemContainerWidget(
                                  name: model.products[index].data.variations
                                              .length <
                                          2
                                      ? model.products[index].data.name
                                      : model.products[index].data
                                          .variations[index1].data.name,
                                  sku: "$index " " $index1",
                                  amount: "200",
                                ),
                              ),
                            );
                          },
                          itemCount:
                              model.products[index].data.variations.length,
                          shrinkWrap: true,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 15.0);
                          },
                        );
                },
                itemCount: model.products.isEmpty ? 1 : model.products.length,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 15.0);
                },
              ));
  }
}
