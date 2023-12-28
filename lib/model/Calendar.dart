import 'package:cloud_firestore/cloud_firestore.dart';

class CalendarDB {
  String userID;
  DateTime Date;
  String Title;
  String Note;

  CalendarDB({
    required this.userID,
    required this.Date,
    required this.Title,
    required this.Note,
  });

  CalendarDB.fromJson(Map<String, Object?> json)
      : this(
          userID: json['userID']! as String,
          Date: (json['Date']! as Timestamp).toDate(),
          Title: json['Title']! as String,
          Note: json['Note']! as String,
        );

  CalendarDB copyWith({
    String? userID,
    DateTime? Date,
    String? Title,
    String? Note,
  }) {
    return CalendarDB(
      userID: userID ?? this.userID,
      Date: Date ?? this.Date,
      Title: Title ?? this.Title,
      Note: Note ?? this.Note,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'userID': userID,
      'Date': Date,
      'Title': Title,
      'Note': Note,
    };
  }
}
