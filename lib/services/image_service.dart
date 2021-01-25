import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:inventory/models/item_image_model.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ImageService {
  static const BASE_URL = "api.unsplash.com";

  Future<List<String>> getImageIds() async {
    List<String> urls = [];
    final uri = new Uri.https(BASE_URL, '/search/photos', {"client_id": 'gA_t68Ck2CLPs0Vuaio2t4G1fxLrQWPtJtoU2Xy3P_8', "query": 'CBD'});
    //print(uri);
    Response response = await get(uri);

    if (response.statusCode == 200) {
      //print("image response code" + response.statusCode.toString());

      if (jsonDecode(response.body) != null) {
       
        var images = jsonDecode(response.body) as List;
        for (var image in images) {
          urls.add(image['regular']);
        }
        //imgs = images.map((i) => ItemImage.fromJson(i)).toList();
      }
    } else {
      print('Response get iamges status: ${response.statusCode}');
    }

    return urls;
  }

  Future<bool> deleteImage(String id, String imageName) async {
    // bool status = false;
    // final uri = new Uri.https(
    //     BASE_URL, '/api/DeleteImage', {"id": id, "imageName": imageName});

    // Response response = await get(uri);

    // if (response.statusCode == 200) {
    //   status = true;
    //   //print("delete image done");
    // } else {
    //   print('Response delete image status: ${response.statusCode}');
    //   print('Response dbodyelete image status: ${response.body}');
    // }

    // return status;
  }

  Future<bool> addImage(String itemId, Asset asset) async {
  //   bool status = false;
  //   ByteData byteData = await asset.getByteData();
  //   List<int> imageData = byteData.buffer.asUint8List();

  //   Uri uri = Uri.parse('https://alamoapp.azurewebsites.net/api/addImage');
  //   //print(itemId);

  //   MultipartRequest request = MultipartRequest("POST", uri);

  //   request.fields['imageType'] = 'productImage';
  //   request.fields['itemId'] = itemId;

  //   request.files.add(MultipartFile.fromBytes(
  //     'image',
  //     imageData,
  //     filename: asset.name + ".jpg",
  //     contentType: MediaType("image", "jpg"),
  //   ));
  // // print(request.fields);
  // // print(request.files[0].contentType);
  //   var response = await request.send();
  //   print(response.reasonPhrase);
  //   print(response);
  //   if (response.statusCode == 200) {
  //     status = true;
  //     //print("images added");
  //   } else {
  //     print('Add Image Response status: ${response.statusCode}');
  //   }

  //   return status;
  }
}
