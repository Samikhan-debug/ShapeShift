// To parse this JSON data, do
//
//     final foodData = foodDataFromJson(jsonString);

import 'dart:convert';

FoodData foodDataFromJson(String str) => FoodData.fromJson(json.decode(str));

String foodDataToJson(FoodData data) => json.encode(data.toJson());

class FoodData {
  String foodClass;
  String description;
  List<FoodNutrient> foodNutrients;
  List<FoodAttribute> foodAttributes;
  String foodCode;
  String startDate;
  String endDate;
  WweiaFoodCategory wweiaFoodCategory;
  int fdcId;
  String dataType;
  List<FoodPortion> foodPortions;
  String publicationDate;
  List<InputFood> inputFoods;

  FoodData({
    required this.foodClass,
    required this.description,
    required this.foodNutrients,
    required this.foodAttributes,
    required this.foodCode,
    required this.startDate,
    required this.endDate,
    required this.wweiaFoodCategory,
    required this.fdcId,
    required this.dataType,
    required this.foodPortions,
    required this.publicationDate,
    required this.inputFoods,
  });

  FoodData copyWith({
    String? foodClass,
    String? description,
    List<FoodNutrient>? foodNutrients,
    List<FoodAttribute>? foodAttributes,
    String? foodCode,
    String? startDate,
    String? endDate,
    WweiaFoodCategory? wweiaFoodCategory,
    int? fdcId,
    String? dataType,
    List<FoodPortion>? foodPortions,
    String? publicationDate,
    List<InputFood>? inputFoods,
  }) =>
      FoodData(
        foodClass: foodClass ?? this.foodClass,
        description: description ?? this.description,
        foodNutrients: foodNutrients ?? this.foodNutrients,
        foodAttributes: foodAttributes ?? this.foodAttributes,
        foodCode: foodCode ?? this.foodCode,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        wweiaFoodCategory: wweiaFoodCategory ?? this.wweiaFoodCategory,
        fdcId: fdcId ?? this.fdcId,
        dataType: dataType ?? this.dataType,
        foodPortions: foodPortions ?? this.foodPortions,
        publicationDate: publicationDate ?? this.publicationDate,
        inputFoods: inputFoods ?? this.inputFoods,
      );

