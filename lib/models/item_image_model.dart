class ItemImage {

  String url;

  ItemImage({this.url});

  factory ItemImage.fromJson(Map<String, dynamic> parsedJson) {
    return ItemImage(
      url: parsedJson['regular'],
    );
  }
}
