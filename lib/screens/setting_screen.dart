import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = 'settings_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'General',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildSettingTile(
              context,
              icon: Icons.account_circle,
              title: 'Account',
              onTap: () {
                // Handle onTap action
              },
            ),
            _buildSettingTile(
              context,
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () {
                // Handle onTap action
              },
            ),
            _buildSettingTile(
              context,
              icon: Icons.security,
              title: 'Privacy & Security',
              onTap: () {
                // Handle onTap action
              },
            ),
            Divider(height: 30, color: Colors.grey[300]),
            Text(
              'Appearance',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildSettingTile(
              context,
              icon: Icons.color_lens,
              title: 'Theme',
              onTap: () {
                // Handle onTap action
              },
            ),
            _buildSettingTile(
              context,
              icon: Icons.language,
              title: 'Language',
              onTap: () {
                // Handle onTap action
              },
            ),
            Divider(height: 30, color: Colors.grey[300]),
            Text(
              'About',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildSettingTile(
              context,
              icon: Icons.info,
              title: 'About Us',
              onTap: () {
                // Handle onTap action
              },
            ),
            _buildSettingTile(
              context,
              icon: Icons.policy,
              title: 'Privacy Policy',
              onTap: () {
                // Handle onTap action
              },
            ),
            _buildSettingTile(
              context,
              icon: Icons.feedback,
              title: 'Send Feedback',
              onTap: () {
                // Handle onTap action
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTile(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(icon, size: 30),
            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
