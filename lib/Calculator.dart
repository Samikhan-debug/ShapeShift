import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/Result_Scree.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  bool isMale = true;
  double _heightOfUser = 100.0;
  double _weightOfUser = 40.0;

  double _bmi = 0;

  late BMIModel _bmiModel;

  // Function to create circles with adjustable radius
  Widget _buildCircleAvatar(double radius) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.blue,
      // You can add images using backgroundImage property
      backgroundImage: NetworkImage('assets/male.png'),
    );
  }

  Widget _buildCircleAvatar1(double radius) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.blue,
      // You can add images using backgroundImage property
      backgroundImage: NetworkImage('assets/female.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFF1C2757),
          width: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 8,
              ),
              Text(
                "BMI Calculator",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 34,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "We care about your health",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCircleAvatar(80.0),
                  SizedBox(
                    width: 20,
                  ), // First Circle

                  _buildCircleAvatar1(80.0), // Second Circle
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoSegmentedControl(
                      groupValue: isMale,
                      selectedColor: Colors.blue,
                      unselectedColor: Colors.white,
                      borderColor: Colors.blue,
                      children: const {
                        true: Text(" Male ", style: TextStyle(fontSize: 30)),
                        false: Text(" Female ", style: TextStyle(fontSize: 30))
                      },
                      onValueChanged: (isMaleVal) {
                        setState(() {
                          isMale = isMaleVal;
                        });
                      },
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
              Text(
                "Height (cm)",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                // Wrap the Slider in a Column to make it vertical
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: Slider(
                        min: 80.0,
                        max: 250.0,
                        onChanged: (height) {
                          setState(() {
                            _heightOfUser = height;
                          });
                        },
                        value: _heightOfUser,
                        divisions: 170,
                        activeColor: Colors.blue,
                        label: "$_heightOfUser",
                      ),
                    ),
                    Text(
                      "$_heightOfUser cm",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Weight (kg)",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 30.0,
                  max: 120.0,
                  onChanged: (height) {
                    setState(() {
                      _weightOfUser = height;
                    });
                  },
                  value: _weightOfUser,
                  divisions: 100,
                  activeColor: Colors.blue,
                  label: "$_weightOfUser",
                ),
              ),
              Text(
                "$_weightOfUser kg",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _bmi = _weightOfUser /
                          ((_heightOfUser / 100) * (_heightOfUser / 100));

                      if (_bmi >= 18.5 && _bmi <= 25) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: true,
                            comments: "You are Totaly Fit");
                      } else if (_bmi < 18.5) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "You are Underweighted");
                      } else if (_bmi > 25 && _bmi <= 30) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "You are Overweighted");
                      } else {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "You are Obesed");
                      }
                    });
                    GestureDetector(
                      onTap: () {
                        // Navigate to the RegistrationScreen when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                    bmiModel: _bmiModel,
                                  )),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.yellow,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(
                                  bmiModel: _bmiModel,
                                )));
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "CALCULATE",
                    style: TextStyle(
                      fontSize: 20, // Increase the font size here
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BMIModel {
  double bmi;
  bool isNormal;

  String comments;

  BMIModel({required this.bmi, required this.isNormal, required this.comments});
}
