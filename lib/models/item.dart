class Item {
  String type;
  String id;
  String imageId;
  ItemData data;

  Item({this.type, this.id, this.imageId, this.data});

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
      type: parsedJson['type'],
      id: parsedJson['id'],
      imageId: parsedJson['image_id'],
      data: ItemData.fromJson(parsedJson['item_data']),
    );
  }
}

class ItemData {
  String name;
  String categoryId;
  List<ItemVariation> variations;

  ItemData({this.name, this.categoryId, this.variations});

  factory ItemData.fromJson(Map<String, dynamic> parsedJson) {
    return ItemData(
        name: parsedJson['name'],
        categoryId: parsedJson['category_id'],
        variations: parsedJson['variations'] != null
            ? List<ItemVariation>.from(
                parsedJson["variations"].map((x) => ItemVariation.fromJson(x)))
            : List<ItemVariation>());
  }
}

class ItemVariation {
  String type;
  String id;
  List<String> locationsPresent;
  String imageId;
  ItemVariationData data;

  ItemVariation(
      {this.type, this.locationsPresent, this.id, this.imageId, this.data});

  factory ItemVariation.fromJson(Map<String, dynamic> parsedJson) {
    List<String> locList = [];
    if (parsedJson['present_at_location_ids'] != null) {
      var locationsList = parsedJson['present_at_location_ids'];
      locList = locationsList.cast<String>();
    }

    return ItemVariation(
      type: parsedJson['type'],
      id: parsedJson['id'],
      locationsPresent: locList,
      imageId: parsedJson['image_id'],
      data: ItemVariationData.fromJson(parsedJson['item_variation_data']),
    );
  }
}

class ItemVariationData {
  final String itemId;
  final String name;
  final String sku;
  final Price price;

  ItemVariationData({this.itemId, this.sku, this.price, this.name});

  factory ItemVariationData.fromJson(Map<String, dynamic> parsedJson) {
    return ItemVariationData(
      itemId: parsedJson['item_id'],
      name: parsedJson['name'],
      sku: parsedJson['sku'],
      price: Price.fromJson(parsedJson['price_money']),
    );
  }
}

class Price {
  final int amount;
  final String currency;

  Price({this.currency, this.amount});

  factory Price.fromJson(Map<String, dynamic> parsedJson) {
    return Price(
      amount: parsedJson['amount'],
      currency: parsedJson['currency'],
    );
  }
}
