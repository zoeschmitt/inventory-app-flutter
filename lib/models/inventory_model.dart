import 'package:flutter/material.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/services/product_service.dart';

class InventoryModel with ChangeNotifier {
  String _location = "All";
  String _category = " ";
  List<Item> _products;
  ProductService service = ProductService();

  List<Item> get products => _products;
  String get location => _location;
  String get category => _category;

  InventoryModel() {
    productService();
  }

  void productService() {
    print("productService");
    service.fetchProducts().then((value) {
      _products = value;
      notifyListeners();
    }, onError: (error) {
      print(error);
    });
  }

   void searchService(String prod) {
     print("searchService");
    service.searchProducts(prod).then((value) {
      _products = value;
      notifyListeners();
    }, onError: (error) {
      print(error);
    });
  }

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
