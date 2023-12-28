import 'package:flutter/material.dart';
import 'package:flutter_application_1/foodmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

// import 'package:shared_preferences/shared_preferences.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  DetailScreen(this.id);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late FoodData foodData;
  bool loading = true;
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    var url = Uri.parse(
        "https://api.nal.usda.gov/fdc/v1/food/${widget.id}?api_key=ptULaQDcxFdQmwIU0HFkNC8hUgf5qCHEj5lnEgeQ");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedResponse = convert.jsonDecode(response.body);
      print(decodedResponse);
      print('===================$decodedResponse');
      foodData = FoodData.fromJson(decodedResponse);
      print('===================$foodData');
      setState(() {
        loading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: loading
            ? SizedBox.shrink()
            : FittedBox(
                child: Text(
                  "${foodData.description}",
                  style: TextStyle(fontSize: 28),
                ),
              ),
      ),
      body: Container(
        color: Color(0xFF1C2757), // Blue background color for food details
        child: Center(
          child: loading
              ? CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Portion: per 100g",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(height: 30),
                    Expanded(
                      child: ListView.builder(
                        itemCount: foodData == null
                            ? 0
                            : foodData.foodNutrients!.length,
                        itemBuilder: (context, index) {
                          var nutrient =
                              foodData.foodNutrients![index].nutrient!;
                          var nutrientName = nutrient.name.toLowerCase();

                          if (nutrientName.contains('protein') ||
                              nutrientName.contains('energy') ||
                              nutrientName.contains('water') ||
                              nutrientName.contains('carbohydrate') ||
                              nutrientName.contains('total lipid') ||
                              nutrientName.contains('fiber') ||
                              nutrientName.contains('vitamin c') ||
                              nutrientName.contains('cholestrol')) {
                            return ListTile(
                              title: Text(
                                "${nutrient.name}: ${foodData.foodNutrients![index].amount ?? ""} ${foodData.foodNutrients![index].amount == null ? "" : nutrient.unitName}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          } else {
                            // Return an empty container for nutrients you don't want to display
                            return Container();
                          }
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}



// class _DetailScreenState extends State<DetailScreen> {
//   late FoodData foodData;
//   bool loading = true;

//   Future<void> fetchData() async {
//     try {
//       // Check if data is already cached
//       SharedPreferences prefs = await SharedPreferences.getInstance();


//       String cachedData = prefs.getString('cached_data_${widget.id}') ?? '';
//       print('Cached Data: $cachedData');

//       if (cachedData.isNotEmpty) {
//         // Use cached data if available
//         var decodedResponse = convert.jsonDecode(cachedData);
//         foodData = FoodData.fromJson(decodedResponse);
//         setState(() {
//           loading = false;
//         });
//       } else {
//         // Fetch data from the API
//         var url = Uri.parse(
//             "https://api.nal.usda.gov/fdc/v1/food/${widget.id}?api_key=ptULaQDcxFdQmwIU0HFkNC8hUgf5qCHEj5lnEgeQ");
//         var response = await http.get(url);

//         if (response.statusCode == 200) {
//           // Save the data to SharedPreferences
//           prefs.setString('cached_data_${widget.id}', response.body);

//           var decodedResponse = convert.jsonDecode(response.body);
//           foodData = FoodData.fromJson(decodedResponse);
//           setState(() {
//             loading = false;
//           });
//         } else {
//           throw Exception('Failed to load data');
//         }
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//       // Handle error appropriately
//     }
//   }

//     @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: loading
//             ? SizedBox.shrink()
//             : FittedBox(
//                 child: Text(
//                   "${foodData.description}",
//                   style: TextStyle(fontSize: 28),
//                 ),
//               ),
//       ),
//       body: Container(
//         child: loading
//             ? Center(child: CircularProgressIndicator())
//             : Column(
//                 children: [
//                   Text(
//                     "Portion: per 100g",
//                     style: TextStyle(fontSize: 25),
//                   ),
//                   Container(
//                     child: Expanded(
//                       child: ListView.builder(
//                           itemCount: foodData == null
//                               ? 0
//                               : foodData.foodNutrients!.length,
//                           itemBuilder: (context, index) {
//                             var nutrient =
//                                 foodData.foodNutrients![index].nutrient!;
//                             var nutrientName = nutrient.name.toLowerCase();

//                              if (nutrientName.contains('protein') ||
//           nutrientName.contains('energy') ||
//           nutrientName.contains('water') ||
//           nutrientName.contains('carbohydrate') ||
//           nutrientName.contains('total lipid') ||
//           nutrientName.contains('fiber') ||
//           nutrientName.contains('vitamin c') ||
//           nutrientName.contains('cholestrol'))
//       {
//         return ListTile(
//           title: Text(
//             "${nutrient.name}: ${foodData.foodNutrients![index].amount ?? ""} ${foodData.foodNutrients![index].amount == null ? "" : nutrient.unitName}",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         );
//       } else {
//         // Return an empty container for nutrients you don't want to display
//         return Container();
//       }



//                             // return Column(
//                             //   mainAxisAlignment: MainAxisAlignment.center,
//                             //   crossAxisAlignment: CrossAxisAlignment.start,
//                             //   children: [
//                             //     Padding(
//                             //       padding: const EdgeInsets.all(8.0),
//                             //       child: FittedBox(
//                             //         alignment: Alignment.topLeft,
//                             //         fit: BoxFit.scaleDown,
//                             //         child: Text(
//                             //           foodData.foodNutrients![index].amount ==
//                             //                   null
//                             //               ? " ${nutrient.name}: "
//                             //               : "${nutrient.name}:   ${foodData.foodNutrients![index].amount} ${foodData.foodNutrients![index].amount == null ? "" : nutrient.unitName}",
//                             //           style: foodData.foodNutrients![index]
//                             //                       .amount ==
//                             //                   null
//                             //               ? TextStyle(
//                             //                   backgroundColor: Colors.green,
//                             //                   fontWeight: FontWeight.w600,
//                             //                   fontSize: 23,
//                             //                 )
//                             //               : TextStyle(
//                             //                   fontSize: 20,
//                             //                   fontWeight: FontWeight.w600,
//                             //                 ),
//                             //         ),
//                             //       ),
//                             //     ),
//                             //     Container(
//                             //       height: 1,
//                             //       color: Colors.black54,
//                             //     ),
//                             //   ],
//                             // );
//                           }),
//                     ),
//                   )
//                 ],
//               ),
//       ),
//     );
//   }
// }

