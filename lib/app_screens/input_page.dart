import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_stuff/reusable_buttons.dart';
import 'package:bmi_calculator/reusable_stuff/reusable_card.dart';
import 'package:bmi_calculator/reusable_stuff/icon_content.dart';
import 'package:bmi_calculator/bmi_brain.dart';
import 'results_page.dart';


enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = kInactiveCardColor;
  Color femaleColor = kInactiveCardColor;

  GenderType gender;
  int height = 120;
  int weight = 50;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: kActiveCardColor,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: BodyContainer(
                      buttonPressed: () {
                        setState(() {
                          gender = GenderType.male;
                        });
                      },
                      colour: gender == GenderType.male
                          ? (kActiveCardColor)
                          : (kInactiveCardColor),
                      cardChild: IconContent(
                        iconImage: FontAwesomeIcons.mars,
                        iconText: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: BodyContainer(
                      buttonPressed: () {
                        setState(() {
                          gender = GenderType.female;
                        });
                      },
                      colour: gender == GenderType.female
                          ? (kActiveCardColor)
                          : (kInactiveCardColor),
                      cardChild: IconContent(
                        iconImage: FontAwesomeIcons.venus,
                        iconText: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BodyContainer(
                colour: kActiveCardColor,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('HEIGHT', style: kLabelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(), style: kHeaderTextStyle),
                          SizedBox(width: 2.0),
                          Text(
                            'cm',
                            style: kSubTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Color(0xFFFFFFFF),
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                          overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 20.0),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x39EB1555),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: kMinSliderHeight,
                          max: kMaxSliderHeight,
//                        activeColor: Color(0xFFFFFFFF),
//                        inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ]),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: BodyContainer(
                      colour: kActiveCardColor,
                      cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('WEIGHT', style: kLabelTextStyle),
                            Text(weight.toString(), style: kHeaderTextStyle),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    iconValue: FontAwesomeIcons.minus,
                                    buttonPressedByUser: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 6.0),
                                  RoundIconButton(
                                    iconValue: FontAwesomeIcons.plus,
                                    buttonPressedByUser: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  )
                                ]),
                          ]),
                    ),
                  ),
                  Expanded(
                    child: BodyContainer(
                      colour: kActiveCardColor,
                      cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('AGE', style: kLabelTextStyle),
                            Text(age.toString(), style: kHeaderTextStyle),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    iconValue: FontAwesomeIcons.minus,
                                    buttonPressedByUser: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 6.0),
                                  RoundIconButton(
                                    iconValue: FontAwesomeIcons.plus,
                                    buttonPressedByUser: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  )
                                ]),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(onBottomButtonTap: () {
              CalculatorBrain calcBrain = CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiValue: calcBrain.getBmi(),
                    remark: calcBrain.getRemark(),
                    result: calcBrain.getResult(),
                  ),
                ),
              );
            }, bottomButtonText: 'Calculate')
          ],
        ),
      ),
    );
  }
}
