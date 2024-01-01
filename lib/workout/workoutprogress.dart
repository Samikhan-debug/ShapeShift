import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/workout/workout_detail.dart';
import 'package:flutter_application_1/workoutscreen.dart';

class Workoutscreen1 extends StatefulWidget {
  const Workoutscreen1({super.key});

  @override
  State<Workoutscreen1> createState() => _WorkoutscreenState1();
}

class _WorkoutscreenState1 extends State<Workoutscreen1> {
  String img_Header = "assets/victor-freitas-WvDYdXDzkhs-unsplash.jpg";

  List<String> trainingimage = [
    "assets/jonathan-borba-lrQPTQs7nQQ-unsplash.jpg"
        "assets/anastase-maragos-FP7cfYPPUKM-unsplash.jpg"
        "assets/jared-rice-NTyBbu66_SI-unsplash.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,

            pinned: true,

            floating: false,
            title: const Text(
              "Workouts",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
            toolbarHeight: 100.0,

            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
              img_Header,
              fit: BoxFit.cover,
              color: Color(0xaa212121),
              colorBlendMode: BlendMode.darken,
            )),
            // bottom: PreferredSize(
            //   child: Padding(
            //     padding: const EdgeInsets.only(
            //       bottom: 24.0, left: 12.0, right: 12.0),
            //     child: TextField(),
            // ),
            //   preferredSize: Size.fromHeight(100.0),
            // ),
          ),
        ];
      },
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Our Workout Programs",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            listItem("assets/anastase-maragos-FP7cfYPPUKM-unsplash.jpg",
                "Full Body Workout", 10, 50, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WorkoutDetailView(
                          dObj: {},
                        )),
              );
            }),
            listItem("assets/jonathan-borba-lrQPTQs7nQQ-unsplash.jpg",
                "Full Body Workout", 7, 20, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WorkoutDetailView(
                          dObj: {},
                        )),
              );
            }),
            listItem("assets/jared-rice-NTyBbu66_SI-unsplash.jpg",
                "Full Body Workout", 5, 30, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WorkoutDetailView(
                          dObj: {},
                        )),
              );
            }),
          ],
        ),
      )),
    ));
  }
}
