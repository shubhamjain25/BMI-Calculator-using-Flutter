import 'package:flutter/material.dart';

class BodyContainer extends StatelessWidget {
  BodyContainer({@required this.colour, this.cardChild, this.buttonPressed});

  final Color colour;
  final Widget cardChild;
  final Function buttonPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonPressed,
      child: Container(
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: cardChild),
    );
  }
}




