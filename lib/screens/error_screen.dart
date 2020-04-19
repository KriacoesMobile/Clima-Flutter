import 'package:clima/services/weather_data.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'weather_information.dart';

class ErrorScreen extends StatefulWidget {
  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.exclamationTriangle,
              size: 100.0,
              color: kAlertIconColor,
            ),
            SizedBox(height: 40.0),
            Text(
              'Error while fetching data',
              style: kRegularTextStyle.copyWith(
                fontSize: 30.0,
                color: kPrimaryFontColor,
              ),
            ),
            SizedBox(height: 40.0),
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  'Try again',
                  style: kRegularTextStyle.copyWith(
                    fontSize: 25.0,
                    color: kPrimaryFontColor,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                elevation: 0.0,
                color: kTryAgainButtonColor,
                onPressed: () async {
                  var weatherData = await WeatherData().getLocationData();

                  if (weatherData != null) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return WeatherInformation(weatherData: weatherData);
                    }));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
