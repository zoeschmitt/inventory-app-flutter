import 'package:flutter/material.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/pages/item_page.dart';
import 'package:inventory/utils/styles.dart';
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
                      ? Center(child: Text("No Products", style: Styles.authStyle))
                      : ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index1) {               
                            String price = model.products[index].data
                                          .variations[index1].data.price != null ? model.products[index].data.variations[index1].data.price.amount.toString() : " ";            
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ItemPage(item: model.products[index], variation: index1,)
                                      ),
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
                                  sku: model.products[index].data
                                          .variations.length > 1 ? model.products[index].data.name : " ",
                                  amount: model.products[index].data
                                          .variations[index1].data.price != null ? ("\$" + price.substring(0, price.length - 2) + "." + price.substring(price.length - 2, price.length)) : (" "),
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
