import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/alarm.dart';
import 'package:flutter_application_1/model/Alarm.dart';
import 'package:flutter_application_1/model/Calendar.dart';
import 'package:flutter_application_1/model/UserModel.dart';
import 'package:flutter_application_1/model/WaterPlan.dart';
import 'package:firebase_auth/firebase_auth.dart';

const String WATER_COLLECTION_REF = "WaterPlan";
const String ALARM_COLLECTION_REF = "Alarm";
const String Calendar_COLLECTION_REF = "Calendar";
const String USERINFO_COLLECTION_REF = "UserInfo";

class DatabaseService {
  User? _user;
  final _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late final CollectionReference<WaterDB> _waterRef;

  late final CollectionReference<CalendarDB> _calendarRef;

  late final CollectionReference<AlarmDB> _alarmRef;

  late final CollectionReference<UserModelDB> _userRef;

  final CollectionReference userRef =
      FirebaseFirestore.instance.collection('users');

  DatabaseService() {
    _waterRef =
        _firestore.collection(WATER_COLLECTION_REF).withConverter<WaterDB>(
              fromFirestore: (snapshots, _) => WaterDB.fromJson(
                snapshots.data()!,
              ),
              toFirestore: (water, _) => water.toJson(),
            );
    _calendarRef = _firestore
        .collection(Calendar_COLLECTION_REF)
        .withConverter<CalendarDB>(
          fromFirestore: (snapshots, _) => CalendarDB.fromJson(
            snapshots.data()!,
          ),
          toFirestore: (calendar, _) => calendar.toJson(),
        );

    _alarmRef =
        _firestore.collection(ALARM_COLLECTION_REF).withConverter<AlarmDB>(
              fromFirestore: (snapshots, _) => AlarmDB.fromJson(
                snapshots.data()!,
              ),
              toFirestore: (alarmRef, _) => alarmRef.toJson(),
            );

    _userRef = _firestore
        .collection(USERINFO_COLLECTION_REF)
        .withConverter<UserModelDB>(
          fromFirestore: (snapshots, _) => UserModelDB.fromJson(
            snapshots.data()!,
          ),
          toFirestore: (UserModel, _) => UserModel.toJson(),
        );
  }

  Stream<QuerySnapshot<WaterDB>> getUserWaterLevel(
      String userID, DateTime date) {
    DateTime startDate = DateTime(date.year, date.month, date.day);
    DateTime endDate = DateTime(date.year, date.month, date.day, 23, 59, 59);

    return _waterRef
        .where('userID', isEqualTo: userID)
        .where('Date', isGreaterThanOrEqualTo: startDate)
        .where('Date', isLessThanOrEqualTo: endDate)
        .snapshots();
  }

  void addUser(WaterDB water) async {
    await _waterRef.add(water);
  }

  void updateUser(String userID, WaterDB water) {
    _waterRef.doc(userID).update(water.toJson());
  }

  void deleteAllUserRecords(String userID) async {
    QuerySnapshot<WaterDB> userRecords =
        await _waterRef.where('userID', isEqualTo: userID).get();

    for (QueryDocumentSnapshot<WaterDB> doc in userRecords.docs) {
      await _waterRef.doc(doc.id).delete();
    }
  }

  Stream<QuerySnapshot<CalendarDB>> getUserNotes(String userID, DateTime date) {
    DateTime startDate = DateTime(date.year, date.month, date.day);
    DateTime endDate = DateTime(date.year, date.month, date.day, 23, 59, 59);

    return _calendarRef
        .where('userID', isEqualTo: userID)
        .where('Date', isGreaterThanOrEqualTo: startDate)
        .where('Date', isLessThanOrEqualTo: endDate)
        .snapshots();
  }

  void addUserNotes(CalendarDB calendar) async {
    await _calendarRef.add(calendar);
  }

  Stream<List<AlarmDB>> getUserAlarms(String userID, DateTime date) {
    DateTime startDate = DateTime(date.year, date.month, date.day);
    DateTime endDate = DateTime(date.year, date.month, date.day, 23, 59, 59);

    return _firestore
        .collection(
            'alarms') // Replace 'alarms' with your Firestore collection name
        .where('userID', isEqualTo: userID)
        .where('alarmTimeDate', isGreaterThanOrEqualTo: startDate)
        .where('alarmTimeDate', isLessThanOrEqualTo: endDate)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs.map((document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return AlarmDB(
                userID: data['userID'],
                alarmTimeDate: (data['alarmTimeDate'] as Timestamp).toDate(),
                // Assuming 'alarmTimeDate' is stored as a Firestore Timestamp
              );
            }).toList());
  }

  void addUserAlarms(AlarmDB alarm) async {
    await _alarmRef.add(alarm);
  }

  Future<User?> loginUser(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential.user;
    } catch (e) {
      print("User don't exist");
    }
    return null;
  }

  Future<User?> signUpUser(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return credential.user;
    } catch (e) {
      print("error occured");
    }
    return null;
  }

  Stream<QuerySnapshot<UserModelDB>> getUserInfo(String userID) {
    return _userRef.where('userID', isEqualTo: userID).snapshots();
  }

  void addUserInfo(UserModelDB userInfo) async {
    await _userRef.add(userInfo);
  }
}
