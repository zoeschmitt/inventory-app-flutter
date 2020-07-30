import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/models/user_notification.dart';
import 'package:inventory/pages/settings_page.dart';
import 'package:inventory/utils/styles.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';
import 'package:inventory/widgets/custom_field_widget.dart';
import 'package:inventory/widgets/modal_title_widget.dart';
import 'package:inventory/widgets/search_bar_widget.dart';

import 'item_container_widget.dart';
import 'notification_container_widget.dart';

class TopMenuWidget extends StatefulWidget {
  const TopMenuWidget({
    Key key,
  }) : super(key: key);

  @override
  _TopMenuWidgetState createState() => _TopMenuWidgetState();
}

final notifs = [
  UserNotification(
      title: "Notification",
      body: "Lorem Ipsum blah blah blah heres a notification",
      date: "June 29th, 2020"),
  UserNotification(
      title: "Notification",
      body: "Lorem Ipsum blah blah blah heres a notification",
      date: "June 29th, 2020"),
  UserNotification(
      title: "Notification",
      body: "Lorem Ipsum blah blah blah heres a notification",
      date: "June 29th, 2020"),
  UserNotification(
      title: "Notification",
      body: "Lorem Ipsum blah blah blah heres a notification",
      date: "June 29th, 2020"),
  UserNotification(
      title: "Notification",
      body: "Lorem Ipsum blah blah blah heres a notification",
      date: "June 29th, 2020"),
  UserNotification(
      title: "Notification",
      body: "Lorem Ipsum blah blah blah heres a notification",
      date: "June 29th, 2020"),
  UserNotification(
      title: "Notification",
      body: "Lorem Ipsum blah blah blah heres a notification",
      date: "June 29th, 2020"),
  UserNotification(
      title: "Notification",
      body: "Lorem Ipsum blah blah blah heres a notification",
      date: "June 29th, 2020"),
  UserNotification(
      title: "Notification",
      body: "Lorem Ipsum blah blah blah heres a notification",
      date: "June 29th, 2020"),
];

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
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "524 Items",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black26,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 5),
        IconButton(
            icon: Icon(
              Icons.add_box,
              size: 36,
              color: Colors.black,
            ),
            onPressed: () {
              _addItemActionSheet(context);
            }),
        SizedBox(width: 4),
        IconButton(
            icon: Icon(
              Icons.notifications,
              size: 36,
              color: Colors.black,
            ),
            onPressed: () {
              _notificationsModal(context);
            }),
        SizedBox(width: 4),
        IconButton(
            icon: Icon(
              Icons.settings,
              size: 36,
              color: Colors.black,
            ),
            onPressed: () {
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
        child: Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
            child: Column(
              children: <Widget>[
                ModalTitleWidget(title: "Notifications"),
                SizedBox(height: 30.0),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return NotificationContainerWidget(
                        title: notifs[index].title,
                        body: notifs[index].body,
                        date: notifs[index].date,
                      );
                    },
                    itemCount: notifs.length,
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 20.0);
                    },
                  ),
                ),
              ],
            )),
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
                      _newItemModal(context);
                    },
                    child: Text("Create New Item")),
                CupertinoActionSheetAction(
                    onPressed: () {
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
    final photos = [1, 2, 3, 4, 5];
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
        child: Container(
          height: MediaQuery.of(context).size.height * 0.93,
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
                child: ModalTitleWidget(title: "New Item"),
              ),
              SizedBox(height: 20.0),
              Container(
                height: MediaQuery.of(context).size.height * photosMultiplier,
                child: ListView.separated(
                  itemCount: photos.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: index == 0 ? 25.0 : 0,
                          right: index == (photos.length - 1) ? 25.0 : 0),
                      child: Container(
                        child: index == 0 ? Icon(Icons.add) : Container(),
                        //put item image here
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(index == 0 ? 12 : 15)),
                          color: Colors.grey[300],
                        ),
                        height: MediaQuery.of(context).size.height *
                            photosMultiplier,
                        width: index == 0
                            ? (MediaQuery.of(context).size.height *
                                    photosMultiplier) /
                                2
                            : MediaQuery.of(context).size.height *
                                photosMultiplier,
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 10);
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Column(
                  children: <Widget>[
                    CustomFieldWidget(
                      fieldTitle: "Name",
                    ),
                    SizedBox(height: 10),
                    CustomFieldWidget(
                      fieldTitle: "Category",
                    ),
                    SizedBox(height: 10),
                    CustomFieldWidget(
                      fieldTitle: "SKU",
                    ),
                    SizedBox(height: 10),
                    CustomFieldWidget(
                      fieldTitle: "Location",
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomFieldWidget(
                            fieldTitle: "Price",
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: CustomFieldWidget(
                            fieldTitle: "Quantity",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomFieldWidget(
                            fieldTitle: "Price",
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: CustomFieldWidget(
                            fieldTitle: "Quantity",
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: CustomFieldWidget(
                            fieldTitle: "Weight",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Center(child: Text('Create Item')),
                        //put item image here
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Styles.custBlue,
                        ),
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width - 50,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
          child: Column(
            children: <Widget>[
              ModalTitleWidget(title: "Add Item"),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  SearchBarWidget(
                      searchQueryController: _searchQueryController),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ItemContainerWidget(
                      name: products[index].name ?? "Loading...",
                      sku: products[index].sku ?? ".......",
                      amount: products[index].amount ?? " ",
                    );
                  },
                  itemCount: products.length,
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 20.0);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
