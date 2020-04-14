import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RefreshButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        FontAwesomeIcons.syncAlt,
        size: 30.0,
        color: kPrimaryFontColor,
      ),
      onTap: () {
        print('refresh');
      },
    );
  }
}
