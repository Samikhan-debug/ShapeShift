import 'package:cloud_firestore/cloud_firestore.dart';

class WorkoutDB {
  String userID;
  bool isClicked;

  WorkoutDB({
    required this.userID,
    required this.isClicked,
  });

  WorkoutDB.fromJson(Map<String, Object?> json)
      : this(
          userID: json['userID']! as String,
          isClicked: json['isClicked']! as bool,
        );

  WorkoutDB copyWith({
    String? userID,
    bool? isClicked,
  }) {
    return WorkoutDB(
      userID: userID ?? this.userID,
      isClicked: isClicked ?? this.isClicked,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'userID': userID,
      'isClicked': isClicked,
    };
  }
}
