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
  String feelsLike;
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
        feelsLike = weatherData['main']['feels_like'].toString();
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
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
                        var weatherData = WeatherData().getLocationData();
                        updateData(weatherData);
                      }),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${temperature.round()}º',
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
                        'Feels like $feelsLikeº',
                        style: kRegularTextStyle.copyWith(
                          fontSize: 20.0,
                          color: kSecondaryFontColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Another location?',
                      style: kRegularTextStyle.copyWith(
                        fontSize: 20.0,
                        color: kPrimaryFontColor,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: TextField(
                                textCapitalization:
                                    TextCapitalization.sentences,
                                enableSuggestions: true,
                                enableInteractiveSelection: true,
                                textAlign: TextAlign.center,
                                showCursor: false,
                                style: kRegularTextStyle.copyWith(
                                    fontSize: 18.0, color: kBackgroundColor),
                                decoration: kTextFieldDecoration,
                                onChanged: (input) {
                                  if (input != null && input != '') {
                                    userInput = input;
                                    print(userInput);
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 15.0),
                          Expanded(
                            flex: 1,
                            child: RaisedButton(
                                color: kPrimaryFontColor,
                                child: Icon(
                                  FontAwesomeIcons.search,
                                  size: 25.0,
                                  color: kBackgroundColor,
                                ),
                                elevation: 0.0,
                                onPressed: () {
                                  var weatherData =
                                      WeatherData().getLocationData();
                                  updateData(weatherData);
                                }),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
