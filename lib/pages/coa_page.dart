import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:http/http.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class COAPage extends StatefulWidget {
  final String id;

  const COAPage({Key key, this.id}) : super(key: key);

  @override
  _COAPageState createState() => _COAPageState();
}

class _COAPageState extends State<COAPage> {
  String urlPDFPath = "";
  bool _loaded = false;

  @override
  void initState() {
    super.initState();

    getFileFromUrl(widget.id).then((f) {
      setState(() {
        urlPDFPath = f.path;
        _loaded = true;
        print(urlPDFPath);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<File> getFileFromUrl(String url) async {
    try {
      var data = await get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File(
          "${dir.path}/${widget.id.substring(widget.id.length - 10, widget.id.length)}");
      File urlFile = await file.writeAsBytes(
        bytes,
      );

      return urlFile;
    } catch (e) {
      print("Error opening url file" + e.toString());
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
                  height: MediaQuery.of(context).size.height * .8,
                  child: PDFView(
                    filePath: urlPDFPath,
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