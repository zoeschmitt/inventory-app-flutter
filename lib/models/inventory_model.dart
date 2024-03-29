import 'package:flutter/material.dart';
import 'package:inventory/models/category_model.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/models/single_item.dart';
import 'package:inventory/services/image_service.dart';
import 'package:inventory/services/product_service.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'item_image_model.dart';

class InventoryModel with ChangeNotifier {
  Locations _location =
      Locations(name: "All", id: "0"); //current filtered location - home page
  Category _category =
      Category(name: "All", id: "0"); //current filtered category - home page
  List<Category> _categories; //current list of categories - home page
  List<Locations> _locations; //current list of locations - home page
  List<Item> _products; //main list of products - home page
  ProductService _service = ProductService();
  ImageService _imageService = ImageService();
  String _search = "  "; //current search text - home page
  bool _isLoading = false;

  List<ItemLocationCount> _currentItemLocations =
      []; //list of locations for the add location - item page
  List<Locations>
      _allLocations; //current list of locations to add a new item to - item page
  Locations _newItemLocation = Locations(
      name: "All",
      id: "0"); //current filter to add item to new location - item page

  List<ItemLocationCount> get currentItemLocationList => _currentItemLocations;
  List<Item> get products => _products;
  List<Category> get categoryList => _categories;
  List<Locations> get locationList => _locations;
  List<Locations> get allLocationsList => _allLocations;
  Locations get location => _location;
  Category get category => _category;
  Locations get newLocation => _newItemLocation;
  String get search => _search;
  bool get loading => _isLoading;

  set setLocation(Locations loc) {
    _location = loc;
    notifyListeners();
  }

  //set list category
  set setCategory(Category cat) {
    _category = cat;
    notifyListeners();
  }

  //set the location to add the item to
  set setNewItemLocation(Locations loc) {
    _newItemLocation = loc;
    notifyListeners();
  }

  //the locations where the current item is present
  set setCurrentItemLocations(List<ItemLocationCount> locs) =>
      _currentItemLocations = locs;

  InventoryModel() {
    // productService(limit: "20");
    // getCats();
    // getLocations();
    if (_products?.isEmpty ?? true) {
      productService(limit: "20");
    }
    if (_categories?.isEmpty ?? true) {
      getCats();
    }
    if (_locations?.isEmpty ?? true) {
      getLocations();
    }
  }

  void searchProds(String prod) {
    //print(prod);
    if (prod.isEmpty) {
      _search = "  ";
    } else if (prod.length < 2) {
      _search = prod + " ";
    } else {
      _search = prod;
    }

    productService(limit: "20");
  }

  void productService({String limit}) {
    // print("productService");
    // print(_search);
    _service.fetchProducts(_search, limit: limit != null ? limit : null).then(
        (value) {
      if (value.isNotEmpty) {
        print(value[0].id);
      }
      //print("service");
      if (location.name != "All" || category.name != "All") {
        //print("filtering");

        if (location.name != "All" && category.name == "All") {
          //print("filtering by loc");
          _products = _filterByLocation(value);
        } else if (location.name == "All" && category.name != "All") {
          _products = _filterByCat(value);
          // print(_products.length);
          // print("filtered by cat");
        } else {
          _products = _filterByLocation(_filterByCat(value));
          //print("filtered both");
        }
      } else {
        _products = value;
      }

      notifyListeners();
    }, onError: (error) {
      print(error);
    });
  }

  Future<SingleItem> getSingleItem(String id) async {
    SingleItem item;

    await _service.getSingleItem(id).then((value) {
      if (value != null) {
        item = value;
      }
    }, onError: (error) {
      print(error);
    });
    return item;
  }

  List<Item> _filterByLocation(List<Item> prods) {
    // print("filter by location");
    // print("filter by location" + location.id);
    List<Item> pl = [];

    prods.forEach((prod) {
      if (prod.presentAtAllLocations) {
        pl.add(prod);
      } else if (prod.locationsPresent.contains(location.id)) {
        pl.add(prod);
      }
    });
    
    return pl;
  }

