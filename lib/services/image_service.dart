import 'dart:convert';
import 'package:http/http.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ImageService {
 static const BASE_URL = "alamoapp-devalamoapp.azurewebsites.net";
 static const IMG_BASE_URL = 'https://marketingstoreimages.blob.core.windows.net/productimages/';


  Future<List<String>> getImageIds(String id) async {
   List< String> ids = [];
   print("item id in image: " + id);

    final uri = new Uri.https(BASE_URL, '/api/getItemImage', {"id": id});
print(uri);
    Response response = await get(uri);

    if (response.statusCode == 200) {

      print("image response code" + response.statusCode.toString());

      if (jsonDecode(response.body) != null) {

        var images = jsonDecode(response.body)['itemImages'] as List;
        ids = images.map<String>((m) => m['imageId'] as String).toList();
    
      }

      if (ids.isNotEmpty) {
        print("ids after map" + ids[0]);
      }
      print("image ids done");

    } else {
      print('Response coaId status: ${response.statusCode}');
    }

    return ids;
  }

  Future<bool> deleteImage(String id, String imageId) async {
   bool status = false;
    final uri = new Uri.https(
        BASE_URL, '/api/DeleteImage', {"id": id, "imageName": imageId});
    Response response = await get(uri);

    if (response.statusCode == 200) {
      status = true;
      print("locQ done");
    } else {
      print('Response locq status: ${response.statusCode}');
    }

    return status;
  }

  Future<bool> addImage(String itemId, String searchProd, List<Asset> images) async {
   bool status = false;
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "*/*",
    };
    Map<String, dynamic> body = {
      "imageType": "productImage",
      "itemId": itemId,
    };
    for(final asset in images) {
      body.
    }

    final body1 = jsonEncode({"imageType": "productImage", "itemId": itemId});
    Response response =
        await post(BASE_URL, headers: headers, body: body1); //int
    //print('Response body: ${response.body}'); // json
    if (response.statusCode == 200) {
      status = true;
      print("prodycts gotten");
     
    } else {
      print('Response status: ${response.statusCode}');
    }

    return status;
  }

}