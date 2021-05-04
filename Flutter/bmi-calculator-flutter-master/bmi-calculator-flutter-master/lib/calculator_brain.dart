import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({this.height,this.weight});

  final int height;
  final int weight;

  double _bmi=0.0;

  String calculateBMI(){
    _bmi= weight/ pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'OverWeight';
    }
    else if(_bmi >= 18.5){
      return 'Normal';
    }
    else{
      return 'UnderWeight';
    }
  }

  String getInterpretation (){
    if(_bmi>=25){
      return 'You have an higher than normal body weight, you should exercise more';
    }
    else if(_bmi>=18.5){
      return 'You have a normal body weight, Good Job';
    }
    else{
      return 'You have an lower than normal body weight, you should eat a bit more';
    }
  }
  }
