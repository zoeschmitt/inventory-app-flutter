// import 'package:flutter/material.dart';
// import 'package:inventory/models/item.dart';
// import 'package:inventory/widgets/item_container_widget.dart';
// import 'package:inventory/widgets/modal_title_widget.dart';
// import 'package:inventory/widgets/search_bar_widget.dart';

// class AddItemModal extends StatelessWidget {
//   const AddItemModal({
//     Key key,
//     @required TextEditingController searchQueryController,
//     @required this.products,
//   }) : _searchQueryController = searchQueryController, super(key: key);

//   final TextEditingController _searchQueryController;
//   final List<Item> products;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
//       child: Column(
//         children: <Widget>[
//           ModalTitleWidget(title: "Add Item"),
//           SizedBox(height: 20.0),
//           Row(
//             children: <Widget>[
//               SearchBarWidget(
//                   searchQueryController: _searchQueryController),
//             ],
//           ),
//           SizedBox(height: 20),
//           Expanded(
//             child: ListView.separated(
//               itemBuilder: (context, index) {
//                 return ItemContainerWidget(
//                   name: products[index].name ?? "Loading...",
//                   sku: products[index].sku ?? ".......",
//                   amount: products[index].amount ?? " ",
//                 );
//               },
//               itemCount: products.length,
//               shrinkWrap: true,
//               separatorBuilder: (BuildContext context, int index) {
//                 return SizedBox(height: 20.0);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }