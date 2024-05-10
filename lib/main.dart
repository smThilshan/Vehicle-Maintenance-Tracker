import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_maintenance_tracker/providers/expense_provider.dart';
import 'package:vehicle_maintenance_tracker/providers/reminder_provider.dart';
import 'package:vehicle_maintenance_tracker/providers/vehicles_provider.dart';
import 'package:vehicle_maintenance_tracker/screens/add_appointment_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/add_expense_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/add_reminder_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/add_vehicle_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/expenses_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/home_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/live_location_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/login_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/notification_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/parts_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/recent_activities_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/reminder_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/scheduled_appointments_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/setting_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/shops_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/sign_up_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/upcoming_appointments_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/update_vehicle_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/user_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/vehicle_details_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/vehicle_maintenance_log_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/vehicle_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VehiclesProvider()),
        ChangeNotifierProvider(create: (_) => ExpenseProvider()),
        ChangeNotifierProvider(create: (_) => ReminderProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          SignUpScreen.routeName: (context) => SignUpScreen(),
          VehicleScreen.routeName: (context) => const VehicleScreen(),
          VehicleMaintenanceLogScreen.routeName: (context) =>
              VehicleMaintenanceLogScreen(),
          AddVehicleScreen.routeName: (context) => AddVehicleScreen(),
          AddExpenseScreen.routeName: (context) => AddExpenseScreen(),
          AddReminderScreen.routeName: (context) => AddReminderScreen(),
          AddAppointmentScreen.routeName: (context) => AddAppointmentScreen(),
          ExpensesScreen.routeName: (context) => ExpensesScreen(),
          NotificationScreen.routeName: (context) => NotificationScreen(),
          PartsScreen.routeName: (context) => PartsScreen(),
          ReminderScreen.routeName: (context) => ReminderScreen(),
          SettingsScreen.routeName: (context) => SettingsScreen(),
          UpdateVehicleSrceen.routeName: (context) => UpdateVehicleSrceen(),
          UserScreen.routeName: (context) => UserScreen(),
          VehicleDetailsScreen.routeName: (context) => VehicleDetailsScreen(),
          UpcomingAppointmentsScreen.routeName: (context) =>
              UpcomingAppointmentsScreen(),
          ScheduledAppointmentsScreen.routeName: (context) =>
              ScheduledAppointmentsScreen(),
          RecentActivitiesScreen.routeName: (context) =>
              RecentActivitiesScreen(),
          ShopScreen.routeName: (context) => ShopScreen(),
          LiveLocationScreen.routeName: (context) => LiveLocationScreen(),
        },
        home: HomeScreen(),
      ),
    );
  }
}
