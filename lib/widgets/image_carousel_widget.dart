import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarouselWidget extends StatefulWidget {
  @override
  _ImageCarouselWidgetState createState() => _ImageCarouselWidgetState();
}

class _ImageCarouselWidgetState extends State<ImageCarouselWidget> {
  
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
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
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius:
                          BorderRadius.all(Radius.circular(15)),
                    ),
                    // child: Text(
                    //   'text $i',
                    //   style: TextStyle(fontSize: 16.0),
                    // )
                    );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [1, 2, 3, 4, 5].map((url) {
            int index = [1, 2, 3, 4, 5].indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 2.0),
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
