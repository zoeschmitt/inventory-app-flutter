import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/models/category_model.dart';
import 'package:inventory/models/inventory_model.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/utils/styles.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';
import 'package:inventory/widgets/custom_field_widget.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class COAModal extends StatefulWidget {
  final String id;

  const COAModal({Key key, this.id}) : super(key: key);

  @override
  _COAModalState createState() => _COAModalState();
}

class _COAModalState extends State<COAModal> {

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding:
          const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0, bottom: 50),
      child: WebView(
          initialUrl: 'https://marketingstoreimages.blob.core.windows.net/labreports/' + widget.id,
          javascriptMode: JavascriptMode.unrestricted,
        ),
    );
  }
}