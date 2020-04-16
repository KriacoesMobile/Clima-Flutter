import 'package:clima/screens/weather_information.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude;
  double latitude;

  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentPosition();

    latitude = location.latitude;
    longitude = location.longitude;

    String apiURL =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(apiURL);
    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherInformation(weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.cloud,
              size: 80.0,
              color: kPrimaryFontColor,
            ),
            SizedBox(height: 15.0),
            Text(
              'Clima',
              style: kRegularTextStyle.copyWith(
                fontSize: 50.0,
                color: kPrimaryFontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
