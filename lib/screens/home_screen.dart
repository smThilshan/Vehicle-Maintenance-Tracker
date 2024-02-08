import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_tracker/widgets/bottom_appbar_widget.dart';
import 'package:vehicle_maintenance_tracker/widgets/custom_card_widget.dart';
import 'package:vehicle_maintenance_tracker/widgets/drawer_widget.dart';

import '../models/vehicle_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController _carouselController = CarouselController();
  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black87,
        foregroundColor: Colors.yellow,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const BottomAppbarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
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
            const CustomCardWidget(
              icon: Icons.work,
              heading: 'UPCOMING APPOINTMENTS',
              description: 'you have appointment on coming week',
            ),
            const CustomCardWidget(
              icon: Icons.schedule,
              heading: 'SCHEDULED APPOINTMENTS',
              description: 'you have appointment on 21st February',
            ),
            const CustomCardWidget(
              icon: Icons.local_activity,
              heading: 'RECENT ACTIVITIES',
              description: 'changed the brake pads',
            ),
            const CustomCardWidget(
              icon: Icons.car_crash,
              heading: 'SHOPS NEAR ME',
              description: 'find auto mobile shops near me',
            ),
          ],
        ),
      ),
    );
  }
}

class HeroCarouselWidget extends StatelessWidget {
  final Vehicle vehicle;
  const HeroCarouselWidget({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(vehicle.imgUrl, fit: BoxFit.cover, width: 1000.0),
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
                    vehicle.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
