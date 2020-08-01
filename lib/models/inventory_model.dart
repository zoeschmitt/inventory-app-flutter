import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:inventory/models/item.dart';

import 'package:inventory/models/list_item.dart';

class InventoryModel with ChangeNotifier{
  String _location = "All";
  String _category = " ";
  List<ListItem> _itemsList = [ListItem(id: "913324973", name: "Lorem Ipsum", sku: "238472394", amount: "227"),
  ListItem(id: "913324973", name: "Lorem Ipsum", sku: "238472394", amount: "227"),
  ListItem(id: "913324973", name: "Lorem Ipsum", sku: "238472394", amount: "227"),
  ListItem(id: "913324973", name: "Lorem Ipsum", sku: "238472394", amount: "227"),
  ListItem(id: "913324973", name: "Lorem Ipsum", sku: "238472394", amount: "227"),
  ListItem(id: "913324973", name: "Lorem Ipsum", sku: "238472394", amount: "227"),
  ListItem(id: "913324973", name: "Lorem Ipsum", sku: "238472394", amount: "227"),
  ];


UnmodifiableListView<ListItem> get allTasks => UnmodifiableListView(_itemsList);
String get location => _location;
String get category => _category;

  void filterLocation(String location) {
    _location = location;
    //await new list
    notifyListeners();
  }

  void filterCat(String category) {
    _category = category;
    //await new list
    notifyListeners();
  }

  void addItem(Item item) {
    
    //await new list
    notifyListeners();
  }

  void deleteItem(String id) {
    
    //await new list
    notifyListeners();
  }

  // void addItem(Item task) {
  //   _itemsList.add(task);
  //   notifyListeners();
  // }

  // void toggleTodo(Task task) {
  //   final taskIndex = _tasks.indexOf(task);
  //   _tasks[taskIndex].toggleCompleted();
  //   notifyListeners();
  // }

  // void deleteTodo(Task task) {
  //   _tasks.remove(task);
  //   notifyListeners();
  // }
  
}
