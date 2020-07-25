import 'package:flutter/material.dart';

class UserNotification {
  final String title;
  final String body;
  final String date;

  const UserNotification({
    @required this.title,
    @required this.body,
    @required this.date
    });
}