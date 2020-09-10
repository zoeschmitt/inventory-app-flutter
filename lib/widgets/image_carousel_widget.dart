import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/models/item_image_model.dart';
import 'package:inventory/utils/styles.dart';
import 'package:provider/provider.dart';

class ImageCarouselWidget extends StatefulWidget {
  final String id;

  const ImageCarouselWidget({Key key, this.id}) : super(key: key);
  @override
  _ImageCarouselWidgetState createState() => _ImageCarouselWidgetState();
}

class _ImageCarouselWidgetState extends State<ImageCarouselWidget> {
  int _current = 0;
  List<ItemImage> _imageIds = [];
  bool _isLoading = false;
  static const IMG_BASE_URL = 'https://alamo-botanicals-shop.imgix.net/';

  @override
  void initState() {
    loadImages();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadImages() async {
    final model1 = Provider.of<InventoryModel>(context, listen: false);
    try {
      setState(() {
        _isLoading = true;
      });
      var image = await model1.getImageIds(widget.id);
      setState(() {
        _imageIds = image;
      });
      print("iamges length " + _imageIds.length.toString());
    } catch (e) {
      print(e.toString());
    }
    setState(() {
      if (mounted) {
        _isLoading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider.builder(
          options: CarouselOptions(
            enlargeCenterPage: true,
            height: MediaQuery.of(context).size.height / 5.3,
            enableInfiniteScroll: false,
            viewportFraction: 0.6,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          itemCount: _imageIds.length > 1 ? _imageIds.length : 1,
          itemBuilder: (context, index) {
            return (_imageIds != null && _imageIds.length >= 1)
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
        fit: BoxFit.cover, image: NetworkImage(IMG_BASE_URL + _imageIds[index].name)),
                      color: Styles.backgroundCol,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  )
                : Container(
                    child: _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : Center(
                            child: Text(
                              "No Images",
                              style: GoogleFonts.libreFranklin(
                                  fontSize: 16,
                                  color: Colors.black26,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                    width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                      color: Styles.backgroundCol,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  );
          },
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //children: [1, 2, 3, 4, 5].map((url) {
          children: _imageIds.map((url) {
            // int index = [1, 2, 3, 4, 5].indexOf(url);
            int index = _imageIds.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(3)),
                color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.5)
                    : Color.fromRGBO(0, 0, 0, 0.2),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
