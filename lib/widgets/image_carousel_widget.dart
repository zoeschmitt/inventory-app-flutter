import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:inventory/utils/styles.dart';

class ImageCarouselWidget extends StatefulWidget {
  final List<String> images;

  const ImageCarouselWidget({Key key, this.images}) : super(key: key);
  @override
  _ImageCarouselWidgetState createState() => _ImageCarouselWidgetState();
}

class _ImageCarouselWidgetState extends State<ImageCarouselWidget> {
  int _current = 0;
  static const IMG_BASE_URL =
      'https://marketingstoreimages.blob.core.windows.net/productimages/';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.images.forEach((imageUrl) {
        precacheImage(NetworkImage(IMG_BASE_URL + imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider.builder(
          options: CarouselOptions(
            enlargeCenterPage: true,
            height: 170.0,
            enableInfiniteScroll: true,
            viewportFraction: 0.6,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          // items: [1, 2, 3, 4, 5].map((i) {
          // items: widget.images.map((i) {
          //   return Builder(
          //     builder: (BuildContext context) {
          //       return (widget.images != null || widget.images.length > 1)
          //           ? Container(
          //               child: (Image.network(IMG_BASE_URL + "$i")),
          //               width: MediaQuery.of(context).size.width,
          //               //margin: EdgeInsets.symmetric(horizontal: 1.0),
          //               decoration: BoxDecoration(
          //                 color: Styles.backgroundCol,
          //                 borderRadius: BorderRadius.all(Radius.circular(15)),
          //               ),
          //               // child: Text(
          //               //   'text $i',
          //               //   style: TextStyle(fontSize: 16.0),
          //               // )
          //             )
          //           : Container(
          //               width: MediaQuery.of(context).size.width,
          //               //margin: EdgeInsets.symmetric(horizontal: 1.0),
          //               decoration: BoxDecoration(
          //                 color: Styles.backgroundCol,
          //                 borderRadius: BorderRadius.all(Radius.circular(15)),
          //               ),
          //               // child: Text(
          //               //   'text $i',
          //               //   style: TextStyle(fontSize: 16.0),
          //               // )
          //             );
          //     },
          //   );
          // }).toList(),
          itemCount: widget.images.length,
          itemBuilder: (BuildContext context, int index) {
            return (widget.images != null && widget.images.length > 1)
                ? Container(
                    child: Image.network(
                      IMG_BASE_URL + widget.images[index],
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                      },
                    ),
                    //(Image.network(IMG_BASE_URL + widget.images[index])),
                    width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                      color: Styles.backgroundCol,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    // child: Text(
                    //   'text $i',
                    //   style: TextStyle(fontSize: 16.0),
                    // )
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                      color: Styles.backgroundCol,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    // child: Text(
                    //   'text $i',
                    //   style: TextStyle(fontSize: 16.0),
                    // )
                  );
          },
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //children: [1, 2, 3, 4, 5].map((url) {
          children: widget.images.map((url) {
            // int index = [1, 2, 3, 4, 5].indexOf(url);
            int index = widget.images.indexOf(url);
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
