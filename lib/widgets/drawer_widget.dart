import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_tracker/screens/live_location_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/setting_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'John Doe',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            accountEmail: Text(
              'john.doe@example.com',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.person,
                size: 40,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, LiveLocationScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, SettingsScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              // Add logout item action here
            },
          ),
        ],
      ),
    );
  }
}
