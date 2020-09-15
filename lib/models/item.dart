class Item {
  String type;
  String id;
  bool presentAtAllLocations;
  List<String> locationsPresent;
  String imageId;
  ItemData data;

  Item(
      {this.type,
      this.id,
      this.presentAtAllLocations,
      this.locationsPresent,
      this.imageId,
      this.data});

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    List<String> locList = [];

    if (parsedJson['present_at_location_ids'] != null) {
      var locationsList = parsedJson['present_at_location_ids'];
      locList = locationsList.cast<String>();
    }
    return Item(
      type: parsedJson['type'],
      id: parsedJson['id'],
      presentAtAllLocations: parsedJson['present_at_all_locations'] != null ? parsedJson['present_at_all_locations'] : false,
      locationsPresent: locList,
      imageId: parsedJson['image_id'],
      data: parsedJson['item_data'] != null
          ? ItemData.fromJson(parsedJson['item_data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'image_id': imageId,
        'item_data': data,
      };
}

class ItemData {
  String name;
  String description;
  String categoryId;
  List<ItemVariation> variations;

  ItemData({this.name, this.description, this.categoryId, this.variations});

  factory ItemData.fromJson(Map<String, dynamic> parsedJson) {
    return ItemData(
        name: parsedJson['name'],
        description: parsedJson['description'],
        categoryId: parsedJson['category_id'],
        variations: parsedJson['variations'] != null
            ? List<ItemVariation>.from(
                parsedJson["variations"].map((x) => ItemVariation.fromJson(x)))
            : List<ItemVariation>());
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'category_id': categoryId,
        'variations': variations,
      };
}

class ItemVariation {
  String type;
  String id;
  String imageId;
  ItemVariationData data;

  ItemVariation({this.type, this.id, this.imageId, this.data});

  factory ItemVariation.fromJson(Map<String, dynamic> parsedJson) {
    return ItemVariation(
      type: parsedJson['type'],
      id: parsedJson['id'],
      imageId: parsedJson['image_id'],
      data: parsedJson['item_variation_data'] != null
          ? ItemVariationData.fromJson(parsedJson['item_variation_data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        //'type': type,
        'id': id,
        'image_id': imageId,
        'name': data.name,
        'pricing_type': data.priceType,
        'price_money': data.price
      };
}

class ItemVariationData {
  String itemId;
  String name;
  String sku;
  String priceType;
  Price price;

  ItemVariationData(
      {this.itemId, this.sku, this.priceType, this.price, this.name});

  factory ItemVariationData.fromJson(Map<String, dynamic> parsedJson) {
    return ItemVariationData(
      itemId: parsedJson['item_id'],
      name: parsedJson['name'],
      sku: parsedJson['sku'],
      priceType: parsedJson['pricing_type'],
      price: parsedJson['price_money'] != null
          ? Price.fromJson(parsedJson['price_money'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
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
  Map<String, dynamic> toJson() => {
        'amount': amount,
        'currency': currency,
      };
}
