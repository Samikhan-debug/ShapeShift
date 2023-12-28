import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shop_Page.dart';
import 'package:flutter_application_1/login_form.dart';
import 'package:flutter_application_1/model/UserModel.dart';
import 'package:flutter_application_1/services/DatabaseService.dart';
import 'package:flutter_application_1/signUp.dart';

import 'package:intl/intl.dart';

class Step1View extends StatefulWidget {
  const Step1View({super.key});

  @override
  State<Step1View> createState() => _Step1ViewState();
}

class _Step1ViewState extends State<Step1View> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Step 1 of 3",
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Image.asset(
                "assets/5.jpg",
                width: media.width * 0.8,
                height: media.width * 0.8,
                fit: BoxFit.contain,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  "Welcome to\nShapeShift Application",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 54, 44, 37),
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Text(
                "Personalized workouts will help you\ngain strength, get in better shape and\nembrace a healthy lifestyle",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              //   const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [1, 2, 3].map((pObj) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: 1 == pObj
                            ? Colors.blue
                            : Color.fromARGB(255, 54, 44, 37),
                        borderRadius: BorderRadius.circular(6)),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the RegistrationScreen when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Step2View(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Step2View extends StatefulWidget {
  const Step2View({super.key});

  @override
  State<Step2View> createState() => _Step2ViewState();
}

class _Step2ViewState extends State<Step2View> {
  var selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/back.png",
                width: 25,
                height: 25,
              )),
          title: Text(
            "Step 2 of 3",
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Select your fitness level",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 54, 44, 37),
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FitnessLevelSelector(
                title: "Beginner",
                subtitle: "Start your fitness journey fresh!",
                isSelect: selectIndex == 0,
                onPressed: () {
                  setState(() {
                    selectIndex = 0;
                  });
                },
              ),
              SizedBox(
                height: 05,
              ),
              FitnessLevelSelector(
                title: "Intermediate",
                subtitle: "Keep pushing forward in your fitness routine!",
                isSelect: selectIndex == 1,
                onPressed: () {
                  setState(() {
                    selectIndex = 1;
                  });
                },
              ),
              SizedBox(
                height: 05,
              ),
              FitnessLevelSelector(
                title: "Advanced",
                subtitle: "Ready for an intense workout plan?",
                isSelect: selectIndex == 2,
                onPressed: () {
                  setState(() {
                    selectIndex = 2;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [1, 2, 3].map((pObj) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: 2 == pObj
                            ? Colors.blue
                            : Color.fromARGB(255, 54, 44, 37),
                        borderRadius: BorderRadius.circular(6)),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the RegistrationScreen when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Step3View(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class FitnessLevelSelector extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  final bool isSelect;

  const FitnessLevelSelector(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isSelect,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 54, 44, 37),
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          InkWell(
            onTap: onPressed,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 15,
                  top: media.width * 0.05,
                  bottom: media.width * 0.05),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      subtitle,
                      style: TextStyle(
                          color: isSelect
                              ? Colors.blue
                              : Color.fromARGB(255, 54, 44, 37),
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  if (isSelect)
                    Image.asset(
                      "assets/tick1.png",
                      width: 50,
                      height: 50,
                    )
                ],
              ),
            ),
          ),
          Divider(color: Colors.blue, height: 1),
          SizedBox(height: media.width * 0.05),
        ],
      ),
    );
  }
}

class Step3View extends StatefulWidget {
  const Step3View({super.key});

  @override
  State<Step3View> createState() => _Step3ViewState();
}

class _Step3ViewState extends State<Step3View> {
  DatabaseService _databaseService = DatabaseService();
  DateTime? selectDate;
  String? selectHeight;
  String? selectWeight;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/back.png",
                width: 25,
                height: 25,
              )),
          title: Text(
            "Step 3 of 3",
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Personal Details",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 54, 44, 37),
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Let us know about you to speed up the result, Get fit with your personal workout plan!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 54, 44, 37), fontSize: 16),
                ),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    SizedBox(height: media.width * 0.05),
                    Divider(color: Colors.blue, height: 1),
                    SelectDateTime(
                      title: "Birthday",
                      didChange: (newDate) {
                        setState(() {
                          selectDate = newDate;
                        });
                      },
                      selectDate: selectDate,
                    ),
                    Divider(color: Colors.blue, height: 1),
                    SizedBox(
                      height: 05,
                    ),
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
                    Divider(color: Colors.blue, height: 1),
                    SizedBox(
                      height: 05,
                    ),
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
                    Divider(color: Colors.blue, height: 1),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: media.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Gender",
                            style: TextStyle(
                                color: Color.fromARGB(255, 54, 44, 37),
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          CupertinoSegmentedControl(
                            groupValue: isMale,
                            selectedColor: Colors.blue,
                            unselectedColor: Colors.white,
                            borderColor: Colors.blue,
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [1, 2, 3].map((pObj) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: 3 == pObj
                            ? Colors.blue
                            : Color.fromARGB(255, 54, 44, 37),
                        borderRadius: BorderRadius.circular(6)),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  if (selectDate == null ||
                      selectHeight == null ||
                      selectWeight == null ||
                      nameController.text.isEmpty) {
                    // Display a message if any field is empty
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Missing Information'),
                          content: Text('Please fill in all fields.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    String? gender;
                    if (isMale == true) {
                      gender = 'Male';
                    } else {
                      gender = 'Female';
                    }

                    String weight = selectWeight!;
                    int? parsedInt;
                    // Regular expression to match integers in the string
                    RegExp regExp = RegExp(r'\d+');
                    // Find the first match in the string
                    Match? match = regExp.firstMatch(weight);

                    if (match != null) {
                      // Extract the matched substring (containing only integers)
                      String result = match.group(0)!;
                      parsedInt = int.parse(result);
                      print(parsedInt); // Output: 43
                    }

                    UserModelDB userInfoDB = UserModelDB(
                      userID: userID,
                      name: nameController.text,
                      height: int.parse(selectHeight!),
                      weight: parsedInt!,
                      gender: gender,
                    );
                    _databaseService.addUserInfo(userInfoDB);

                    // Navigate to the RegistrationScreen when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Shop_Page(),
                      ),
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
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
            Text(
              selectDate == null
                  ? "Select Date"
                  : selectDate!.stringFormat(format: "MMM dd, yyyy"),
              style: const TextStyle(color: Colors.blue, fontSize: 18),
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
              style: TextStyle(color: Colors.blue, fontSize: 18),
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
