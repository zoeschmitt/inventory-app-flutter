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

  Map<String, dynamic> toJson() =>
  {
    'id': id,
    'image_id': imageId,
    'item_data': data,
  }; 
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

  Map<String, dynamic> toJson() =>
  {
    'name': name,
    'category_id': categoryId,
    'variations': variations,
  }; 
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

  Map<String, dynamic> toJson() =>
  {
    //'type': type,
    'id': id,
    'image_id': imageId,
    'name': data.name,
    'pricing_type': data.priceType,
    'price': data.price
  }; 
}

class ItemVariationData {
  String itemId;
  String name;
  String sku;
  String priceType;
  Price price;

  ItemVariationData({this.itemId, this.sku, this.priceType, this.price, this.name});

  factory ItemVariationData.fromJson(Map<String, dynamic> parsedJson) {
    return ItemVariationData(
      itemId: parsedJson['item_id'],
      name: parsedJson['name'],
      sku: parsedJson['sku'],
      priceType: parsedJson['pricing_type'],
      price: Price.fromJson(parsedJson['price_money']),
    );
  }

  Map<String, dynamic> toJson() =>
  {
    'item_id': itemId,
    'name': name,
    'sku': sku,
    'pricing_type': priceType,
    'price_money': price,
  }; 
}

class Price {
  int amount;
  String currency;

  Price({this.currency, this.amount});

  factory Price.fromJson(Map<String, dynamic> parsedJson) {
    return Price(
      amount: parsedJson['amount'],
      currency: parsedJson['currency'],
    );
  }
    Map<String, dynamic> toJson() =>
  {
    'amount': amount,
    'currency': currency,
  }; 
}
