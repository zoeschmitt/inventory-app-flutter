import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PrivacyPolicyModal extends StatefulWidget {
  final String id;

  const PrivacyPolicyModal({Key key, this.id}) : super(key: key);

  @override
  _PrivacyPolicyModalState createState() => _PrivacyPolicyModalState();
}

class _PrivacyPolicyModalState extends State<PrivacyPolicyModal> {
  String assetPDFPath = "";
  bool loaded = false;

  @override
  void initState() {
    super.initState();

    getFileFromAsset("assets/AlamoBotanicals-Website-PrivacyPolicy-2020.pdf")
        .then((f) {
      setState(() {
        assetPDFPath = f.path;
        loaded = true;
        print(assetPDFPath);
      });
    });
  }

  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file =
          File("${dir.path}/AlamoBotanicals-Website-PrivacyPolicy-2020.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      print("error could not load pdf" + e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CustomButton(icon: Icons.clear)),
              ],
            ),
          ),
          loaded == true
              ? Flexible(
                  fit: FlexFit.tight,
                  child: PDFView(
                    filePath: assetPDFPath,
                    autoSpacing: true,
                    //fitEachPage: true,
                    swipeHorizontal: false,
                    onError: (e) {
                      print("error could not render pdf" + e);
                    },
                  ),
                )
              : CircularProgressIndicator(),
        ],
      ),
    );
  }
}
