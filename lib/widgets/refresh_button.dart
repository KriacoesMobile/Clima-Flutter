import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RefreshButton extends StatelessWidget {
  RefreshButton({this.onPress});
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        FontAwesomeIcons.locationArrow,
        size: 35.0,
        color: kPrimaryFontColor,
      ),
      onTap: onPress,
    );
  }
}
