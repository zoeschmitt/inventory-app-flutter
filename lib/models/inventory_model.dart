import 'package:flutter/material.dart';
import 'package:inventory/models/category_model.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/services/image_service.dart';
import 'package:inventory/services/product_service.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'item.dart';

class InventoryModel with ChangeNotifier {
  Locations _location =
      Locations(name: "All", id: "0"); //current filtered location - home page
  Category _category =
      Category(name: "All", id: "0"); //current filtered category - home page
  List<Category> _categories; //current list of categories - home page
  List<Locations> _locations; //current list of locations - home page
  List<Item> _products = [
    Item(
        data: ItemData(name: 'CBD Tincture', variations: [
      ItemVariation(
          data: ItemVariationData(
              name: 'CBD Tincture V1', price: Price(amount: 3500))),
    ])),
    Item(
        data: ItemData(name: 'CBD Tincture', variations: [
      ItemVariation(
          data: ItemVariationData(
              name: '250mg CBD Tincture 30ml', price: Price(amount: 6000))),
    ])),
    Item(
        data: ItemData(name: 'CBD Tincture', variations: [
      ItemVariation(
          data: ItemVariationData(
              name: 'NANO Enhancer by Infinite', price: Price(amount: 2000))),
    ])),
    Item(
        data: ItemData(name: 'CBD Capsules', variations: [
      ItemVariation(
          data: ItemVariationData(
              name: '50mg Hemp Extract Supplement', price: Price(amount: 6500))),
    ])),
    Item(
        data: ItemData(name: 'CBD Capsules', variations: [
      ItemVariation(
          data: ItemVariationData(
              name: 'P.M. Capsules', price: Price(amount: 3500))),
    ])),
    Item(
        data: ItemData(name: 'CBD Tincture', variations: [
      ItemVariation(
          data: ItemVariationData(
              name: 'NANO Enhancer', price: Price(amount: 2500))),
    ])),
    Item(
        data: ItemData(name: 'CBD Tincture', variations: [
      ItemVariation(
          data: ItemVariationData(
              name: '1500mg CBD Tincture 30ml', price: Price(amount: 3500))),
    ])),
    Item(
        data: ItemData(name: 'CBD Tincture', variations: [
      ItemVariation(
          data: ItemVariationData(
              name: 'CBD Tincture V1', price: Price(amount: 3500))),
    ])),
    Item(
        data: ItemData(name: 'CBD Tincture', variations: [
      ItemVariation(
          data: ItemVariationData(
              name: 'CBD Tincture V1', price: Price(amount: 3500))),
    ])),
    Item(
        data: ItemData(name: 'CBD Tincture', variations: [
      ItemVariation(
          data: ItemVariationData(
              name: 'CBD Tincture V1', price: Price(amount: 3500))),
    ])),
  ]; //main list of products - home page
  //ProductService _service = ProductService();
  ImageService _imageService = ImageService();
  String _search = "  "; //current search text - home page
  bool _isLoading = false;
  List<String> _images = ["https://images.unsplash.com/photo-1611253468024-df921701df4c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMDE0OTN8MHwxfHNlYXJjaHwxfHxDQkQlMjBvaWx8ZW58MHx8fA&ixlib=rb-1.2.1&q=80&w=1080",
  "https://images.unsplash.com/photo-1609195064049-3dbce38cd05b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMDE0OTN8MHwxfHNlYXJjaHwzfHxDQkQlMjBvaWx8ZW58MHx8fA&ixlib=rb-1.2.1&q=80&w=1080",
  "https://images.unsplash.com/photo-1551109428-9cbda6cf5914?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMDE0OTN8MHwxfHNlYXJjaHw2fHxDQkQlMjBvaWx8ZW58MHx8fA&ixlib=rb-1.2.1&q=80&w=1080",
  "https://images.unsplash.com/photo-1563483783225-fdcd3bf7fb68?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMDE0OTN8MHwxfHNlYXJjaHw5fHxDQkQlMjBvaWx8ZW58MHx8fA&ixlib=rb-1.2.1&q=80&w=1080",
  "https://images.unsplash.com/photo-1563483783066-9c82a0daaaf3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMDE0OTN8MHwxfHNlYXJjaHwxMHx8Q0JEJTIwb2lsfGVufDB8fHw&ixlib=rb-1.2.1&q=80&w=1080",
  "https://images.unsplash.com/photo-1572450896645-f732b89e9778?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMDE0OTN8MHwxfHNlYXJjaHwxfHxDYmQlMjB0aW5jdHVyZXxlbnwwfHx8&ixlib=rb-1.2.1&q=80&w=1080",
  "https://images.unsplash.com/photo-1571170318916-71e51e94ab51?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMDE0OTN8MHwxfHNlYXJjaHw3fHxDYmQlMjB0aW5jdHVyZXxlbnwwfHx8&ixlib=rb-1.2.1&q=80&w=1080",
  "https://images.unsplash.com/photo-1556928045-16f7f50be0f3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMDE0OTN8MHwxfHNlYXJjaHwxMHx8Q2JkJTIwdGluY3R1cmV8ZW58MHx8fA&ixlib=rb-1.2.1&q=80&w=1080",
  "https://images.unsplash.com/photo-1533038590840-1cde6e668a91?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max",
  "https://images.unsplash.com/photo-1556118846-8c9530f58ea3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMDE0OTN8MHwxfHNlYXJjaHwxfHxDYmQlMjBjYXBzdWxlfGVufDB8fHw&ixlib=rb-1.2.1&q=80&w=1080"
  ];
  List<ItemLocationCount> _currentItemLocations =
      []; //list of locations for the add location - item page
  List<Locations>
      _allLocations; //current list of locations to add a new item to - item page
  Locations _newItemLocation = Locations(
      name: "All",
      id: "0"); //current filter to add item to new location - item page

