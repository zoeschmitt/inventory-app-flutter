import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/utils/styles.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';
import 'package:inventory/widgets/buttons/main_button.dart';
import 'package:inventory/widgets/custom_field_widget.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';

class EditItemModal extends StatefulWidget {
  final Item item;
  final int variation;
  final List<String> currentPhotos;
  const EditItemModal({
    Key key,
    @required this.photosMultiplier,
    this.currentPhotos,
    this.variation,
    this.item,
  }) : super(key: key);

  final double photosMultiplier;

  @override
  _EditItemModalState createState() => _EditItemModalState();
}

class _EditItemModalState extends State<EditItemModal> {
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
  bool loading = false;
  Item editedItem = Item();

  final _formKey = GlobalKey<FormState>();
  String name = '';
  String price = '';

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10 -
            (widget.currentPhotos != null || widget.currentPhotos.length > 0
                ? widget.currentPhotos.length
                : 0),
        enableCamera: true,
        selectedAssets: images,
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
      error = e.toString();
      print(e.toString());
    }

    if (!mounted) {
      print("mount error");
      return;
    }

    setState(() {
      images = resultList;
      _error = error;
    });

    images.forEach((element) {print(element.identifier);});
  }

  Widget getImageContainer(int index) {
    Asset asset = images[index];
    return Container(
      clipBehavior: Clip.antiAlias,
      child: AssetThumb(
        asset: asset,
        height: (MediaQuery.of(context).size.height * widget.photosMultiplier)
            .toInt(),
        width: (MediaQuery.of(context).size.height * widget.photosMultiplier)
            .toInt(),
      ),
      //put item image here
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(index == 0 ? 12 : 15)),
        color: Styles.backgroundCol,
      ),
      // height: MediaQuery.of(context).size.height * widget.photosMultiplier,
      // width: MediaQuery.of(context).size.height * widget.photosMultiplier,
    );
  }

  Widget getExistingImageContainer(int index) {
    Asset asset = images[index];
    return Container(
      clipBehavior: Clip.antiAlias,
      child: AssetThumb(
        asset: asset,
        height: (MediaQuery.of(context).size.height * widget.photosMultiplier)
            .toInt(),
        width: (MediaQuery.of(context).size.height * widget.photosMultiplier)
            .toInt(),
      ),
      //put item image here
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(index == 0 ? 12 : 15)),
        color: Styles.backgroundCol,
      ),
      // height: MediaQuery.of(context).size.height * widget.photosMultiplier,
      // width: MediaQuery.of(context).size.height * widget.photosMultiplier,
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      editedItem = widget.item;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    price = widget.item.data.variations[widget.variation].data.price != null
        ? widget.item.data.variations[widget.variation].data.price.amount
            .toString()
        : " ";
    name = (widget.item.data.variations.length < 2
        ? widget.item.data.name
        : widget.item.data.variations[widget.variation].data.name);
    return Container(
      //height: MediaQuery.of(context).size.height * 0.93,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    //widget.item.data.variations[widget.variation].data.name,
                    (widget.item.data.variations.length < 2
                        ? widget.item.data.name
                        : widget
                            .item.data.variations[widget.variation].data.name),
                    maxLines: 3,
                    style: GoogleFonts.libreFranklin(
                        fontSize: 28,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CustomButton(icon: Icons.clear)),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      //choose photos
                      images.length >= 10
                          ? _error = "could not load"
                          : loadAssets();
                    },
                    child: Container(
                        child: Icon(Icons.add),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Styles.backgroundCol,
                        ),
                        height: MediaQuery.of(context).size.height *
                            widget.photosMultiplier,
                        width: (MediaQuery.of(context).size.height *
                                widget.photosMultiplier) /
                            2),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height *
                      widget.photosMultiplier,
                  child: Row(
                    children: <Widget>[
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: images.isEmpty ? 1 : images.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: index == 0 ? 15.0 : 0,
                                right: index == (images.length - 1) ? 15.0 : 0),
                            child: images.isEmpty
                                ? null
                                : GestureDetector(
                                    onTap: () {
                                      print("tap tap");
                                    },
                                    child: getImageContainer(index)),
                          );
                        },
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 10);
                        },
                      ),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        // itemCount: widget.currentPhotos.length,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 0,
                                right: index == (images.length - 1) ? 25.0 : 0),
                            child: widget.currentPhotos.isEmpty
                                ? Container(
                                    //put item image here
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              index == 0 ? 12 : 15)),
                                      color: Styles.backgroundCol,
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        widget.photosMultiplier,
                                    width: MediaQuery.of(context).size.height *
                                        widget.photosMultiplier,
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      print("tap tap");
                                    },
                                    child: getExistingImageContainer(index)),
                          );
                        },
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 10);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CustomFieldWidget(
                    textCap: TextCapitalization.words,
                    enabled: true,
                    fieldTitle: "Name",
                    initialText: (widget.item.data.variations.length < 2
                        ? widget.item.data.name
                        : widget
                            .item.data.variations[widget.variation].data.name),
                    valFunc: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => name = val),
                  ),
                  SizedBox(height: 10),
                  CustomFieldWidget(
                    fieldTitle: "Price",
                    initialText: widget.item.data.variations[widget.variation]
                        .data.price.amount
                        .toString(),
                    valFunc: (val) =>
                        val.isEmpty ? 'Please enter a valid price' : null,
                    onChanged: (val) => setState(() => price = val),
                    textCap: TextCapitalization.words,
                    enabled: true,
                  ),
                  SizedBox(height: 50),
                  MainButton(
                    title: "Update Item",
                    onPressed: () async {
                      final model =
                          Provider.of<InventoryModel>(context, listen: false);
                      if (_formKey.currentState.validate()) {
                        print("valid");
                        //send images
                        setState(() {
                          loading = true;
                          editedItem.data.variations[widget.variation].data
                              .name = name;
                          //editedItem.data.variations[widget.variation].data.price.amount = int.parse(price);
                        });
                        bool result = await model.updateProd(editedItem);
                        if (result == null) {
                          setState(() {
                            loading = false;
                            _error = 'Could not update item';
                          });
                        }
                      }
                    },
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
