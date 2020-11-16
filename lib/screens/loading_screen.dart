import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    
    NetworkHelper networkHelper = NetworkHelper(url: 'api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.logitude}&appid=$apiKey');

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));

    print(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 100.0
        )
      ),
    );
  }
}
