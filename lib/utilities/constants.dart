import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFF222831);
const kPrimaryFontColor = Color(0xFFf0f5f9);
const kSecondaryFontColor = Color(0xFFc9d6df);
const kAlertIconColor = Color(0xFFea5455);
const kTryAgainButtonColor = Color(0xFF3ec1d3);

const kRegularTextStyle = TextStyle(
  fontFamily: 'Monserrat',
  fontWeight: FontWeight.w400,
);

const kExtraBoldTextStyle = TextStyle(
  fontFamily: 'Monserrat',
  fontWeight: FontWeight.w800,
);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: kPrimaryFontColor,
  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
  hintMaxLines: 1,
  hintText: 'Enter a city name',
  hintStyle: TextStyle(
    fontFamily: 'Monserrat',
    fontWeight: FontWeight.w400,
    fontSize: 18.0,
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);

const Map monthsList = {
  1: 'January',
  2: 'February',
  3: 'March',
  4: 'April',
  5: 'May',
  6: 'June',
  7: 'July',
  8: 'August',
  9: 'September',
  10: 'October',
  11: 'November',
  12: 'December'
};

const String apiKey = '32452a409b71df9fc4552e7915b13a43';
