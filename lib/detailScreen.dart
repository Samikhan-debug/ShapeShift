import 'package:flutter/material.dart';
import 'package:flutter_application_1/foodmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shimmer/shimmer.dart';

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
      foodData = FoodData.fromJson(decodedResponse);
      setState(() {
        loading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Widget buildSkeleton() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.grey[300]!,
          ),
          SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Adjust the number of skeleton items as needed
              itemBuilder: (context, index) {
                return ListTile(
                  title: Container(
                    height: 20,
                    color: Colors.grey[300]!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
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
        color: Color(0xFF1C2757),
        child: Center(
          child: loading ? buildSkeleton() : buildContent(),
        ),
      ),
    );
  }

  Widget buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        Text(
          "Portion: per 100g",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        SizedBox(height: 30),
        Expanded(
          child: ListView.builder(
            itemCount: foodData == null ? 0 : foodData.foodNutrients!.length,
            itemBuilder: (context, index) {
              var nutrient = foodData.foodNutrients![index].nutrient!;
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
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}
