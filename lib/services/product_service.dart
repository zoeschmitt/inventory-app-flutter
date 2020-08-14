import 'dart:convert';
import 'package:http/http.dart';

import 'package:inventory/models/item.dart';

class ProductService {
  static const PROD_POST_URL =
      "https://alamoapp.azurewebsites.net/api/SearchProduct";

  static const SEARCH_POST_URL =
      "https://alamoapp.azurewebsites.net/api/SearchAllProducts";

  Future<List<Item>> fetchProducts() async {
    List<Item> prods = [];
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "*/*",
    };
    Response response =
        await post(PROD_POST_URL, headers: headers, body: '{}'); //int
    //print('Response body: ${response.body}'); // json
    if (response.statusCode == 200) {
      var prod = jsonDecode(response.body)['objects'] as List;
      prods = prod.map((i) => Item.fromJson(i)).toList();
      print("prodycts gotten");
    } else {
      print('Response status: ${response.statusCode}');
    }

    return prods;
  }

  Future<List<Item>> searchProducts(String prod) async {
    List<Item> prods = [];
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "*/*",
    };
    final body1 = jsonEncode({"searchObject": prod});
    Response response =
        await post(SEARCH_POST_URL, headers: headers, body: body1); //int
    print('Response body: ${response.body}'); // json
    if (response.statusCode == 200) {
      // var prod = jsonDecode(response.body) as List<Item>;  
      // prods = prod.map((i) => Item.fromJson(i)).toList();
      print(jsonDecode(response.body));
      //prods = jsonDecode(response.body) as List<Item>;
      print("search done");
    } else {
      print('Response status: ${response.statusCode}');
    }

    return prods;
  }
}
