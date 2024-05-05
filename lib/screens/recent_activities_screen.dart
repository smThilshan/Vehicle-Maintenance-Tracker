import 'package:flutter/material.dart';
import '../models/appointments_model.dart';
import '../widgets/custom_card_widget.dart';

class RecentActivitiesScreen extends StatelessWidget {
  static const routeName = 'recent_activities_screen';
  @override
  Widget build(BuildContext context) {
    // Dummy data for demonstration
    final List<Appointment> recentActivities = [
      Appointment(
        icon: Icons.notifications,
        heading: 'Received Notification',
        description: 'You have a new message.',
      ),
      Appointment(
        icon: Icons.event,
        heading: 'Upcoming Event',
        description: 'Join us for the annual conference.',
      ),
      Appointment(
        icon: Icons.email,
        heading: 'Sent Email',
        description: 'Follow up with the client.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Recent Activities'),
      ),
      body: ListView.builder(
        itemCount: recentActivities.length,
        itemBuilder: (context, index) {
          final activity = recentActivities[index];
          return InkWell(
            onTap: () {
              // Handle onTap action
            },
            child: CustomCardWidget(
              icon: activity.icon,
              heading: activity.heading,
              description: activity.description,
            ),
          );
        },
      ),
    );
  }
}
