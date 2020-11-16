import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double logitude;

  Location({this.latitude, this.logitude});

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      this.latitude = position.latitude;
      this.logitude = position.longitude;
      print('The latitude is: ${this.latitude} and the logitude is: ${this.logitude}');
    } catch (err) {
      print(err);
    }
  }
}