import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_tracker/screens/add_appointment_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/add_expense_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/add_reminder_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/add_vehicle_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/expenses_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/notification_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/recent_activities_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/reminder_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/scheduled_appointments_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/setting_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/shops_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/upcoming_appointments_screen.dart';
import 'package:vehicle_maintenance_tracker/screens/vehicle_screen.dart';
import 'package:vehicle_maintenance_tracker/widgets/bottom_appbar_widget.dart';
import 'package:vehicle_maintenance_tracker/widgets/custom_card_widget.dart';
import 'package:vehicle_maintenance_tracker/widgets/drawer_widget.dart';
import 'package:vehicle_maintenance_tracker/widgets/vehicle_card_widget.dart';
import '../models/vehicle_model.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController _carouselController = CarouselController();
  int _currentSlide = 0;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Adding dialog box

  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildAddItemOption(Icons.money_rounded, 'Expense', context),
                const SizedBox(height: 12),
                _buildAddItemOption(Icons.schedule, 'Appointment', context),
                const SizedBox(height: 12),
                _buildAddItemOption(Icons.notifications, 'Reminder', context),
                const SizedBox(height: 12),
                _buildAddItemOption(Icons.car_rental, 'Vehicle', context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAddItemOption(
      IconData iconData, String title, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); // Close the dialog
        // Navigate to the respective screen based on the title
        if (title == 'Expense') {
          Navigator.pushNamed(context, AddExpenseScreen.routeName);
        } else if (title == 'Appointment') {
          // Navigate to the appointment screen
          Navigator.pushNamed(context, AddAppointmentScreen.routeName);
        } else if (title == 'Vehicle') {
          // Navigate to the vehicle screen
          Navigator.pushNamed(context, AddVehicleScreen.routeName);
        } else if (title == 'Reminder') {
          // Navigate to the reminder screen
          Navigator.pushNamed(context, AddReminderScreen.routeName);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.withOpacity(0.1),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.black87,
              size: 24.0,
            ),
            const SizedBox(width: 16.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NotificationScreen.routeName);
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(context); // Show the add dialog
        },
        backgroundColor: Colors.black87,
        foregroundColor: Colors.yellow,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Vehicle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_rounded),
            label: 'Expense',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Reminder',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            if (_selectedIndex == 0) ...[
              // Content for Home
              CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 2,
                  autoPlay: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentSlide = index;
                    });
                  },
                ),
                carouselController: _carouselController,
                items: Vehicle.vehicles
                    .map((vehicle) => HeroCarouselWidget(vehicle: vehicle))
                    .toList(),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: Vehicle.vehicles.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _carouselController.animateToPage(entry.key),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentSlide == entry.key
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ),
              CustomCardWidget(
                onTap: () {
                  Navigator.pushNamed(
                      context, UpcomingAppointmentsScreen.routeName);
                },
                icon: Icons.work,
                heading: 'UPCOMING APPOINTMENTS',
                description: 'you have appointment on coming week',
              ),
              CustomCardWidget(
                onTap: () {
                  Navigator.pushNamed(
                      context, ScheduledAppointmentsScreen.routeName);
                },
                icon: Icons.schedule,
                heading: 'SCHEDULED APPOINTMENTS',
                description: 'you have appointment on 21st February',
              ),
              CustomCardWidget(
                onTap: () {
                  Navigator.pushNamed(
                      context, RecentActivitiesScreen.routeName);
                },
                icon: Icons.local_activity,
                heading: 'RECENT ACTIVITIES',
                description: 'changed the brake pads',
              ),
              CustomCardWidget(
                onTap: () {
                  Navigator.pushNamed(context, ShopScreen.routeName);
                },
                icon: Icons.car_crash,
                heading: 'SHOPS NEAR ME',
                description: 'find auto mobile shops near me',
              ),
            ] else if (_selectedIndex == 1) ...[
              const VehicleScreen(),
            ] else if (_selectedIndex == 2) ...[
              ExpensesScreen(),
            ] else if (_selectedIndex == 3) ...[
              ReminderScreen(),
            ],
          ],
        ),
      ),
    );
  }
}

class HeroCarouselWidget extends StatelessWidget {
  final Vehicle vehicle;
  const HeroCarouselWidget({Key? key, required this.vehicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.file(vehicle.imageFile!, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  vehicle.vehicleModel,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
