import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final String iconText;
  final IconData iconImage;

  IconContent({@required this.iconText, @required this.iconImage});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconImage,
            size: 80.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            iconText,
            style: kLabelTextStyle,
          ),
        ]);
  }
}

