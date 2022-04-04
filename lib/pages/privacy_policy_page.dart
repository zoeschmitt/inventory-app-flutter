import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({Key key}) : super(key: key);
  @override
  _PrivacyPolicyPageState createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  String assetPDFPath = "";
  bool _loaded = false;

  @override
  void initState() {
    super.initState();

    getFileFromAsset("assets/PrivacyPolicy-2020.pdf")
        .then((f) {
      setState(() {
        assetPDFPath = f.path;
        _loaded = true;
        //print(assetPDFPath);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file =
          File("${dir.path}/PrivacyPolicy-2020.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      print("error could not load pdf" + e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CustomButton(icon: SFSymbols.chevron_left),
                    ),
                  ]),
            ),
            SizedBox(height: 50),
            _loaded
                ? Container(
                  height: MediaQuery.of(context).size.height * .7,
                  child: PDFView(
                    filePath: assetPDFPath,
                    pageSnap: false,
                    onError: (e) {
                      print("error could not render pdf" + e);
                    },
                  ),
                )
                : CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
