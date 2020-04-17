import 'package:clima/screens/weather_information.dart';
import 'package:clima/services/weather_data.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  void getWeatherData() async {
    var weatherData = await WeatherData().getLocationData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherInformation(weatherData: weatherData);
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
              FontAwesomeIcons.cloudMoon,
              size: 100.0,
              color: kPrimaryFontColor,
            ),
            SizedBox(height: 25.0),
            Text(
              'Clima',
              style: kRegularTextStyle.copyWith(
                fontSize: 60.0,
                color: kPrimaryFontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
