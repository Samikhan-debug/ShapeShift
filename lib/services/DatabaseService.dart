import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/Calendar.dart';
import 'package:flutter_application_1/model/UserModel.dart';
import 'package:flutter_application_1/model/WaterPlan.dart';
import 'package:firebase_auth/firebase_auth.dart';

const String WATER_COLLECTION_REF = "WaterPlan";

const String Calendar_COLLECTION_REF = "Calendar";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  late final CollectionReference<WaterDB> _waterRef;

  late final CollectionReference<CalendarDB> _calendarRef;
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

  Future<bool> loginUser(String email, String password) async {
    print("Here");
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return false;
    }
    return true;
  }

  signUpUser(String name, String email, String password) async {
    print("Here");

    final userID = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    final user = UserModel(userID: userID.user!.uid, email: email, name: name);
    createUserOnFireStore(user);
  }

  createUserOnFireStore(UserModel user) async {
    await userRef.doc(user.userID).set(user.toJson());
  }
}
