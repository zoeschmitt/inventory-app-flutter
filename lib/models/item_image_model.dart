class ItemImage {

  String id;
  String name;

  ItemImage({this.id, this.name});

  factory ItemImage.fromJson(Map<String, dynamic> parsedJson) {
    return ItemImage(
      id: parsedJson['imageId'],
      name: parsedJson['name'],
    );
  }

  Map<String, dynamic> toJson() =>
  {
    'imageId': id,
    'name': name
  }; 
}