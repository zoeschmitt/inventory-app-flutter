import 'dart:convert';
import 'package:http/http.dart';
import 'package:inventory/models/category_model.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/models/single_item.dart';

class ProductService {
  static const PROD_POST_URL =
      "https://alamoapp.azurewebsites.net/api/SearchProduct";
  static const LOCATION_GET_URL =
      "https://alamoapp.azurewebsites.net/api/GetAllLocation";
  static const CATEGORY_GET_URL =
      "https://alamoapp.azurewebsites.net/api/GetAllCategory";
  static const ADD_INV_URL =
      "https://alamoapp.azurewebsites.net/api/AddInventory";
  static const BASE_URL = "alamoapp.azurewebsites.net";

  static const UPDATE_URL =
      'https://alamoapp.azurewebsites.net/api/AddUpdateItem';

  Future<List<Item>> fetchProducts(String searchProd, {String limit}) async {
    List<Item> prods = [];
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "*/*",
    };

    final body1 = limit == null
        ? jsonEncode({"searchObject": searchProd})
        : jsonEncode({"searchObject": searchProd, "limit": limit});

    Response response =
        await post(PROD_POST_URL, headers: headers, body: body1); //int
    //print('Response body: ${response.body}'); // json
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['objects'] != null) {
        //print("json decode");
        var prod = jsonDecode(response.body)['objects'] as List;
        //print("json decode list");
        prods = prod.map((i) => Item.fromJson(i)).toList();
        //print("json decode after");
      }

      // print("prodycts gotten");
      // print(prods.length);
    } else {
      print('Response status: ${response.statusCode}');
    }

    return prods;
  }

    Future<SingleItem> getSingleItem(String id) async {
    SingleItem item;

    final uri = new Uri.https(BASE_URL, '/api/GetSingleItem', {"id": id});

    Response response = await get(uri);

    //print("single item");

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body)['cosmos'];
      //print(response.body);
      item = SingleItem.fromJson(json);     
      //print("single item done");
    } else {
      print('Response status: ${response.statusCode}');
    }

    return item;
  }

  Future<List<Category>> getCategories() async {
    List<Category> cats = [];
    var response = await get(
      CATEGORY_GET_URL,
    );
    //print("category service internal");
    if (response.statusCode == 200) {
      var cat = jsonDecode(response.body)['cosmos'] as List;
      cats = cat.map((i) => Category.fromJson(i)).toList();
      cats.insert(0, Category(name: "All", id: "0"));
      //print("cats done");
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
      //print("locs done");
    } else {
      print('Response status: ${response.statusCode}');
    }

    return locs;
  }

  Future<List<ItemLocationCount>> getLocationQuantities(String id) async {
    List<ItemLocationCount> locQ = [];
    //print(id);
    final uri = new Uri.https(
        BASE_URL, '/api/GetInventoryCount', {"catalog_object_ids": id});
    Response response = await get(uri);

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['counts'] != null) {
        var loc = jsonDecode(response.body)['counts'] as List;
        locQ = loc.map((i) => ItemLocationCount.fromJson(i)).toList();
      }
 
      //print("locQ done");
    } else {
      print('Response locq status: ${response.statusCode}');
    }

    return locQ;
  }

  Future<String> getCOAId(String id) async {
    String coaUri;
    //print("coaId" + id);

    final uri = new Uri.https(BASE_URL, '/api/GetBlobsByProductId', {"productid": id});

    Response response = await get(uri);
    //print(response.body);
    if (response.statusCode == 200) {

      if (jsonDecode(response.body) != null) {

        var json = jsonDecode(response.body);
        if (json['data'] != null && (json['data']?.isNotEmpty ?? false)) {
          try {
            var coa = jsonDecode(response.body)['data'] as List;
            //print(coa);
            coaUri = coa.map<String>((e) => e['imageUri']).toString();
            coaUri = coaUri.substring(1, coaUri.length - 1);
            //print(coaUri);
          } catch (e) {
            print("could not get coa");
          }    
        }
      }
      //print("coaId done");
    } else {
      print('Response coaId status: ${response.statusCode}');
    }

    return coaUri;
  }

  Future<bool> updateInventory(
      String catId, String quantity, String locId, bool add) async {
    //print("add" + add.toString());
    bool result = false;
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "*/*",
    };
    final body1 = jsonEncode({
      "catalog_object_id": catId,
      "from_state": add ? "NONE" : "IN_STOCK",
      "quantity": quantity,
      "to_state": add ? "IN_STOCK" : "SOLD",
      "location_id": locId,
      "occurred_at": DateTime.now().toUtc().toIso8601String()
    });
    Response response =
        await post(ADD_INV_URL, headers: headers, body: body1); //int
    // print(catId);
    // print(quantity);
    // print(locId);
    if (response.statusCode == 200) {
      // print(response.statusCode);
      // print(response.body);
      result = true;
    } else {
      print('Response status: ${response.statusCode}');
    }

    return result;
  }

  Future<bool> updateProduct(SingleItem item) async {
    bool status = false;
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "*/*",
    };
    final body1 = jsonEncode(item);
    //print(body1);
    Response response =
        await post(UPDATE_URL, headers: headers, body: body1); //int
    
    Map<String, dynamic> resp = jsonDecode(response.body);
    //print(resp);
    if (response.statusCode == 200 && resp["errors"] == null) {
      //print("prodyct updated");
      status = true;
    } else {
      print('Response status: ${response.statusCode}');
    }

    return status;
  }
}
