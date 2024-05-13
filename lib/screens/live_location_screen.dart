import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;
import 'package:url_launcher/url_launcher_string.dart';

class LiveLocationScreen extends StatefulWidget {
  static const routeName = 'add_vehicle_screen';

  @override
  _LiveLocationScreenState createState() => _LiveLocationScreenState();
}

class _LiveLocationScreenState extends State<LiveLocationScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   _getLocation();
  // }
  String locationMessage = "Current Location of the User";
  late String lat;
  late String long;

  void _liveLocation() {
    geolocator.LocationSettings locationSettings =
        const geolocator.LocationSettings(
      accuracy: geolocator.LocationAccuracy.high,
      distanceFilter: 100,
    );

    geolocator.Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((geolocator.Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();
    });

    setState(() {
      locationMessage = 'Latitude: $lat, Longtitude: $long';
    });
  }

  Future<geolocator.Position> _getCurrentLocation() async {
    bool serviceEnabled =
        await geolocator.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location is turned off");
    }
    geolocator.LocationPermission permission =
        await geolocator.Geolocator.checkPermission();

    if (permission == geolocator.LocationPermission.denied) {
      permission = await geolocator.Geolocator.requestPermission();
      if (permission == geolocator.LocationPermission.denied) {
        return Future.error("Location permissions are denied");
      }

      if (permission == geolocator.LocationPermission.deniedForever) {
        return Future.error("Location permissions are permenantaly denied");
      }
    }

    return await geolocator.Geolocator.getCurrentPosition();
  }

  Future<void> _openMap(String lat, String long) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';

    // Use launch() method from the url_launcher package to open the URL
    await canLaunchUrlString(googleUrl)
        ? await launchUrlString(googleUrl)
        : throw "Could not launch $googleUrl";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Location Tracking'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              locationMessage,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  _getCurrentLocation().then((value) {
                    lat = '${value.latitude}';
                    long = '${value.longitude}';
                  });

                  setState(() {
                    locationMessage = 'Latitude: $lat, Longitute: $long';
                  });
                  _liveLocation();
                },
                child: Text("Find Current Location")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                _openMap(lat, long);
              },
              child: Text("Show on Map"),
            )
          ],
        ),
      ),
    );
  }
}
