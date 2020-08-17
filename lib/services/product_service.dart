import 'dart:convert';
import 'package:http/http.dart';
import 'package:inventory/models/category_model.dart';
import 'package:inventory/models/item.dart';

class ProductService {
  static const PROD_POST_URL =
      "https://alamoapp.azurewebsites.net/api/SearchProduct";
  static const LOCATION_GET_URL =
      "https://alamoapp.azurewebsites.net/api/GetAllLocation";
  static const CATEGORY_GET_URL =
      "https://alamoapp.azurewebsites.net/api/GetAllCategory";
  static const ADD_INV_URL =
      "https://alamoapp.azurewebsites.net/api/AddInventory";
  static const GET_INV_URL = "alamoapp-devalamoapp.azurewebsites.net";

  Future<List<Item>> fetchProducts(String limit, String searchProd) async {
    List<Item> prods = [];
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "*/*",
    };
    final body1 = jsonEncode({"searchObject": searchProd, "limit": limit});
    Response response =
        await post(PROD_POST_URL, headers: headers, body: body1); //int
    //print('Response body: ${response.body}'); // json
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['objects'] != null) {
        var prod = jsonDecode(response.body)['objects'] as List;
        prods = prod.map((i) => Item.fromJson(i)).toList();
      }

      print("prodycts gotten");
      print(prods.length);
    } else {
      print('Response status: ${response.statusCode}');
    }

    return prods;
  }

  Future<List<Category>> getCategories() async {
    List<Category> cats = [];
    var response = await get(
      CATEGORY_GET_URL,
    );
    print("category service internal");
    if (response.statusCode == 200) {
      var cat = jsonDecode(response.body)['cosmos'] as List;
      cats = cat.map((i) => Category.fromJson(i)).toList();
      //cats = cat.map<Category>((m) => m['name'] as Category).toList();
      cats.insert(0, Category(name: "All", id: "0"));
      print("cats done");
    } else {
      print('Response status: ${response.statusCode}');
    }

    return cats;
  }

  Future<List<Locations>> getLocations() async {
    List<Locations> locs = [];
    var response = await get(
      LOCATION_GET_URL,
    );

    if (response.statusCode == 200) {
      var loc = jsonDecode(response.body)['cosmos'] as List;
      locs = loc.map((i) => Locations.fromJson(i)).toList();
      locs.insert(0, Locations(name: "All", id: "0"));
      print("locs done");
    } else {
      print('Response status: ${response.statusCode}');
    }

    return locs;
  }

  Future<List<ItemLocationCount>> getLocationQuantities(String id) async {
    List<ItemLocationCount> locQ = [];
  print(id);
    final uri = new Uri.https(
        GET_INV_URL, '/api/GetInventoryCount', {"catalog_object_ids": id});
    Response response = await get(uri);

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['counts'] != null) {
        var loc = jsonDecode(response.body)['counts'] as List;
        locQ = loc.map((i) => ItemLocationCount.fromJson(i)).toList();
      }
      if (locQ.isNotEmpty) {
      print(locQ.length);
    }
      print("locQ done");
    } else {
      print('Response locq status: ${response.statusCode}');
    }

    return locQ;
  }
}