  List<ItemLocationCount> get currentItemLocationList => _currentItemLocations;
  List<Item> get products => _products;
  List<String> get images => _images;
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
    getImageIds();
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
    // _service.fetchProducts(_search, limit: limit != null ? limit : null).then(
    //     (value) {
    //   if (value.isNotEmpty) {
    //     print(value[0].id);
    //   }
    //   //print("service");
    //   if (location.name != "All" || category.name != "All") {
    //     //print("filtering");

    //     if (location.name != "All" && category.name == "All") {
    //       //print("filtering by loc");
    //       _products = _filterByLocation(value);
    //     } else if (location.name == "All" && category.name != "All") {
    //       _products = _filterByCat(value);
    //       // print(_products.length);
    //       // print("filtered by cat");
    //     } else {
    //       _products = _filterByLocation(_filterByCat(value));
    //       //print("filtered both");
    //     }
    //   } else {
    //     _products = value;
    //   }

    //   notifyListeners();
    // }, onError: (error) {
    //   print(error);
    // });
  }

  // Future<SingleItem> getSingleItem(String id) async {
  //   SingleItem item;

  // await _service.getSingleItem(id).then((value) {
  //   if (value != null) {
  //     item = value;
  //   }
  // }, onError: (error) {
  //   print(error);
  // });
  // return item;
  // }

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
    // _service.getCategories().then((value) {
    //   if (value.isNotEmpty) {
    //     _category = value[0];
    //     _categories = value;
    //   }

    //   notifyListeners();
    // }, onError: (error) {
    //   print(error);
    // });
  }

  void getLocations() {
    //print("locations service");
    // _service.getLocations().then((value) {
    //   if (value.isNotEmpty) {
    //     _location = value[0];
    //     _locations = value;
    //     _newItemLocation = value[0];
    //     _allLocations = value;
    //   }

    //   notifyListeners();
    // }, onError: (error) {
    //   print("error getting locations: " + error);
    // });
  }

  String getItemCat(String id) {
    // String itemCat = " ";
    // if (_categories != null) {
    //   _categories.forEach((element) {
    //     if (element.id == id) {
    //       itemCat = element.name;
    //     }
    //   });
    // }

    // return itemCat;
  }

  void getItemLocations(String id) {
    //print("location count service");
   // _isLoading = true;
    // _service.getLocationQuantities(id).then((value) {
    //   if (value.isNotEmpty) {
    //     _currentItemLocations = value;
    //     if (_locations != null) {
    //       _currentItemLocations.forEach((element1) {
    //         _locations.forEach((element) {
    //           if (element1.id == element.id) {
    //             // print(element.id);
    //             // print(element.name);
    //             element1.name = element.name;
    //           }
    //         });
    //       });
    //     }
    //   }
    //   _isLoading = false;
    //   notifyListeners();
    // }, onError: (error) {
    //   _isLoading = false;
    //   print(error);
    // });
  }

  Future<bool> changeInv(
      String itemId, String quantity, String locId, bool add) async {
    // bool result = false;
    // //print("change inv service");
    // _isLoading = true;
    // // _service.updateInventory(itemId, quantity, locId, add).then((value) {
    //   result = value;
    //   _isLoading = false;
    //   getItemLocations(itemId);
    //   // notifyListeners();
    // }, onError: (error) {
    //   print(error);
    // });

    //return result;
  }

  Future<String> getCOA(String id) async {
    String coaUrl;
    // await _service.getCOAId(id).then((value) {
    //   if (value != null && (value?.isNotEmpty ?? false)) {
    //     coaUrl = value;
    //     print("in model coa: " + coaUrl);
    //   }
    //   //notifyListeners();
    // }, onError: (error) {
    //   print(error);
    // });
    return coaUrl;
  }

  Future<void> getImageIds() async {
    // await _imageService.getImageIds().then((value) {
    //   if (value != null) {
    //     _images = value;
    //   }
    //   //notifyListeners();
    // }, onError: (error) {
    //   print(error);
    // });
  }

  // Future<bool> updateProd(SingleItem item) async {
  //   bool result = false;
  //   //print("change inv service");
  //   _isLoading = true;
  // await _service.updateProduct(item).then((value) {
  //   result = value;
  //   _isLoading = false;
  //   notifyListeners();
  // }, onError: (error) {
  //   print(error);
  // });

  //   return result;
  // }

  Future<bool> deleteImage(String itemId, String imageName) async {
    bool result = false;
    //print("delete img service");
   // _isLoading = true;
    // await _imageService.deleteImage(itemId, imageName).then((value) {
    //   result = value;
    //   _isLoading = false;
    //   notifyListeners();
    // }, onError: (error) {
    //   print(error);
    // });

    return result;
  }

  Future<bool> addImage(String itemId, Asset asset) async {
    bool result = false;
    //print("add img service");
   // _isLoading = true;
    // await _imageService.addImage(itemId, asset).then((value) {
    //   result = value;
    //   _isLoading = false;
    //   notifyListeners();
    // }, onError: (error) {
    //   print(error);
    // });

    return result;
  }
}
