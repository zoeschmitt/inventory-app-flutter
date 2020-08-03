import 'package:flutter/material.dart';
import 'package:inventory/models/user_notification.dart';
import 'package:inventory/widgets/modal_title_widget.dart';
import 'package:inventory/widgets/notification_container_widget.dart';

final notifs = [
  UserNotification(
      title: "Notification",
      body: "Lorem Ipsum blah blah blah heres a notification",
      date: "June 29th, 2020"),
  UserNotification(
      title: "Notification",
      body: "Lorem Ipsum blah blah blah heres a notification",
      date: "June 29th, 2020"),
  UserNotification(
      title: "Notification",
      body: "Lorem Ipsum blah blah blah heres a notification",
      date: "June 29th, 2020"),
  UserNotification(
      title: "Notification",
      body: "Lorem Ipsum blah blah blah heres a notification",
      date: "June 29th, 2020"),
  UserNotification(
      title: "Notification",
      body: "Lorem Ipsum blah blah blah heres a notification",
      date: "June 29th, 2020"),
  UserNotification(
      title: "Notification",
      body: "Lorem Ipsum blah blah blah heres a notification",
      date: "June 29th, 2020"),
  UserNotification(
      title: "Notification",
      body: "Lorem Ipsum blah blah blah heres a notification",
      date: "June 29th, 2020"),
  UserNotification(
      title: "Notification",
      body: "Lorem Ipsum blah blah blah heres a notification",
      date: "June 29th, 2020"),
  UserNotification(
      title: "Notification",
      body: "Lorem Ipsum blah blah blah heres a notification",
      date: "June 29th, 2020"),
];

class NotificationsModal extends StatelessWidget {
  const NotificationsModal({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
        child: Column(
          children: <Widget>[
            ModalTitleWidget(title: "Notifications"),
            SizedBox(height: 30.0),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return NotificationContainerWidget(
                    title: notifs[index].title,
                    body: notifs[index].body,
                    date: notifs[index].date,
                  );
                },
                itemCount: notifs.length,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 20.0);
                },
              ),
            ),
          ],
        ));
  }
}