  List<Item> _filterByCat(List<Item> prods) {
    //print("filter by category");
    List<Item> pl = [];
    prods.forEach((prod) {
      if (prod.data.categoryId != null && prod.data.categoryId == category.id) {
        pl.add(prod);
      }
    });
    return pl;
  }

  void getCats() {
    //print("category service");
    _service.getCategories().then((value) {
      if (value.isNotEmpty) {
        _category = value[0];
        _categories = value;
      }

      notifyListeners();
    }, onError: (error) {
      print(error);
    });
  }

  void getLocations() {
    //print("locations service");
    _service.getLocations().then((value) {
      if (value.isNotEmpty) {
        _location = value[0];
        _locations = value;
        _newItemLocation = value[0];
        _allLocations = value;
      }

      notifyListeners();
    }, onError: (error) {
      print("error getting locations: " + error);
    });
  }

  String getItemCat(String id) {
    String itemCat = " ";
    if (_categories != null) {
      _categories.forEach((element) {
        if (element.id == id) {
          itemCat = element.name;
        }
      });
    }

    return itemCat;
  }

  void getItemLocations(String id) {
    //print("location count service");
    _isLoading = true;
    _service.getLocationQuantities(id).then((value) {
      if (value.isNotEmpty) {
        _currentItemLocations = value;
        if (_locations != null) {
          _currentItemLocations.forEach((element1) {
            _locations.forEach((element) {
              if (element1.id == element.id) {
                // print(element.id);
                // print(element.name);
                element1.name = element.name;
              }
            });
          });
        }
      }
      _isLoading = false;
      notifyListeners();
    }, onError: (error) {
      _isLoading = false;
      print(error);
    });
  }

  Future<bool> changeInv(
      String itemId, String quantity, String locId, bool add) async {
    bool result = false;
    //print("change inv service");
    _isLoading = true;
    _service.updateInventory(itemId, quantity, locId, add).then((value) {
      result = value;
      _isLoading = false;
      getItemLocations(itemId);
      // notifyListeners();
    }, onError: (error) {
      print(error);
    });

    return result;
  }

  Future<String> getCOA(String id) async {
    String coaUrl;
    await _service.getCOAId(id).then((value) {
      if (value != null && (value?.isNotEmpty ?? false)) {
        coaUrl = value;
        print("in model coa: " + coaUrl);
      }
      //notifyListeners();
    }, onError: (error) {
      print(error);
    });
    return coaUrl;
  }

  Future<List<ItemImage>> getImageIds(String id) async {
    List<ItemImage> ids = [];
    await _imageService.getImageIds(id).then((value) {
      if (value != null) {
        ids = value;
      }
      //notifyListeners();
    }, onError: (error) {
      print(error);
    });
    return ids;
  }

  Future<bool> updateProd(SingleItem item) async {
    bool result = false;
    //print("change inv service");
    _isLoading = true;
    await _service.updateProduct(item).then((value) {
      result = value;
      _isLoading = false;
      notifyListeners();
    }, onError: (error) {
      print(error);
    });

    return result;
  }

  Future<bool> deleteImage(String itemId, String imageName) async {
    bool result = false;
    //print("delete img service");
    _isLoading = true;
    await _imageService.deleteImage(itemId, imageName).then((value) {
      result = value;
      _isLoading = false;
      notifyListeners();
    }, onError: (error) {
      print(error);
    });

    return result;
  }

  Future<bool> addImage(String itemId, Asset asset) async {
    bool result = false;
    //print("add img service");
    _isLoading = true;
    await _imageService.addImage(itemId, asset).then((value) {
      result = value;
      _isLoading = false;
      notifyListeners();
    }, onError: (error) {
      print(error);
    });

    return result;
  }
}
