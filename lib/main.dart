import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_tracker/screens/home_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/login_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vehicle Maintenance Tracker',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade400),
      //   useMaterial3: true,
      // ),
      home: HomeScreen(),
    );
  }
}
