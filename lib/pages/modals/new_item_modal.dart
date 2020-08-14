import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/utils/styles.dart';
import 'package:inventory/widgets/buttons/main_button.dart';
import 'package:inventory/widgets/custom_field_widget.dart';
import 'package:inventory/widgets/modal_title_widget.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class NewItemModal extends StatefulWidget {
  const NewItemModal({
    Key key,
    @required this.photosMultiplier,
  }) : super(key: key);

  final double photosMultiplier;

  @override
  _NewItemModalState createState() => _NewItemModalState();
}

class _NewItemModalState extends State<NewItemModal> {
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

  final _formKey = GlobalKey<FormState>();
  String name = '';
  String category = '';
  String sku = '';
  String location = '';
  String price = '';
  String quantity = '';
  String other = '';
  String other1 = '';

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
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
  }

  Widget getImageContainer(int index) {
    Asset asset = images[index];
    return Expanded(
      child: Container(
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.93,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
            child: ModalTitleWidget(title: "New Item"),
          ),
          SizedBox(height: 20.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      //choose photos
                      images.length >= 10
                          ? print("snack bar cant take more")
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
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: images.isEmpty ? 1 : images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: index == 0 ? 15.0 : 0,
                            right: index == (images.length - 1) ? 25.0 : 0),
                        child: images.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  GestureDetector(
                                    child: Text(
                                      "Add Photos",
                                      style: GoogleFonts.sourceSansPro(
                                          fontSize: 16,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    onTap: () {
                                      images.length >= 10
                                          ? print("snack bar cant take more")
                                          : loadAssets();
                                    },
                                  ),
                                ],
                              )
                            : getImageContainer(index),
                      );
                    },
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 10);
                    },
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
                    initialText: "",
                    valFunc: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => name = val),
                  ),
                  SizedBox(height: 10),
                  CustomFieldWidget(
                    fieldTitle: "Category",
                    initialText: "",
                    valFunc: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => name = val),
                    textCap: TextCapitalization.words,
                    enabled: true,
                  ),
                  SizedBox(height: 10),
                  CustomFieldWidget(
                    fieldTitle: "SKU",
                    initialText: "",
                    valFunc: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => name = val),
                    textCap: TextCapitalization.words,
                    enabled: true,
                  ),
                  SizedBox(height: 10),
                  CustomFieldWidget(
                    fieldTitle: "Location",
                    initialText: "",
                    valFunc: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => name = val),
                    textCap: TextCapitalization.words,
                    enabled: true,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: CustomFieldWidget(
                          fieldTitle: "Price",
                          initialText: "",
                    valFunc: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => name = val),
                    textCap: TextCapitalization.words,
                    enabled: true,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomFieldWidget(
                          fieldTitle: "Quantity",
                          initialText: "",
                    valFunc: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => name = val),
                    textCap: TextCapitalization.words,
                    enabled: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: CustomFieldWidget(
                          fieldTitle: "Price",
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomFieldWidget(
                          fieldTitle: "Quantity",
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomFieldWidget(
                          fieldTitle: "Weight",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  MainButton(
                    title: "Create Item",
                    onPressed: () {
                      //api call to create item
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
