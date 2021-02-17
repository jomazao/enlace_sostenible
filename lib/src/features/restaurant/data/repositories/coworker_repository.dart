import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enlace_sostenible/src/features/restaurant/models/coworker.dart';

class CoworkerRepository {
  final firestore = FirebaseFirestore.instance;
  static const collection = 'coworkers';
  Future<bool> createCoworker(Coworker coworker) {
    return firestore
        .collection(collection)
        .doc(coworker.uid)
        .set(coworker.toMap())
        .timeout(Duration(seconds: 15), onTimeout: () => false)
        .then((_) => true);
  }

  Future<bool> updateCoworker(Coworker coworker) {
    return firestore
        .collection(collection)
        .doc(coworker.uid)
        .update(coworker.toMap())
        .timeout(Duration(seconds: 15), onTimeout: () => false)
        .then((_) => true);
  }
}
