import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class Category_Page extends StatefulWidget {
  final String? title;
  final String? image;
  final String? tag;

  const Category_Page({Key? key, this.title, this.image, this.tag})
      : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<Category_Page> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  DateTime? selectDate;
  String? selectHeight;
  String? selectWeight;
  bool isMale = true;

  double calculateBMI(String weight, String height) {
    double weightInKg =
        double.tryParse(weight.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
    double heightInCm = double.tryParse(height) ?? 0.0;

    double heightInMeters = heightInCm / 100;

    return weightInKg / (heightInMeters * heightInMeters);
  }

  String getBMIStatus() {
    if (selectWeight != null) {
      return determineBMICategory(selectWeight! as double);
    }
    return 'Select weight first';
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: widget.tag!,
              child: Material(
                child: Container(
                  height: 360,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.image!), fit: BoxFit.cover)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.1),
                        ])),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                FadeInUp(
                                    duration: Duration(milliseconds: 1200),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    )),
                                FadeInUp(
                                    duration: Duration(milliseconds: 1200),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    )),
                                FadeInUp(
                                    duration: Duration(milliseconds: 1300),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    )),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        FadeInUp(
                            duration: Duration(milliseconds: 1200),
                            child: Text(
                              widget.title!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Color(0xFF8A2387),
                      Color(0xFFE94057),
                      Color(0xFFF27121)
                    ])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 1200,
                      width: 525,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'BMI Calculator',
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Take Care of your health',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Column(
                              children: [
                                SizedBox(height: media.width * 0.05),
                                Divider(color: Color(0xFFF27121), height: 1),
                                Divider(color: Color(0xFFF27121), height: 1),
                                SelectPicker(
                                  allVal: const [
                                    "2",
                                    "3",
                                    "4",
                                    "5",
                                    "6",
                                    "7",
                                    "8",
                                    "9",
                                    "10",
                                    "11",
                                    "12",
                                    "13",
                                    "14",
                                    "15",
                                    "16",
                                    "17",
                                    "18",
                                    "19",
                                    "20",
                                    "21",
                                    "22",
                                    "23",
                                    "24",
                                    "25",
                                    "26",
                                    "27",
                                    "28",
                                    "29",
                                    "30",
                                    "31",
                                    "32",
                                    "33",
                                    "34",
                                    "35",
                                    "36",
                                    "37",
                                    "38",
                                    "39",
                                    "40",
                                    "41",
                                    "42",
                                    "43",
                                    "44",
                                    "45",
                                    "46",
                                    "47",
                                    "48",
                                    "49",
                                    "50",
                                    "51",
                                    "52",
                                    "53",
                                    "54",
                                    "55",
                                    "56",
                                    "57",
                                    "58",
                                    "59",
                                    "60",
                                    "61",
                                    "62",
                                    "63",
                                    "64",
                                    "65",
                                    "66",
                                    "67",
                                    "68",
                                    "69",
                                    "70",
                                    "71",
                                    "72",
                                    "73",
                                    "74",
                                    "75",
                                    "76",
                                    "77",
                                    "78",
                                    "79",
                                    "80",
                                    "81",
                                    "82",
                                    "83",
                                    "84",
                                    "85",
                                    "86",
                                    "87",
                                    "88",
                                    "89",
                                    "90",
                                    "91",
                                    "92",
                                    "93",
                                    "94",
                                    "95",
                                    "96",
                                    "97",
                                    "98",
                                    "99",
                                    "100",
                                    "101",
                                    "102",
                                    "103",
                                    "104",
                                    "105",
                                    "106",
                                    "107",
                                    "108",
                                    "109",
                                    "110",
                                    "111",
                                    "112",
                                    "113",
                                    "114",
                                    "115",
                                    "116",
                                    "117",
                                    "118",
                                    "119",
                                    "120"
                                  ],
                                  selectVal: selectHeight,
                                  title: "Age",
                                  didChange: (newVal) {
                                    setState(() {
                                      selectHeight = newVal;
                                    });
                                  },
                                ),
                                Divider(color: Color(0xFFF27121), height: 1),
                                SelectPicker(
                                  allVal: const [
                                    "140",
                                    "141",
                                    "142",
                                    "143",
                                    "144",
                                    "145",
                                    "146",
                                    "147",
                                    "148",
                                    "149",
                                    "150",
                                    "151",
                                    "152",
                                    "153",
                                    "154",
                                    "155",
                                    "156",
                                    "157",
                                    "158",
                                    "159",
                                    "160",
                                    "161",
                                    "162",
                                    "163",
                                    "164",
                                    "165",
                                    "166",
                                    "167",
                                    "168",
                                    "169",
                                    "170",
                                    "171",
                                    "172",
                                    "173",
                                    "174",
                                    "175",
                                    "176",
                                    "177",
                                    "178",
                                    "179",
                                    "180",
                                    "181",
                                    "182",
                                    "183",
                                    "184",
                                    "185",
                                    "186",
                                    "187",
                                    "188",
                                    "189",
                                    "190",
                                    "191",
                                    "192",
                                    "193",
                                    "194",
                                    "195",
                                    "196",
                                    "197",
                                    "198",
                                    "199",
                                    "200",
                                    "201",
                                    "202",
                                    "203",
                                    "204",
                                    "205",
                                    "206",
                                    "207",
                                    "208",
                                    "209",
                                    "210",
                                    "211",
                                    "212",
                                    "213",
                                    "214",
                                    "215"
                                  ],
                                  selectVal: selectHeight,
                                  title: "Height",
                                  didChange: (newVal) {
                                    setState(() {
                                      selectHeight = newVal;
                                    });
                                  },
                                ),
                                Divider(color: Color(0xFFF27121), height: 1),
                                SelectPicker(
                                  allVal: const [
                                    "40kg",
                                    "41kg",
                                    "42kg",
                                    "43kg",
                                    "44kg",
                                    "45kg",
                                    "46kg",
                                    "47kg",
                                    "48kg",
                                    "49kg",
                                    "50kg",
                                    "51kg",
                                    "52kg",
                                    "53kg",
                                    "54kg",
                                    "55kg",
                                    "56kg",
                                    "57kg",
                                    "58kg",
                                    "59kg",
                                    "60kg",
                                    "61kg",
                                    "62kg",
                                    "63kg",
                                    "64kg",
                                    "65kg",
                                    "66kg",
                                    "67kg",
                                    "68kg",
                                    "69kg",
                                    "70kg",
                                    "71kg",
                                    "72kg",
                                    "73kg",
                                    "74kg",
                                    "75kg",
                                    "76kg",
                                    "77kg",
                                    "78kg",
                                    "79kg",
                                    "80kg",
                                    "81kg",
                                    "82kg",
                                    "83kg",
                                    "84kg",
                                    "85kg",
                                    "86kg",
                                    "87kg",
                                    "88kg",
                                    "89kg",
                                    "90kg",
                                    "91kg",
                                    "92kg",
                                    "93kg",
                                    "94kg",
                                    "95kg",
                                    "96kg",
                                    "97kg",
                                    "98kg",
                                    "99kg",
                                    "100kg",
                                    "101kg",
                                    "102kg",
                                    "103kg",
                                    "104kg",
                                    "105kg",
                                    "106kg",
                                    "107kg",
                                    "108kg",
                                    "109kg",
                                    "110kg",
                                    "111kg",
                                    "112kg",
                                    "113kg",
                                    "114kg",
                                    "115kg",
                                    "116kg",
                                    "117kg",
                                    "118kg",
                                    "119kg",
                                    "120kg"
                                  ],
                                  selectVal: selectWeight,
                                  title: "Weight",
                                  didChange: (newVal) {
                                    setState(() {
                                      selectWeight = newVal;
                                    });
                                  },
                                ),
                                Divider(color: Color(0xFFF27121), height: 1),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: media.width * 0.05),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Gender",
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 54, 44, 37),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      CupertinoSegmentedControl(
                                        groupValue: isMale,
                                        selectedColor: Color(0xFFF27121),
                                        unselectedColor: Colors.white,
                                        borderColor: Color(0xFFF27121),
                                        children: const {
                                          true: Text(" Male ",
                                              style: TextStyle(fontSize: 18)),
                                          false: Text(" Female ",
                                              style: TextStyle(fontSize: 18))
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
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'BMI Category: ${getBMIStatus()}',
                            style: TextStyle(
                              color: Color(0xFFF27121),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (selectWeight != null &&
                                  selectHeight != null) {
                                double weight = double.tryParse(selectWeight!
                                        .replaceAll(RegExp(r'[^0-9.]'), '')) ??
                                    0.0;
                                double height = double.tryParse(selectHeight!
                                        .replaceAll(RegExp(r'[^0-9.]'), '')) ??
                                    0.0;

                                double bmi = calculateBMI(
                                    weight.toString(), height.toString());
                                String bmiCategory = determineBMICategory(bmi);

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('BMI Result'),
                                      content: Text(
                                          'Your BMI: $bmi\nCategory: $bmiCategory'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Error'),
                                      content: Text(
                                          'Please select weight and height.'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFF8A2387),
                                    Color(0xFFE94057),
                                    Color(0xFFF27121),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  'Calculate BMI',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectDateTime extends StatelessWidget {
  final DateTime? selectDate;
  final String title;
  final Function(DateTime) didChange;

  const SelectDateTime(
      {super.key,
      required this.title,
      required this.didChange,
      this.selectDate});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return InkWell(
      onTap: () {
        showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return Container(
                height: 250,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Done",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 54, 44, 37),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      child: CupertinoDatePicker(
                          initialDateTime: selectDate,
                          dateOrder: DatePickerDateOrder.ymd,
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: didChange),
                    )
                  ],
                ),
              );
            });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: media.width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Color.fromARGB(255, 54, 44, 37),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}

class SelectPicker extends StatelessWidget {
  final String? selectVal;
  final String title;
  final List allVal;
  final Function(String) didChange;
  const SelectPicker(
      {super.key,
      required this.title,
      required this.allVal,
      required this.didChange,
      this.selectVal});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return InkWell(
      onTap: () {
        showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return Container(
                height: 250,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Done",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 54, 44, 37),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ))
                      ],
                    ),
                    SizedBox(
                        height: 200,
                        child: CupertinoPicker(
                            onSelectedItemChanged: (index) {
                              didChange(allVal[index]);
                            },
                            itemExtent: 40,
                            magnification: 1.2,
                            children: allVal.map((itemObj) {
                              return Text(
                                itemObj.toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 54, 44, 37),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              );
                            }).toList())),
                  ],
                ),
              );
            });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: media.width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Color.fromARGB(255, 54, 44, 37),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              selectVal ?? "Select",
              style: TextStyle(color: Color(0xFFF27121), fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

extension ExtendDateTime on DateTime {
  String stringFormat({String format = "yyyy-MM-dd"}) {
    return DateFormat(format).format(this);
  }
}

double calculateBMI(String weight, String height) {
  double weightInKg =
      double.tryParse(weight.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
  double heightInCm = double.tryParse(height) ?? 0.0;

  double heightInMeters = heightInCm / 100;

  return weightInKg / (heightInMeters * heightInMeters);
}

String determineBMICategory(double bmi) {
  if (bmi < 16) {
    return 'Severe Thinness';
  } else if (bmi >= 16 && bmi < 17) {
    return 'Moderate Thinness';
  } else if (bmi >= 17 && bmi < 18.5) {
    return 'Mild Thinness';
  } else if (bmi >= 18.5 && bmi < 25) {
    return 'Normal';
  } else if (bmi >= 25 && bmi < 30) {
    return 'Overweight';
  } else if (bmi >= 30 && bmi < 35) {
    return 'Obese Class I';
  } else if (bmi >= 35 && bmi < 40) {
    return 'Obese Class II';
  } else {
    return 'Obese Class III';
  }
}
