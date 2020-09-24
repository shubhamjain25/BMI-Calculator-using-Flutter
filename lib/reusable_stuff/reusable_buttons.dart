import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.iconValue, this.buttonPressedByUser});
  final IconData iconValue;
  final Function buttonPressedByUser;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      elevation: 5.0,
      constraints: BoxConstraints.tightFor(
        width: 48.0,
        height: 48.0,
      ),
      fillColor: Color(0xFF4C4F5E),
      onPressed: buttonPressedByUser,
      child:Icon(iconValue),
    );
  }
}

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onBottomButtonTap, @required this.bottomButtonText});

  final Function onBottomButtonTap;
  final String bottomButtonText;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBottomButtonTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          bottomButtonText,
          style: kBottomButtonTextStyle,
        ),
        color: kBottomBarColor,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.all(15.0),
        height: kBottomBarHeight,
      ),
    );
  }
}
