import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import 'package:flutter_application_1/Progress.dart';
import 'package:flutter_application_1/Shop_Page.dart';

class WhatYourGoalView extends StatefulWidget {
  const WhatYourGoalView({super.key});

  @override
  State<WhatYourGoalView> createState() => _WhatYourGoalViewState();
}

class _WhatYourGoalViewState extends State<WhatYourGoalView> {
  CarouselController buttonCarouselController = CarouselController();

  List goalArr = [
    {
      "image": "assets/41",
      "title": "Beginner",
      "subtitle":
          "Picture a fitness journey just kicking off! I'm at the starting line, eager to boost my mental strength. While I'm not lifting mental weights yet, I'm gearing up to crunch knowledge, stretch my learning, and take those first steps to flexing my brainpower!"
    },
    {
      "image": "assets/on_board_2.png",
      "title": "Intermediate",
      "subtitle":
          "I'm on the path to mental fitness, steadily building up my brainpower. Think of me as mid-workout—already crunching data, lifting concepts, and steadily sprinting through challenges. I'm honing those mental muscles, getting stronger with each mental rep!"
    },
    {
      "image": "assets/on_board_2.png",
      "title": "Advanced",
      "subtitle":
          "At the expert level, I'm a mental Olympian, mastering the art of mental fitness. I'm not just crunching data; I'm orchestrating symphonies of information, powerlifting complex concepts, and effortlessly navigating through the most intricate challenges."
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          Center(
            child: CarouselSlider(
              items: goalArr
                  .map(
                    (gObj) => Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(58, 83, 241, 1),
                            Color.fromRGBO(101, 119, 223, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: media.width * 0.1, horizontal: 25),
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Column(
                          children: [
                            Image.asset(
                              gObj["image"].toString(),
                              width: media.width * 0.5,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(
                              height: media.width * 0.1,
                            ),
                            Text(
                              gObj["title"].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700),
                            ),
                            Container(
                              width: media.width * 0.1,
                              height: 1,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: media.width * 0.02,
                            ),
                            Text(
                              gObj["subtitle"].toString(),
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.7,
                aspectRatio: 0.74,
                initialPage: 0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: media.width,
            child: Column(
              children: [
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  "What is your goal ?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "It will help us to choose a best\nprogram for you",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const Spacer(),
                SizedBox(
                  height: media.width * 0.05,
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
                RoundButton(
                    title: "Confirm",
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Shop_Page()));
                    }),
              ],
            ),
          )
        ],
      )),
    );
  }
}
