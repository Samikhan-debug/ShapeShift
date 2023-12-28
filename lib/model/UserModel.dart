import 'package:cloud_firestore/cloud_firestore.dart';

class UserModelDB {
  String userID, name, gender;
  int weight, height;

  UserModelDB({
    required this.userID,
    required this.name,
    required this.weight,
    required this.height,
    required this.gender,
  });

  UserModelDB.fromJson(Map<String, Object?> json)
      : this(
          userID: json['userID']! as String,
          name: json['name']! as String,
          gender: json['gender']! as String,
          weight: json['weight']! as int,
          height: json['height']! as int,
        );

  UserModelDB copyWith({
    String? userID,
    String? gender,
    String? name,
    int? weight,
    int? height,
  }) {
    return UserModelDB(
      userID: userID ?? this.userID,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      weight: weight ?? this.weight,
      height: height ?? this.height,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'userID': userID,
      'name': name,
      'gender': gender,
      'weight': weight,
      'height': height,
    };
  }
}
