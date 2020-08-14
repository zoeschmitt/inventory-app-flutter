class AllProducts {
  List<Item> items;

  AllProducts({this.items});

  factory AllProducts.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['data'] as List;
    List<Item> items = list.map((i) => Item.fromJson(i)).toList();
    return AllProducts(items: items);
  }
}

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
  final String name;
  final List<ItemVariation> variations;

  ItemData({this.name, this.variations});

  factory ItemData.fromJson(Map<String, dynamic> parsedJson) {
    return ItemData(
        name: parsedJson['name'],
        variations: parsedJson['variations'] != null
            ? List<ItemVariation>.from(
                parsedJson["variations"].map((x) => ItemVariation.fromJson(x)))
            : List<ItemVariation>());
  }
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
      data: ItemVariationData.fromJson(parsedJson['item_variation_data']),
    );
  }
}

class ItemVariationData {
  final String name;

  ItemVariationData({this.name});

  factory ItemVariationData.fromJson(Map<String, dynamic> parsedJson) {
    return ItemVariationData(
      name: parsedJson['name'],
    );
  }
}

class Price {
  final String amount;
  final String currency;

  Price({this.currency, this.amount});

  factory Price.fromJson(Map<String, dynamic> parsedJson) {
    return Price(
      amount: parsedJson['amount'],
      currency: parsedJson['currency'],
    );
  }
}
