import 'package:cloud_firestore/cloud_firestore.dart';

class AlarmDB {
  String userID;
  DateTime alarmTimeDate;

  AlarmDB({
    required this.userID,
    required this.alarmTimeDate,
  });

  AlarmDB.fromJson(Map<String, Object?> json)
      : this(
          userID: json['userID']! as String,
          alarmTimeDate: (json['alarmTimeDate']! as Timestamp).toDate(),
        );

  AlarmDB copyWith({
    String? userID,
    DateTime? alarmTimeDate,
  }) {
    return AlarmDB(
      userID: userID ?? this.userID,
      alarmTimeDate: alarmTimeDate ?? this.alarmTimeDate,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'userID': userID,
      'alarmTimeDate': alarmTimeDate,
    };
  }
}
