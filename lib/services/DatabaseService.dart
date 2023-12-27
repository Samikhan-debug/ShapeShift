import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/model/WaterPlan.dart';

const String WATER_COLLECTION_REF = "WaterPlan";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference<WaterDB> _waterRef;

  DatabaseService() {
    _waterRef =
        _firestore.collection(WATER_COLLECTION_REF).withConverter<WaterDB>(
              fromFirestore: (snapshots, _) => WaterDB.fromJson(
                snapshots.data()!,
              ),
              toFirestore: (water, _) => water.toJson(),
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

  Future<List<Map<String, dynamic>>> getUserData(String userID) async {
    QuerySnapshot querySnapshot =
        await _waterRef.where('userID', isEqualTo: userID).get();

    List<Map<String, dynamic>> waterList = [];

    querySnapshot.docs.forEach((element) {
      Map<String, dynamic> data = element.data() as Map<String, dynamic>;
      waterList.add(data);
    });
    return waterList;
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
}
