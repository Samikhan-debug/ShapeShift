import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;

  ResultScreen({this.bmiModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 200,
            width: 200,
            child: bmiModel.isNormal
                ? SvgPicture.asset(
                    "assets/happy.svg",
                    fit: BoxFit.contain,
                  )
                : SvgPicture.asset(
                    "assets/sad.svg",
                    fit: BoxFit.contain,
                  ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Your BMI is ${bmiModel.bmi.round()}",
            style: TextStyle(
                color: Colors.blue, fontSize: 34, fontWeight: FontWeight.w700),
          ),
          Text(
            "${bmiModel.comments}",
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 16,
          ),
          bmiModel.isNormal
              ? Text(
                  "Hurray! Your BMI is Normal.",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                )
              : Text(
                  "Sadly! Your BMI is not Normal.",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
          SizedBox(
            height: 16,
          ),
          BmiGauge(bmiValue: bmiModel.bmi),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 16, right: 16),
            child: TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.blue,
              ),
              label: Text(
                "LET CALCULATE AGAIN",
                style: TextStyle(
                  fontSize: 20, // Increase the font size here
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class BmiGauge extends StatefulWidget {
  final double bmiValue;
  const BmiGauge({Key? key, required this.bmiValue}) : super(key: key);
  @override
  State<BmiGauge> createState() => _BmiGaugeState();
}

class _BmiGaugeState extends State<BmiGauge> {
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      animationDuration: 3500,
      enableLoadingAnimation: true,
      axes: <RadialAxis>[
        RadialAxis(
            startAngle: 130,
            endAngle: 50,
            minimum: 10,
            maximum: 45,
            interval: 6,
            minorTicksPerInterval: 10,
            showAxisLine: false,
            radiusFactor: 0.93,
            labelOffset: 2,
            ranges: <GaugeRange>[
              GaugeRange(
                  startValue: 10,
                  endValue: 14,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: Colors.red),
              GaugeRange(
                  startValue: 14,
                  endValue: 18.5,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: const Color.fromRGBO(238, 79, 34, 0.65)),
              GaugeRange(
                  startValue: 18.5,
                  endValue: 25.0,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: const Color.fromRGBO(123, 199, 34, 0.75)),
              GaugeRange(
                  startValue: 25.0,
                  endValue: 30.0,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: const Color.fromRGBO(238, 193, 34, 0.75)),
              GaugeRange(
                  startValue: 30.0,
                  endValue: 45.0,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: Color.fromARGB(163, 214, 123, 98)),
              GaugeRange(
                  startValue: 35.0,
                  endValue: 40.0,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: const Color.fromRGBO(238, 79, 34, 0.65)),
              GaugeRange(
                  startValue: 40.0,
                  endValue: 45.0,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: Colors.red),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  angle: 90,
                  positionFactor: .8,
                  widget: Text(
                    widget.bmiValue.toStringAsFixed(2),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.pink),
                  ))
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                value: widget.bmiValue,
                needleLength: 0.6,
                lengthUnit: GaugeSizeUnit.factor,
                needleStartWidth: 1,
                needleEndWidth: 8,
                animationType: AnimationType.elasticOut,
                enableAnimation: true,
                animationDuration: 1200,
                knobStyle: const KnobStyle(
                    knobRadius: 0.09,
                    sizeUnit: GaugeSizeUnit.factor,
                    borderColor: Color(0xFFF8B195),
                    color: Colors.white,
                    borderWidth: 0.05),
                tailStyle: const TailStyle(
                    color: Color(0xFFF8B195),
                    width: 8,
                    lengthUnit: GaugeSizeUnit.factor,
                    length: 0.2),
                needleColor: const Color(0xFFF8B195),
              )
            ],
            axisLabelStyle: const GaugeTextStyle(fontSize: 10),
            majorTickStyle: const MajorTickStyle(
                length: 0.25, lengthUnit: GaugeSizeUnit.factor, thickness: 1.5),
            minorTickStyle: const MinorTickStyle(
                length: 0.13, lengthUnit: GaugeSizeUnit.factor, thickness: 1))
      ],
    );
  }
}
