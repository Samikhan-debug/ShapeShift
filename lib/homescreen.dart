import 'package:flutter/material.dart';

import 'detailScreen.dart';
import 'foodlist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var foodList = FoodList(
    name: '',
    foodCategory: '',
    id: 0,
  );
  List<FoodList> _foodList = [];
  @override
  void initState() {
    _foodList = foodList.foodList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calorie Checker",
          style: TextStyle(fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200, // Adjust the height of the image container
            color: Colors.white, // Placeholder color for the image container
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "How many calories\nwere in my meal?", // Placeholder text for the image
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                ),
                Container(
                  width: 150, // Adjust the width of the image container
                  height: 200, // Adjust the height of the image
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/hungry.jpg'), // Replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xFF1C2757), // Background color for the ListView
              child: ListView.builder(
                itemCount: _foodList.length,
                itemBuilder: (context, index) {
                  // Adding a blue circle with a number
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(_foodList[index].id),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 40, // Width of the circle container
                            height: 40, // Height of the circle container
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: Center(
                              child: Text(
                                "${index}", // Display the index as the number
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: 10), // Spacing between circle and text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${_foodList[index].name}",
                                style: TextStyle(
                                  fontSize: 24, // Increase the font size
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white, // Text color
                                ),
                              ),
                              Text(
                                "${_foodList[index].foodCategory}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors
                                      .white70, // Increased font size for category
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
