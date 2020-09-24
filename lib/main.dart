import 'package:flutter/material.dart';
import 'app_screens/input_page.dart';
import 'app_screens/results_page.dart';
import 'bmi_brain.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      title: "BMI Calculator",
      home: InputPage(),
//      initialRoute: '/inputPage',
//      routes: {
//        '/inputPage' : (context) => InputPage(),
//        '/resultPage' : (context) => ResultsPage(),
//      },
    );
  }
}


