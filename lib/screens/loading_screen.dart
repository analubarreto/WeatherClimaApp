import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

Location location = Location();
class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    location.getCurrentLocation();
  }

  void getLocationData() async {
    String apiKey = '225d07419871505f5c2fb80c4655304f';
    double latitude = location.latitude;
    double logitude = location.logitude;
    
    NetworkHelper networkHelper = NetworkHelper(url: 'api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$logitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      ),
    );
  }
}
