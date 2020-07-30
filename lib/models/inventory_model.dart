import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:inventory/models/list_item.dart';

class InventoryModel with ChangeNotifier{
  String _location = " ";
  String _category = " ";
  List<ListItem> _itemsList;


UnmodifiableListView<ListItem> get allTasks => UnmodifiableListView(_itemsList);
String get location => _location;
String get category => _category;

  // UnmodifiableListView<Task> get incompleteTasks =>
  //     UnmodifiableListView(_tasks.where((todo) => !todo.completed));
  // UnmodifiableListView<Task> get completedTasks =>
  //     UnmodifiableListView(_tasks.where((todo) => todo.completed));

  void filterLocation(String location) {
    _location = location;
    notifyListeners();
  }

  void filterCat(String category) {
    _category = category;
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
