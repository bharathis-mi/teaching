import 'dart:math';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () async {
            final location = await Location().getLocation();
            if (location.latitude != null && location.longitude != null) {
              if (isUserWithinRadius(location.latitude!, location.longitude!,
                  12.978073, 80.136841)) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('You are not allowed to take attendance')));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('You are allowed to take attendance')));
              }
            }
          },
          child: const Text("Get Location"),
        ),
      ),
    );
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double R = 6371e3; // meters (Earth's radius)

    final double dLat = radians(lat2 - lat1);
    final double dLon = radians(lon2 - lon1);

    final double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(radians(lat1)) * cos(radians(lat2)) * sin(dLon / 2) * sin(dLon / 2);

    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return R * c;
  }

  double radians(double degrees) {
    return degrees * pi / 180;
  }

  bool isUserWithinRadius(double userLat, double userLon, double restrictedLat,
      double restrictedLon) {
    final distance =
        calculateDistance(userLat, userLon, restrictedLat, restrictedLon);
    return distance <= 1000;
  }
}
