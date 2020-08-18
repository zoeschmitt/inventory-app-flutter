import 'dart:convert';
import 'package:http/http.dart';

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


}