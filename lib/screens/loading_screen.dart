import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

const apiKey = '07eca853b5ce89a52c1dc7aab7f28220';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(locationWeather: weatherData);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpinKitDoubleBounce(
        color: Colors.white,
        size: 80,
      ),
    );
  }
}
