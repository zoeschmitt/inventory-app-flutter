import 'dart:io';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class COAModal extends StatefulWidget {
  final String id;

  const COAModal({Key key, this.id}) : super(key: key);

  @override
  _COAModalState createState() => _COAModalState();
}

class _COAModalState extends State<COAModal> {
  String assetPDFPath = "";
  String urlPDFPath = "";
  bool loading = false;
  String url = 'https://marketingstoreimages.blob.core.windows.net/labreports/';

  @override
  void initState() {
    super.initState();

    getFileFromUrl(url + widget.id).then((f) {
      setState(() {
        urlPDFPath = f.path;
        print(urlPDFPath);
      });
    });
  }

  Future<File> getFileFromUrl(String url) async {
    try {
      var data = await get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdfonline.pdf");

      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: 25.0, left: 25.0, right: 25.0, bottom: 50),
        child: Container(
          child: PDFView(
            filePath:
                urlPDFPath != null ? urlPDFPath : CircularProgressIndicator(),
          ),
        ));
  }
}
