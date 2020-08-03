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
        builder: (context, items, _) => items.allTasks == null ? CircularProgressIndicator() :
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
              name: items.allTasks[index].name ?? "Loading...",
              sku: items.allTasks[index].sku ?? ".......",
              amount: items.allTasks[index].amount ?? " ",
            ),
          ),
        );
      },
      itemCount: items.allTasks.length,
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 15.0);
      },
     )
    );
  }
}