import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _wightController = new TextEditingController();

  double _bmiresult;
  String _bmiresultstring = "";
  String _bmicategory = "";

  void _bmiResults() {
    setState(() {
      _bmiresult = calculateBMI(
          _ageController.text, _heightController.text, _wightController.text);

      _bmiresultstring = "Your BMI: ${_bmiresult.toStringAsFixed(1)}";

      if (_bmiresult >= 30) {
        _bmicategory = "Obese";
      } else if (_bmiresult >= 25 && _bmiresult < 29.9) {
        _bmicategory = "Overweight";
      } else if (_bmiresult >= 18.5 && _bmiresult < 24.9) {
        _bmicategory = "Normal";
      } else {
        _bmicategory = "Underweight";
      }
    });
  }

  double calculateBMI(String age, String height, String weight) {
    var bmi = (703.0 * int.parse(weight)) / pow(int.parse(height), 2);
    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI"),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: ListView(
            padding: const EdgeInsets.all(2.3),
            children: <Widget>[
              Image.asset(
                'images/bmilogo.png',
                height: 133.0,
                width: 200.0,
              ),
              Container(
                margin: const EdgeInsets.all(3.0),
                alignment: Alignment.topCenter,
                color: Colors.grey,
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                          labelText: 'Age',
                          hintText: 'In years',
                          icon: Icon(Icons.person_outline)),
                    ),
                    TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                          labelText: 'Height ',
                          hintText: 'In inches',
                          icon: Icon(Icons.insert_chart)),
                    ),
                    TextField(
                      controller: _wightController,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                          labelText: 'Weight',
                          hintText: 'In pounds',
                          icon: Icon(Icons.line_weight)),
                    ),
                    Padding(padding: EdgeInsets.all(10.5)), //add padding
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(6.0),
                          child: RaisedButton(
                            padding:
                                EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                            color: Colors.pinkAccent,
                            onPressed: _bmiResults,
                            child: Text("Calculate",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.9)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      "${_bmiresultstring}",
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontStyle: FontStyle.italic,
                          fontSize: 26.0),
                    ),
                    Text(
                      "${_bmicategory}",
                      style: TextStyle(
                          color: Colors.pink,
                          fontStyle: FontStyle.italic,
                          fontSize: 26.0),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
