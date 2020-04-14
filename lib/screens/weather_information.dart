import 'package:clima/utilities/constants.dart';
import 'package:clima/widgets/refresh_button.dart';
import 'package:flutter/material.dart';

class WeatherInformation extends StatefulWidget {
  @override
  _WeatherInformationState createState() => _WeatherInformationState();
}

class _WeatherInformationState extends State<WeatherInformation> {
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
                flex: 1,
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Jan 13, 2019',
                            style: kRegularTextStyle.copyWith(
                                fontSize: 20.0, color: kSecondaryFontColor),
                          ),
                          SizedBox(height: 6.0),
                          Text(
                            'New York, NY',
                            style: kExtraBoldTextStyle.copyWith(
                                fontSize: 20.0, color: kPrimaryFontColor),
                          ),
                        ],
                      ),
                      RefreshButton(),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('74º',
                          style: kExtraBoldTextStyle.copyWith(
                              fontSize: 80.0, color: kPrimaryFontColor)),
                      Text('Heavy rain',
                          style: kRegularTextStyle.copyWith(
                              fontSize: 45.0, color: kPrimaryFontColor)),
                      SizedBox(height: 15.0),
                      Text(
                        'Feels like 69º',
                        style: kRegularTextStyle.copyWith(
                            fontSize: 20.0, color: kSecondaryFontColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
