import 'package:flutter/material.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';

//for the list on the home page get an endpoint that only gives you
//the 3 details plus an id, if they tap one then i use the id to get more details

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25, top: 20, bottom: 45),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CustomButton(icon: Icons.arrow_back_ios),
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CustomButton(icon: Icons.share),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CustomButton(icon: Icons.mode_edit)
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
