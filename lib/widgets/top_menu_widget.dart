import 'package:flutter/material.dart';
import 'package:inventory/models/user_notification.dart';
import 'package:inventory/pages/settings_page.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';

import 'notification_container_widget.dart';

class TopMenuWidget extends StatefulWidget {
  const TopMenuWidget({
    Key key,
  }) : super(key: key);

  @override
  _TopMenuWidgetState createState() => _TopMenuWidgetState();
}

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

class _TopMenuWidgetState extends State<TopMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            'Welcome Back, Zoe',
            maxLines: 2,
            style: TextStyle(
              fontSize: 30,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 5),
        IconButton(
            icon: Icon(
              Icons.notifications,
              size: 36,
              color: Colors.black,
            ),
            onPressed: () {
              _notificationsModal(context);
            }),
        SizedBox(width: 4),
        IconButton(
            icon: Icon(
              Icons.settings,
              size: 36,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            })
      ],
    );
  }

  _notificationsModal(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.93,
        child: Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Notifications',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CustomButton(icon: Icons.clear)),
                  ],
                ),
                SizedBox(height: 20.0),
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
                      return SizedBox(height: 15.0);
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
