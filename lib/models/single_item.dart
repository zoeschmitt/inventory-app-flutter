class SingleItem {
  String id;
  String ingredients;
  String tags;
  int dosagesValue;
  String bottleSize;
  String color;
  String dogSize;
  String dosage;
  String flavor;
  String scent;
  String size;
  int version;
  bool presentAllLocations;
  List<String> presentAtLocationsIds;
  List<String> absentAtLocationsIds;
  String imageId;
  SingleItemData itemData;
  String vendorId;
  String type;
  String partitionKey;

  SingleItem(
      {this.id,
      this.ingredients,
      this.tags,
      this.dosagesValue,
      this.bottleSize,
      this.color,
      this.dogSize,
      this.dosage,
      this.flavor,
      this.scent,
      this.size,
      this.version,
      this.presentAllLocations,
      this.presentAtLocationsIds,
      this.absentAtLocationsIds,
      this.imageId,
      this.itemData,
      this.vendorId,
      this.type,
      this.partitionKey});

  factory SingleItem.fromJson(Map<String, dynamic> parsedJson) {
    List<String> locList = [];
    List<String> absentLocList = [];

    if (parsedJson['present_at_location_ids'] != null) {
      var locationsList = parsedJson['present_at_location_ids'];
      locList = locationsList.cast<String>();
    }

    if (parsedJson['absent_at_location_ids'] != null) {
      var locationsList = parsedJson['absent_at_location_ids'];
      absentLocList = locationsList.cast<String>();
    }

    return SingleItem(
      id: parsedJson['id'],
      ingredients: parsedJson['ingredients'],
      tags: parsedJson['tags'],
      dosagesValue: parsedJson['dosagesValue'],
      bottleSize: parsedJson['bottleSize'],
      color: parsedJson['color'],
      dogSize: parsedJson['dogSize'],
      dosage: parsedJson['dosage'],
      flavor: parsedJson['flavor'],
      scent: parsedJson['scent'],
      size: parsedJson['size'],
      version: parsedJson['version'],
      presentAllLocations: parsedJson['present_at_all_locations'] != null ? parsedJson['present_at_all_locations'] : false,
      presentAtLocationsIds: locList,
      absentAtLocationsIds: absentLocList,
      imageId: parsedJson['image_id'],
      itemData: parsedJson['item_data'] != null
          ? SingleItemData.fromJson(parsedJson['item_data'])
          : null,
      vendorId: parsedJson['vendorId'],
      type: parsedJson['type'],
      partitionKey: parsedJson['partitionKey'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        '_rid': 'Cj9uAMJHx+0yAQAAAAAAAA==',
        '_self':
            'dbs/Cj9uAA==/colls/Cj9uAMJHx+0=/docs/Cj9uAMJHx+0yAQAAAAAAAA==/',
        "_ts": DateTime.now().millisecondsSinceEpoch ~/
            Duration.millisecondsPerSecond,
        "_etag": "\"aa007a3a-0000-0700-0000-5f5c29550000\"",
        "ingredients": ingredients,
        "tags": tags,
        "dosagesValue": dosagesValue,
        "bottleSize": bottleSize,
        "color": color,
        "dogSize": dogSize,
        "dosage": dosage,
        "flavor": flavor,
        "scent": scent,
        "size": size,
        "updated_at": DateTime.now().toUtc().toIso8601String(),
        "version": version,
        "present_at_all_locations": presentAllLocations,
        "present_at_location_ids": presentAtLocationsIds,
        "absent_at_location_ids": absentAtLocationsIds,
        'image_id': imageId,
        'item_data': itemData,
        'vendorId': vendorId,
        'type': type,
        'partitionKey': partitionKey,
      };
}

class SingleItemData {
  String name;
  String description;
  String abbreviation;
  String labelColor;
  bool availableOnline;
  bool availableForPickup;
  String categoryId;
  List<String> taxIds;
  List<SingleItemVariationData> variations;

  SingleItemData(
      {this.name,
      this.description,
      this.abbreviation,
      this.labelColor,
      this.availableOnline,
      this.availableForPickup,
      this.categoryId,
      this.taxIds,
      this.variations});

  factory SingleItemData.fromJson(Map<String, dynamic> parsedJson) {
    List<String> tax = [];

    if (parsedJson['tax_ids'] != null) {
      var taxList = parsedJson['tax_ids'];
      tax = taxList.cast<String>();
    }

    return SingleItemData(
        name: parsedJson['name'],
        description: parsedJson['description'],
        abbreviation: parsedJson['abbreviation'],
        labelColor: parsedJson['label_color'],
        availableOnline: parsedJson['available_online'] != null ? parsedJson['available_online'] : false,
        availableForPickup: parsedJson['available_for_pickup'] != null ? parsedJson['available_for_pickup'] : false,
        categoryId: parsedJson['category_id'],
        taxIds: tax,
        variations: parsedJson['variations'] != null
            ? List<SingleItemVariationData>.from(parsedJson["variations"]
                .map((x) => SingleItemVariationData.fromJson(x)))
            : List<SingleItemVariationData>());
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'abbreviation': abbreviation,
        'label_color': labelColor,
        'available_online': availableOnline,
        'available_for_pickup': availableForPickup,
        'category_id': categoryId,
        'tax_ids': taxIds,
        'variations': variations,
      };
}

class SingleItemVariationData {
  String id;
  String itemId;
  String name;
  int version;
  String sku;
  int ordinal;
  String imageId;
  String pricingType;
  Price priceMoney;
  List<String> presentAtLocationIds;
  bool trackInventory;
  String inventoryAlertType;
  int inventoryAlertT;

  SingleItemVariationData(
      {this.id,
      this.itemId,
      this.name,
      this.version,
      this.sku,
      this.ordinal,
      this.imageId,
      this.pricingType,
      this.priceMoney,
      this.presentAtLocationIds,
      this.trackInventory,
      this.inventoryAlertType,
      this.inventoryAlertT});

  factory SingleItemVariationData.fromJson(Map<String, dynamic> parsedJson) {
    List<String> locList = [];

    if (parsedJson['present_at_location_ids'] != null) {
      var locationsList = parsedJson['present_at_location_ids'];
      locList = locationsList.cast<String>();
    }

    return SingleItemVariationData(
      id: parsedJson['id'],
      itemId: parsedJson['item_id'],
      name: parsedJson['name'],
      version: parsedJson['version'],
      sku: parsedJson['sku'],
      ordinal: parsedJson['ordinal'],
      imageId: parsedJson['image_id'],
      pricingType: parsedJson['pricing_type'],
      priceMoney: parsedJson['price_money'] != null
          ? Price.fromJson(parsedJson['price_money'])
          : null,
      presentAtLocationIds: locList,
      trackInventory: parsedJson['track_inventory'] != null ? parsedJson['track_inventory'] : false,
      inventoryAlertType: parsedJson['inventory_alert_type'],
      inventoryAlertT: parsedJson['inventory_alert_threshold'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'item_id': itemId,
        'updated_at': DateTime.now().toUtc().toIso8601String(),
        'name': name,
        'version': version,
        'sku': sku,
        'ordinal': ordinal,
        'image_id': imageId,
        'pricing_type': pricingType,
        'price_money': priceMoney,
        'present_at_location_ids': presentAtLocationIds,
        'track_inventory': trackInventory,
        'inventory_alert_type': inventoryAlertType,
        'inventory_alert_threshold': inventoryAlertT,
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
