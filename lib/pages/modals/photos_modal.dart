import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/models/item_image_model.dart';
import 'package:inventory/utils/styles.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';

class PhotosModal extends StatefulWidget {
  final String id;
  const PhotosModal({Key key, @required this.id}) : super(key: key);

  @override
  _PhotosModalState createState() => _PhotosModalState();
}

class _PhotosModalState extends State<PhotosModal> {
  static const IMG_BASE_URL = 'https://alamo-botanicals-shop.imgix.net/';
  List<String> _imageIds = [];
  List<ItemImage> _selected = [];
  //List<Asset> _images = List<Asset>();
  String _error = ' ';
  bool _loading = false;

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
        _loading = true;
      });
      setState(() {
        _imageIds = model1.images;
      });
      //print("iamges length " + _imageIds.length.toString());
    } catch (e) {
      print(e.toString());
    }
    setState(() {
      if (mounted) {
        _loading = false;
      }
    });
  }

  Widget buildGridView() {
    double length = MediaQuery.of(context).size.width * 0.3;
    if (_imageIds != null)
      return GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: List.generate(_imageIds.length, (index) {
          return GestureDetector(
            onTap: () async {
              // if (_selected.contains(_imageIds[index])) {
              //   setState(() {
              //     _selected.remove(_imageIds[index]);
              //   });
              // } else {
              //   setState(() {
              //     _selected.add(_imageIds[index]);
              //   });
              // }
              // print("_selected.length");
              // print(_selected.length);
            },
            child: Container(
              width: length,
              height: length,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(IMG_BASE_URL)),
                border: _selected.contains(_imageIds[index])
                    ? Border.all(color: Styles.custBlue, width: 2)
                    : Border(),
                //color: Styles.backgroundCol,
                borderRadius: BorderRadius.all(Radius.circular(9)),
              ),
            ),
          );
        }),
      );
    else
      return Container(color: Colors.white);
  }

  Future<void> loadAssets() async {
    final model1 = Provider.of<InventoryModel>(context, listen: false);
    // setState(() {
    //   _images = List<Asset>();
    // });

    List<Asset> _images = List<Asset>();
    List<Asset> resultList = List<Asset>();
    String error = ' ';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 3,
        enableCamera: true,
        selectedAssets: _images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          // actionBarTitle: "Example App",
          // allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = "Could Not Access Photos";
      print(e.toString());
    }

    if (!mounted) {
      print("mount error");
      return;
    }

    _images = resultList;

    _images.forEach((element) async {
      try {
        dynamic result = await model1.addImage(widget.id, element);
        result == false ? throw Exception() : print("image added");
      } catch (e) {
        _error = "Could Not add Images";
        print(e.toString());
      }
    });

    setState(() {
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    final model1 = Provider.of<InventoryModel>(context, listen: false);
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 25.0,
          left: 25.0,
          right: 25.0,
          bottom: 25.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      "Add",
                      maxLines: 3,
                      style: GoogleFonts.libreFranklin(
                          fontSize: 28,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                        onTap: () {
                          loadAssets();
                        },
                        child: CustomButton(icon: Icons.add)),
                    SizedBox(width: 10),
                    _selected.isNotEmpty
                        ? GestureDetector(
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Styles.custBlue,
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(
                                        color: (Colors.white),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0),
                                  ),
                                )),
                            onTap: () {
                              // print("in ontap");
                              // print(_selected.length);
                              // _selected.forEach((element) {
                                // try {
                                //   dynamic result = model1.deleteImage(
                                //       widget.id);

                                //   result == false
                                //       ? throw Exception()
                                //       : print("image deleted");
                                // } catch (e) {
                                //   setState(() {
                                //     _error = "Could Not Delete Images";
                                //   });

                              //     print(e.toString());
                              //   }
                              // });
                              // setState(() {
                              //   _selected.clear();
                              // });
                  //             loadImages();
                            },
                          )
                        : Container(),
                  ],
                ),
                SizedBox(width: 10),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CustomButton(icon: Icons.clear)),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              _error,
              style: TextStyle(fontSize: 14.0, color: Colors.red),
            ),
            SizedBox(height: 20.0),
            Container(
              //switch to expanded
              child: Flexible(fit: FlexFit.tight, child: buildGridView()),
            ),
          ],
        ),
      ),
    );
  }
}
