import 'package:flutter/material.dart';

class WorkoutDetailView extends StatefulWidget {
  final Map dObj;
  const WorkoutDetailView({super.key, required this.dObj});

  @override
  State<WorkoutDetailView> createState() => _WorkoutDetailViewState();
}

class _WorkoutDetailViewState extends State<WorkoutDetailView> {
  List<String> exercisesList = [
    "Push-ups",
    "Squats",
    "Plank",
    "Jumping Jacks",
    "Lunges",
    "SitUps",
    "Weightlift",
    "Pull Ups",
    "DeadLift",
    "Side Crunch",
  ];

  Map<String, String> exerciseImages = {
    "Push-ups": "assets/65.jpg",
    "Squats": "assets/66.jpg",
    "Plank": "assets/64.jpg",
    "Jumping Jacks": "assets/67.jpg",
    "Lunges": "assets/68.jpg",
    "SitUps": "assets/69.png",
    "Weightlift": "assets/70.jpg",
    "Pull Ups": "assets/pullups.png",
    "DeadLift": "assets/deadlift.jpg",
    "Side Crunch": "assets/71.jpg",
  };

  List latestArr = [];

  List youArr = [
    {"image": "assets/60.png", "title": "Barbell"},
    {"image": "assets/61.jpg", "title": "Skipping Rope"},
    {"image": "assets/62.jpg", "title": "Dumbbells"},
    {"image": "assets/63.jpg", "title": "Exercise Mat"},
  ];
  Map<String, bool> exerciseCompletion = {};

  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: TColor.primaryG)),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: TColor.lightGray,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    "assets/48.png",
                    width: 15,
                    height: 15,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leadingWidth: 0,
              leading: Container(),
              expandedHeight: media.width * 0.5,
              flexibleSpace: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/47.png",
                  width: media.width * 0.75,
                  height: media.width * 0.8,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ];
        },
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: const Color(0xFF1C2757),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Full Body Workout",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "10 Exercises | 40 mins | 320 Calories Burn",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      SizedBox(
                        height: media.width * 0.02,
                      ),
                      IconTitleNextRow(
                        icon: "assets/49.png",
                        title: "Difficulity",
                        time: "Beginner",
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "You'll Need",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Container(
                        width: double
                            .infinity, // Use MediaQuery.of(context).size.width for the full width
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: youArr.map((yObj) {
                              return Container(
                                margin: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: media.width * 0.35,
                                      width: media.width * 0.35,
                                      decoration: BoxDecoration(
                                        color: TColor.lightGray,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        yObj["image"].toString(),
                                        width: media.width * 0.2,
                                        height: media.width * 0.2,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        yObj["title"].toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Exercises",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Color(0xFF323F68),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: exercisesList.length,
                          itemBuilder: (context, index) {
                            String exercise = exercisesList[index];
                            String imagePath = exerciseImages[exercise] ?? '';

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: TColor.lightGray,
                                      // Replace with your color
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      imagePath,
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          exercise,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "Total Sets: 3", // Replace with actual total sets
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        exerciseCompletion[exercise] =
                                            !(exerciseCompletion[exercise] ??
                                                false);
                                        // Calculate the percentage based on completed exercises
                                        int completedExercises =
                                            exerciseCompletion.entries
                                                .where((entry) => entry.value)
                                                .toList()
                                                .length;
                                        progress = completedExercises /
                                            exercisesList.length;
                                      });
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: exerciseCompletion[exercise] ==
                                              true
                                          ? Icon(
                                              Icons.check,
                                              color: Colors.blue,
                                              size: 20,
                                            )
                                          : SizedBox(), // Show empty SizedBox if not checked
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      LinearProgressIndicator(
                        minHeight: 10,
                        backgroundColor: Colors.grey,
                        value: progress,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconTitleNextRow extends StatelessWidget {
  final String icon;
  final String title;
  final String time;
  final Color color;

  const IconTitleNextRow({
    Key? key,
    required this.icon,
    required this.title,
    required this.time,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            child: Image.asset(
              icon,
              width: 18,
              height: 18,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(
            width: 120,
            child: Text(
              time,
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 25,
            height: 25,
            child: Container(
              width: 25,
              height: 25,
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}

enum RoundButtonType { bgGradient, bgSGradient, textGradient }

class RoundButton extends StatelessWidget {
  final String title;
  final RoundButtonType type;
  final VoidCallback onPressed;
  final double fontSize;
  final double elevation;
  final FontWeight fontWeight;

  const RoundButton(
      {super.key,
      required this.title,
      this.type = RoundButtonType.bgGradient,
      this.fontSize = 16,
      this.elevation = 1,
      this.fontWeight = FontWeight.w700,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: type == RoundButtonType.bgSGradient
                ? TColor.secondaryG
                : TColor.primaryG,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: type == RoundButtonType.bgGradient ||
                  type == RoundButtonType.bgSGradient
              ? const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 0.5,
                      offset: Offset(0, 0.5))
                ]
              : null),
      child: MaterialButton(
        onPressed: onPressed,
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        textColor: TColor.primaryColor1,
        minWidth: double.maxFinite,
        elevation: type == RoundButtonType.bgGradient ||
                type == RoundButtonType.bgSGradient
            ? 0
            : elevation,
        color: type == RoundButtonType.bgGradient ||
                type == RoundButtonType.bgSGradient
            ? Colors.transparent
            : TColor.white,
        child: type == RoundButtonType.bgGradient ||
                type == RoundButtonType.bgSGradient
            ? Text(title,
                style: TextStyle(
                    color: TColor.white,
                    fontSize: fontSize,
                    fontWeight: fontWeight))
            : ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) {
                  return LinearGradient(
                          colors: TColor.primaryG,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)
                      .createShader(
                          Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                },
                child: Text(title,
                    style: TextStyle(
                        color: TColor.primaryColor1,
                        fontSize: fontSize,
                        fontWeight: fontWeight)),
              ),
      ),
    );
  }
}

class TColor {
  static Color get primaryColor1 => const Color(0xff92A3FD);
  static Color get primaryColor2 => const Color(0xff9DCEFF);

  static Color get secondaryColor1 => const Color(0xffC58BF2);
  static Color get secondaryColor2 => const Color(0xffEEA4CE);

  static List<Color> get primaryG => [primaryColor2, primaryColor1];
  static List<Color> get secondaryG => [secondaryColor2, secondaryColor1];

  static Color get black => const Color(0xff1D1617);
  static Color get gray => const Color(0xff786F72);
  static Color get white => Colors.white;
  static Color get lightGray => const Color(0xffF7F8F8);
}
