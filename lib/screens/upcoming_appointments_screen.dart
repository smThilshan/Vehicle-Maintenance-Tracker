import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_tracker/models/appointments_model.dart'; // Import your Appointment model
import 'package:vehicle_maintenance_tracker/services/database.dart'; // Import your database service

class UpcomingAppointmentsScreen extends StatefulWidget {
  static const routeName = 'upcoming_appointments_screen';

  @override
  _UpcomingAppointmentsScreenState createState() =>
      _UpcomingAppointmentsScreenState();
}

class _UpcomingAppointmentsScreenState
    extends State<UpcomingAppointmentsScreen> {
  late Future<List<Appointment>> _appointmentsFuture;

  @override
  void initState() {
    super.initState();
    _appointmentsFuture = DatabaseMethods()
        .getAllAppointments(); // Fetch appointments from Firestore
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Appointments'),
      ),
      body: FutureBuilder<List<Appointment>>(
        future: _appointmentsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No upcoming appointments'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Appointment appointment = snapshot.data![index];
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(appointment.icon),
                    ),
                    title: Text(appointment.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date: ${appointment.dateTime?.toLocal()}'),
                        // Convert appointment dateTime to local time
                        // Add more appointment details as needed
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        try {
                          // Delete an appointment with ID 'appointmentId'
                          await DatabaseMethods()
                              .deleteAppointment(appointment.id);
                          print('Appointment deleted successfully');

                          // Remove the deleted appointment from the list displayed on the screen
                          setState(() {
                            snapshot.data!.removeAt(index);
                          });
                        } catch (e) {
                          print('Failed to delete appointment: $e');
                        }
                        // Handle tapping on an upcoming appointment
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
