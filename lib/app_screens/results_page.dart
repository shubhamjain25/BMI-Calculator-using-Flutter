import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_stuff/reusable_buttons.dart';
import 'package:bmi_calculator/reusable_stuff/reusable_card.dart';
import 'package:bmi_calculator/bmi_brain.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiValue, @required this.remark, @required this.result});

  final String bmiValue;
  final String remark;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('BMI Calculator'),
//        backgroundColor: kActiveCardColor,
//      ),
      body: SafeArea(
        child: Column(
            crossAxisAlignment:CrossAxisAlignment.stretch,
            children: <Widget >[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kHeaderTextStyle.copyWith(fontSize: 40.0),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BodyContainer(
              colour: kActiveCardColor,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      result,
                      style: kResultPageTextStyle.copyWith(
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      bmiValue,
                      style: kBMIResultTextStyle,
                    ),
                    Text(remark,
                        style: kResultPageTextStyle,
                        textAlign: TextAlign.center),
                  ]),
            ),
          ),
          BottomButton(
              onBottomButtonTap: () {
                Navigator.pop(context);
              },
              bottomButtonText: 'Re-Calculate')
        ]),
      ),
    );
  }
}
