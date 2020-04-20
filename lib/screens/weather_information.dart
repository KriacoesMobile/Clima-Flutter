import 'package:clima/screens/error_screen.dart';
import 'package:clima/services/weather_data.dart';
import 'package:clima/utilities/capitalize.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/utilities/current_time.dart';
import 'package:clima/widgets/refresh_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherInformation extends StatefulWidget {
  WeatherInformation({this.weatherData});

  final weatherData;

  @override
  _WeatherInformationState createState() => _WeatherInformationState();
}

class _WeatherInformationState extends State<WeatherInformation> {
  double temperature;
  double feelsLike;
  String cityName;
  String description;
  String userInput;

  @override
  void initState() {
    super.initState();
    updateData(widget.weatherData);
  }

  void updateData(var weatherData) {
    if (weatherData != null) {
      setState(() {
        temperature = weatherData['main']['temp'];
        cityName = weatherData['name'];
        feelsLike = weatherData['main']['feels_like'];
        description = weatherData['weather'][0]['description'];
      });
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ErrorScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: Container(
                            child: TextField(
                              textCapitalization: TextCapitalization.sentences,
                              enableSuggestions: true,
                              enableInteractiveSelection: true,
                              textAlign: TextAlign.start,
                              showCursor: false,
                              style: kRegularTextStyle.copyWith(
                                  fontSize: 18.0, color: kBackgroundColor),
                              decoration: kTextFieldDecoration,
                              onChanged: (input) {
                                if (input != null && input != '') {
                                  userInput = input;
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              color: kPrimaryFontColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Icon(FontAwesomeIcons.search,
                                  size: 25.0, color: kBackgroundColor),
                              elevation: 0.0,
                              onPressed: () async {
                                var weatherData =
                                    await WeatherData().getCityData(userInput);
                                updateData(weatherData);
                              }),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          getCurrentDateTime(),
                          style: kRegularTextStyle.copyWith(
                            fontSize: 20.0,
                            color: kSecondaryFontColor,
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          cityName,
                          style: kExtraBoldTextStyle.copyWith(
                            fontSize: 20.0,
                            color: kPrimaryFontColor,
                          ),
                        ),
                      ],
                    ),
                    RefreshButton(onPress: () async {
                      var weatherData = await WeatherData().getLocationData();
                      updateData(weatherData);
                    }),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${temperature.roundToDouble().round()}º',
                      style: kExtraBoldTextStyle.copyWith(
                        fontSize: 80.0,
                        color: kPrimaryFontColor,
                      ),
                    ),
                    Text(
                      capitalize(description),
                      style: kRegularTextStyle.copyWith(
                        fontSize: 45.0,
                        color: kPrimaryFontColor,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'Feels like ${feelsLike.roundToDouble().round()}º',
                      style: kRegularTextStyle.copyWith(
                        fontSize: 20.0,
                        color: kSecondaryFontColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
