import 'dart:convert';

import 'package:clima_flutter/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    // location.printLocation();
  }

  void getData() async {
    var url = Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      // print(response.body);
      var temp = jsonDecode(response.body)['main']['temp'];
      var condition = jsonDecode(response.body)['weather'][0]['id'];
      var cityName = jsonDecode(response.body)['name'];
      print(temp);
      print(condition);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
