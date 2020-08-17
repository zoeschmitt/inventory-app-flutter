import 'package:flutter/material.dart';
import 'package:inventory/models/category_model.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/services/product_service.dart';

class InventoryModel with ChangeNotifier {
  Locations _location = Locations(name: "All", id: "0");
  Category _category = Category(name: "All", id: "0");
  List<Category> _cats;
  List<Locations> _locations;
  List<Item> _products;
  ProductService _service = ProductService();
  String _search = "  ";
  List<ItemLocationCount> _currentItemLocs = [];

  List<ItemLocationCount> get currentLocs => _currentItemLocs;
  List<Item> get products => _products;
  List<Category> get categories => _cats;
  List<Locations> get locationList => _locations;
  Locations get location => _location;
  Category get category => _category;
  String get search => _search;

  set locationSet(Locations loc) => _location = loc;
  set catSet(Category cat) => _category = cat;
  set currentLocationsSet(List<ItemLocationCount> locs) =>
      _currentItemLocs = locs;

  InventoryModel() {
    productService("20");
    getCats();
    getLocations();
  }


  void searchProds(String prod) {
    print(prod);
    if (prod.isEmpty) {
      _search = "  ";
    } else if (prod.length < 2) {
      _search = prod + " ";
    } else {
      _search = prod;
    }

    productService("20");
  }

  void productService(String limit) {
    print("productService");
    print(_search);
    _service.fetchProducts(limit, _search).then((value) {
      if (value.isNotEmpty) {
        print(value[0].id);
      }

      if (location.name != "All" || category.name != "All") {
        print("filtering");

        if (location.name != "All" && category.name == "All") {
          print("filtering by loc");
          _products = _filterByLocation(value);
        } else if (location.name == "All" && category.name != "All") {
          _products = _filterByCat(value);
          print("filtered by cat");
        } else {
          _products = _filterByLocation(_filterByCat(value));
          print("filtered both");
        }
      } else {
        _products = value;
      }

      notifyListeners();
    }, onError: (error) {
      print(error);
    });
  }

  List<Item> _filterByLocation(List<Item> prods) {
    List<Item> pl = [];
    for (final p in prods) {
      if (p.data.variations != null) {
        p.data.variations.forEach((element) {
          pl = prods
              .where((prod) => element.locationsPresent.contains(location.id))
              .toList();
        });
      }
    }
    return pl;
  }

  List<Item> _filterByCat(List<Item> prods) {
    List<Item> pl = [];

    pl = prods
        .where((prod) => prod.data.categoryId.contains(category.id))
        .toList();

    return pl;
  }

  void getCats() {
    print("category service");
    _service.getCategories().then((value) {
      if (value.isNotEmpty) {
        _category = value[0];
        _cats = value;
      }

      notifyListeners();
    }, onError: (error) {
      print(error);
    });
  }

  void getLocations() {
    print("locations service");
    _service.getLocations().then((value) {
      if (value.isNotEmpty) {
        _location = value[0];
        _locations = value;
      }

      notifyListeners();
    }, onError: (error) {
      print(error);
    });
  }

  String getItemCat(String id) {
    String itemCat = " ";
    if (_cats != null) {
      _cats.forEach((element) {
        if (element.id == id) {
          itemCat = element.name;
        }
      });
    }

    return itemCat;
  }

  void getItemImages(String id) {}

  void getItemLocations(String id) {
    print("location count service");
    _service.getLocationQuantities(id).then((value) {
      if (value.isNotEmpty) {
        _currentItemLocs = value;
        if (_locations != null) {
          _currentItemLocs.forEach((element1) {
            _locations.forEach((element) {
              if (element1.id == element.id) {
                element1.name = element.name;
              }
            });
          });
        }
      }
      notifyListeners();
    }, onError: (error) {
      print(error);
    });
  }

  Future<bool> changeInv(Item item) async {
    //await new list
    notifyListeners();
    return false;
  }

}
