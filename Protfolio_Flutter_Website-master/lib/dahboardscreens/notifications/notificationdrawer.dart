import 'package:flutter/material.dart';

class NotificationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Notifications',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Notification 1'),
            onTap: () {
              // Handle notification 1 click
            },
          ),
          ListTile(
            title: Text('Notification 2'),
            onTap: () {
              // Handle notification 2 click
            },
          ),
          ListTile(
            title: Text('Notification 3'),
            onTap: () {
              // Handle notification 3 click
            },
          ),
        ],
      ),
    );
  }
}
