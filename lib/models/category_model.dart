class Category {
  String name;
  String id;

  Category({this.name, this.id});

  factory Category.fromJson(Map<String, dynamic> parsedJson) {
    return Category(
      name: parsedJson['name'],
      id: parsedJson['id'],
    );
  }
}

class Locations {
  String name;
  String id;

  Locations({this.name, this.id});

  factory Locations.fromJson(Map<String, dynamic> parsedJson) {
    return Locations(
      name: parsedJson['name'],
      id: parsedJson['id'],
    );
  }
}

class ItemLocationCount {
  String id;
  String amount;
  String name;

  ItemLocationCount({this.id, this.amount});

  factory ItemLocationCount.fromJson(Map<String, dynamic> parsedJson) {
    return ItemLocationCount(
      id: parsedJson['location_id'],
      amount: parsedJson['quantity'],
    );
  }
}
