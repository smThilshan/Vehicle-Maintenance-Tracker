import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_maintenance_tracker/providers/vehicles_provider.dart';
import 'package:vehicle_maintenance_tracker/screens/add_vehicle_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/expenses_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/home_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/login_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/notification_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/parts_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/realtime_vehicle_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/reminder_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/setting_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/sign_up_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/update_vehicle_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/user_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/vehicle_details_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/vehicle_maintenance_log_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/vehicle_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Vehicle Maintenance Tracker',
    //   // theme: ThemeData(
    //   //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade400),
    //   //   useMaterial3: true,
    //   // ),
    //   home: VehicleScreen(),
    // );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VehiclesProvider()),
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
          ExpensesScreen.routeName: (context) => ExpensesScreen(),
          NotificationScreen.routeName: (context) => NotificationScreen(),
          PartsScreen.routeName: (context) => PartsScreen(),
          LiveLocationScreen.routeName: (context) => LiveLocationScreen(),
          ReminderScreen.routeName: (context) => ReminderScreen(),
          SettingsScreen.routeName: (context) => SettingsScreen(),
          UpdateVehicleSrceen.routeName: (context) => UpdateVehicleSrceen(),
          UserScreen.routeName: (context) => UserScreen(),
          VehicleDetailsScreen.routeName: (context) => VehicleDetailsScreen(),
        },
        home: HomeScreen(),
      ),
    );
  }
}
