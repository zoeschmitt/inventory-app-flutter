import 'package:flutter/material.dart';
import 'package:inventory/models/category_model.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/services/image_service.dart';
import 'package:inventory/services/product_service.dart';

class InventoryModel with ChangeNotifier {
  Locations _location = Locations(name: "All", id: "0");
  Locations _newlocation = Locations(name: "All", id: "0");
  Category _category = Category(name: "All", id: "0");
  List<Category> _cats;
  List<Locations> _locations;
  List<Locations> _newlocations;
  List<Item> _products;
  ProductService _service = ProductService();
  ImageService _imageService = ImageService();
  String _search = "  ";
  List<ItemLocationCount> _currentItemLocs = [];
  bool _isLoading = false;

  List<ItemLocationCount> get currentLocs => _currentItemLocs;
  List<Item> get products => _products;
  List<Category> get categories => _cats;
  List<Locations> get locationList => _locations;
  List<Locations> get newlocationList => _newlocations;
  Locations get location => _location;
  Locations get newLocation => _newlocation;
  Category get category => _category;
  String get search => _search;
  bool get loading => _isLoading;

  set locationSet(Locations loc) => _location = loc;
  set newLocationSet(Locations loc) {
    _newlocation = loc;
    notifyListeners();
  }

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
        _newlocation = value[0];
        _newlocations = value;
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
    _isLoading = true;
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
      _isLoading = false;
      notifyListeners();
    }, onError: (error) {
      print(error);
    });
  }

  Future<bool> changeInv(String catId, String quantity, String locId, bool add) async {
    bool result = false;
    print("change inv service");
    _isLoading = true;
    _service.updateInventory(catId, quantity, locId, add).then((value) {
      result = value;
      _isLoading = false;
      notifyListeners();
    }, onError: (error) {
      print(error);
    });

    return result;
  }

  Future<String> getCOA(String id) async {
    String coaUrl = "";
    _service.getCOAId(id).then((value) {
      if (value != null) {
        coaUrl = value;
        print("in model coa: " + coaUrl);
      }
      //notifyListeners();
    }, onError: (error) {
      print(error);
    });
    return coaUrl;
  }

  Future<List<String>> getImageIds(String id) async {
    List<String> ids = [];
    _imageService.getImageIds(id).then((value) {
      if (value != null) {
        ids = value;
        if (ids.isNotEmpty) {
          print("in model img: " + ids[0]);
        }
      }
      //notifyListeners();
    }, onError: (error) {
      print(error);
    });
    return ids;
  }

  Future<bool> updateProd(Item item) async {
    bool result = false;
    print("change inv service");
    _isLoading = true;
    _service.updateProduct(item).then((value) {
      result = value;
      _isLoading = false;
      notifyListeners();
    }, onError: (error) {
      print(error);
    });

    return result;
  }
}
