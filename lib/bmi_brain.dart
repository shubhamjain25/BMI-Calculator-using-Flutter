import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({ this.height, this.weight });
  final int height;
  final int weight;

  double _bmi;
  String getBmi(){
    _bmi=weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi<18.5){return 'Underweight';}
    else if(_bmi>=18.5 && _bmi<25){return 'Normal';}
    else if(_bmi>=25 && _bmi<30){return 'Overweight';}
    else{return 'Obese';}
  }

  String getRemark(){
    if(_bmi<18.5){return 'You need to put on some weight';}
    else if(_bmi>=18.5 && _bmi<25){return 'You are doing great';}
    else if(_bmi>=25 && _bmi<30){return 'Start eating more healthy food';}
    else{return 'Work on your diet, and avoid junk food';}
  }
}