import 'package:clima/services/location.dart';
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

    Location location = Location();
    location.getCurrentPosition();

    print(location.latitude);
    print(location.longitude);
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
