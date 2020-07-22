import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const MenuItemWidget({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
        ),
        child: Padding(
          //padding: const EdgeInsets.only(top: 25.0, bottom: 25.0, left: 25.0, right: 25.0),
          padding: const EdgeInsets.only(top: 21.0, bottom: 21.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(width: 15),
              Icon(
                icon,
                size: 28.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}