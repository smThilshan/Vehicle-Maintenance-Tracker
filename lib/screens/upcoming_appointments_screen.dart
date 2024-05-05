import 'package:flutter/material.dart';

class UpcomingAppointmentsScreen extends StatelessWidget {
  static const routeName = 'upcoming_appointments_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Appointments'),
      ),
      body: ListView.builder(
        itemCount: 5, // Replace with actual number of upcoming appointments
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.event),
              ),
              title: Text('Upcoming Appointment ${index + 1}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date: May 15, 2024'),
                  Text('Time: 10:00 AM'),
                  Text('Location: Auto Service Center'),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  // Handle tapping on an upcoming appointment
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
