import 'package:geolocator/geolocator.dart';

class Location {
  double? _latitude;
  double? _longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          locationSettings:
              const LocationSettings(accuracy: LocationAccuracy.low));
      _latitude = position.latitude;
      _longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  void printLocation() {
    if (_latitude != null && _longitude != null) {
      print('latitude: $_latitude\nlongitude: $_longitude');
    } else {
      print('Unable to fetch location');
    }
  }
}
