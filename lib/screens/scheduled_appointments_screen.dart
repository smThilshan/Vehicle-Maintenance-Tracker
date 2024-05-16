import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_tracker/models/appointments_model.dart';
import 'package:vehicle_maintenance_tracker/widgets/custom_card_widget.dart';

class ScheduledAppointmentsScreen extends StatelessWidget {
  static const routeName = 'scheduled_appointments_screen';

  @override
  Widget build(BuildContext context) {
    // Sample list of scheduled appointments (replace it with your actual data)
    List<Appointment> scheduledAppointments = [
      Appointment(
        icon: Icons.event,
        title: 'Service Appointment',
        description: 'Scheduled for regular service checkup',
        id: '',
      ),
      Appointment(
        icon: Icons.medical_services,
        title: 'Medical Checkup',
        description: 'Scheduled for medical examination',
        id: '',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Scheduled Appointments'),
      ),
      body: ListView.builder(
        itemCount: scheduledAppointments.length,
        itemBuilder: (context, index) {
          final appointment = scheduledAppointments[index];
          return CustomCardWidget(
            icon: appointment.icon,
            heading: appointment.title,
            description: appointment.description,
            onTap: () {
              // Handle tap event for scheduled appointment
              print('Tapped on scheduled appointment: ${appointment.title}');
            },
          );
        },
      ),
    );
  }
}