  factory FoodData.fromJson(Map<String, dynamic> json) => FoodData(
        foodClass: json["foodClass"],
        description: json["description"],
        foodNutrients: List<FoodNutrient>.from(
            json["foodNutrients"].map((x) => FoodNutrient.fromJson(x))),
        foodAttributes: List<FoodAttribute>.from(
            json["foodAttributes"].map((x) => FoodAttribute.fromJson(x))),
        foodCode: json["foodCode"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        wweiaFoodCategory:
            WweiaFoodCategory.fromJson(json["wweiaFoodCategory"]),
        fdcId: json["fdcId"],
        dataType: json["dataType"],
        foodPortions: List<FoodPortion>.from(
            json["foodPortions"].map((x) => FoodPortion.fromJson(x))),
        publicationDate: json["publicationDate"],
        inputFoods: List<InputFood>.from(
            json["inputFoods"].map((x) => InputFood.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "foodClass": foodClass,
        "description": description,
        "foodNutrients":
            List<dynamic>.from(foodNutrients.map((x) => x.toJson())),
        "foodAttributes":
            List<dynamic>.from(foodAttributes.map((x) => x.toJson())),
        "foodCode": foodCode,
        "startDate": startDate,
        "endDate": endDate,
        "wweiaFoodCategory": wweiaFoodCategory.toJson(),
        "fdcId": fdcId,
        "dataType": dataType,
        "foodPortions": List<dynamic>.from(foodPortions.map((x) => x.toJson())),
        "publicationDate": publicationDate,
        "inputFoods": List<dynamic>.from(inputFoods.map((x) => x.toJson())),
      };
}

class FoodAttribute {
  int id;
  String? name;
  String value;
  FoodAttributeType foodAttributeType;
  double? rank;

  FoodAttribute({
    required this.id,
    this.name,
    required this.value,
    required this.foodAttributeType,
    this.rank,
  });

  FoodAttribute copyWith({
    int? id,
    String? name,
    String? value,
    FoodAttributeType? foodAttributeType,
    double? rank,
  }) =>
      FoodAttribute(
        id: id ?? this.id,
        name: name ?? this.name,
        value: value ?? this.value,
        foodAttributeType: foodAttributeType ?? this.foodAttributeType,
        rank: rank ?? this.rank,
      );

  factory FoodAttribute.fromJson(Map<String, dynamic> json) => FoodAttribute(
        id: json["id"],
        name: json["name"],
        value: json["value"],
        foodAttributeType:
            FoodAttributeType.fromJson(json["foodAttributeType"]),
        rank: json["rank"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
        "foodAttributeType": foodAttributeType.toJson(),
        "rank": rank,
      };
}

class FoodAttributeType {
  int id;
  String name;
  String description;

  FoodAttributeType({
    required this.id,
    required this.name,
    required this.description,
  });

  FoodAttributeType copyWith({
    int? id,
    String? name,
    String? description,
  }) =>
      FoodAttributeType(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  factory FoodAttributeType.fromJson(Map<String, dynamic> json) =>
      FoodAttributeType(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}

class FoodNutrient {
  Type type;
  int id;
  Nutrient nutrient;
  double amount;

  FoodNutrient({
    required this.type,
    required this.id,
    required this.nutrient,
    required this.amount,
  });

  FoodNutrient copyWith({
    Type? type,
    int? id,
    Nutrient? nutrient,
    double? amount,
  }) =>
      FoodNutrient(
        type: type ?? this.type,
        id: id ?? this.id,
        nutrient: nutrient ?? this.nutrient,
        amount: amount ?? this.amount,
      );

  factory FoodNutrient.fromJson(Map<String, dynamic> json) => FoodNutrient(
        type: typeValues.map[json["type"]]!,
        id: json["id"],
        nutrient: Nutrient.fromJson(json["nutrient"]),
        amount: json["amount"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "id": id,
        "nutrient": nutrient.toJson(),
        "amount": amount,
      };
}

class Nutrient {
  int id;
  String number;
  String name;
  //changed here
  double rank;
  UnitName unitName;

  Nutrient({
    required this.id,
    required this.number,
    required this.name,
    required this.rank,
    required this.unitName,
  });

  Nutrient copyWith({
    int? id,
    String? number,
    String? name,
    //changed here
    double? rank,
    UnitName? unitName,
  }) =>
      Nutrient(
        id: id ?? this.id,
        number: number ?? this.number,
        name: name ?? this.name,
        rank: rank ?? this.rank,
        unitName: unitName ?? this.unitName,
      );

  factory Nutrient.fromJson(Map<String, dynamic> json) => Nutrient(
        id: json["id"],
        number: json["number"],
        name: json["name"],
        rank: json["rank"],
        unitName: unitNameValues.map[json["unitName"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "name": name,
        "rank": rank,
        "unitName": unitNameValues.reverse[unitName],
      };
}

enum UnitName { G, KCAL, MG, UNIT_NAME_G }

final unitNameValues = EnumValues({
  "g": UnitName.G,
  "kcal": UnitName.KCAL,
  "mg": UnitName.MG,
  "µg": UnitName.UNIT_NAME_G
});

enum Type { FOOD_NUTRIENT }

final typeValues = EnumValues({"FoodNutrient": Type.FOOD_NUTRIENT});

class FoodPortion {
  int id;
  MeasureUnit measureUnit;
  String modifier;
  int gramWeight;
  String portionDescription;
  int sequenceNumber;

  FoodPortion({
    required this.id,
    required this.measureUnit,
    required this.modifier,
    required this.gramWeight,
    required this.portionDescription,
    required this.sequenceNumber,
  });

  FoodPortion copyWith({
    int? id,
    MeasureUnit? measureUnit,
    String? modifier,
    int? gramWeight,
    String? portionDescription,
    int? sequenceNumber,
  }) =>
      FoodPortion(
        id: id ?? this.id,
        measureUnit: measureUnit ?? this.measureUnit,
        modifier: modifier ?? this.modifier,
        gramWeight: gramWeight ?? this.gramWeight,
        portionDescription: portionDescription ?? this.portionDescription,
        sequenceNumber: sequenceNumber ?? this.sequenceNumber,
      );

  factory FoodPortion.fromJson(Map<String, dynamic> json) => FoodPortion(
        id: json["id"],
        measureUnit: MeasureUnit.fromJson(json["measureUnit"]),
        modifier: json["modifier"],
        gramWeight: json["gramWeight"],
        portionDescription: json["portionDescription"],
        sequenceNumber: json["sequenceNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "measureUnit": measureUnit.toJson(),
        "modifier": modifier,
        "gramWeight": gramWeight,
        "portionDescription": portionDescription,
        "sequenceNumber": sequenceNumber,
      };
}

class MeasureUnit {
  int id;
  String name;
  String abbreviation;

  MeasureUnit({
    required this.id,
    required this.name,
    required this.abbreviation,
  });

  MeasureUnit copyWith({
    int? id,
    String? name,
    String? abbreviation,
  }) =>
      MeasureUnit(
        id: id ?? this.id,
        name: name ?? this.name,
        abbreviation: abbreviation ?? this.abbreviation,
      );

  factory MeasureUnit.fromJson(Map<String, dynamic> json) => MeasureUnit(
        id: json["id"],
        name: json["name"],
        abbreviation: json["abbreviation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "abbreviation": abbreviation,
      };
}

class InputFood {
  int id;
  String unit;
  String portionDescription;
  String portionCode;
  String foodDescription;
  int ingredientWeight;
  int ingredientCode;
  String ingredientDescription;
  int amount;
  int sequenceNumber;

  InputFood({
    required this.id,
    required this.unit,
    required this.portionDescription,
    required this.portionCode,
    required this.foodDescription,
    required this.ingredientWeight,
    required this.ingredientCode,
    required this.ingredientDescription,
    required this.amount,
    required this.sequenceNumber,
  });

  InputFood copyWith({
    int? id,
    String? unit,
    String? portionDescription,
    String? portionCode,
    String? foodDescription,
    int? ingredientWeight,
    int? ingredientCode,
    String? ingredientDescription,
    int? amount,
    int? sequenceNumber,
  }) =>
      InputFood(
        id: id ?? this.id,
        unit: unit ?? this.unit,
        portionDescription: portionDescription ?? this.portionDescription,
        portionCode: portionCode ?? this.portionCode,
        foodDescription: foodDescription ?? this.foodDescription,
        ingredientWeight: ingredientWeight ?? this.ingredientWeight,
        ingredientCode: ingredientCode ?? this.ingredientCode,
        ingredientDescription:
            ingredientDescription ?? this.ingredientDescription,
        amount: amount ?? this.amount,
        sequenceNumber: sequenceNumber ?? this.sequenceNumber,
      );

  factory InputFood.fromJson(Map<String, dynamic> json) => InputFood(
        id: json["id"],
        unit: json["unit"],
        portionDescription: json["portionDescription"],
        portionCode: json["portionCode"],
        foodDescription: json["foodDescription"],
        ingredientWeight: json["ingredientWeight"],
        ingredientCode: json["ingredientCode"],
        ingredientDescription: json["ingredientDescription"],
        amount: json["amount"],
        sequenceNumber: json["sequenceNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "unit": unit,
        "portionDescription": portionDescription,
        "portionCode": portionCode,
        "foodDescription": foodDescription,
        "ingredientWeight": ingredientWeight,
        "ingredientCode": ingredientCode,
        "ingredientDescription": ingredientDescription,
        "amount": amount,
        "sequenceNumber": sequenceNumber,
      };
}

class WweiaFoodCategory {
  String wweiaFoodCategoryDescription;
  int wweiaFoodCategoryCode;

  WweiaFoodCategory({
    required this.wweiaFoodCategoryDescription,
    required this.wweiaFoodCategoryCode,
  });

  WweiaFoodCategory copyWith({
    String? wweiaFoodCategoryDescription,
    int? wweiaFoodCategoryCode,
  }) =>
      WweiaFoodCategory(
        wweiaFoodCategoryDescription:
            wweiaFoodCategoryDescription ?? this.wweiaFoodCategoryDescription,
        wweiaFoodCategoryCode:
            wweiaFoodCategoryCode ?? this.wweiaFoodCategoryCode,
      );

  factory WweiaFoodCategory.fromJson(Map<String, dynamic> json) =>
      WweiaFoodCategory(
        wweiaFoodCategoryDescription: json["wweiaFoodCategoryDescription"],
        wweiaFoodCategoryCode: json["wweiaFoodCategoryCode"],
      );

  Map<String, dynamic> toJson() => {
        "wweiaFoodCategoryDescription": wweiaFoodCategoryDescription,
        "wweiaFoodCategoryCode": wweiaFoodCategoryCode,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
