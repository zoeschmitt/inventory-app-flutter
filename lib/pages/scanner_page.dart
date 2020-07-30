import 'package:flutter/material.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';

class ScannerPage extends StatefulWidget {
  final BuildContext context;
  final VoidCallback closedContainer;

  const ScannerPage({Key key, this.context, this.closedContainer}) : super(key: key);

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            25.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: widget.closedContainer,
                        child: CustomButton(icon: Icons.clear),
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
