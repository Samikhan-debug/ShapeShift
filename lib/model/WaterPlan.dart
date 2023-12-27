import 'package:cloud_firestore/cloud_firestore.dart';

class WaterDB {
  String userID;
  bool isClicked;
  DateTime Date;

  WaterDB({
    required this.userID,
    required this.isClicked,
    required this.Date,
  });

  WaterDB.fromJson(Map<String, Object?> json)
      : this(
          userID: json['userID']! as String,
          isClicked: json['isClicked']! as bool,
          Date: (json['Date']! as Timestamp).toDate(),
        );

  WaterDB copyWith({
    String? userID,
    bool? isClicked,
    DateTime? Date,
  }) {
    return WaterDB(
      userID: userID ?? this.userID,
      isClicked: isClicked ?? this.isClicked,
      Date: Date ?? this.Date,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'userID': userID,
      'isClicked': isClicked,
      'Date': Date,
    };
  }
}
