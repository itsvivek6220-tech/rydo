import 'package:cloud_firestore/cloud_firestore.dart';
import 'labour_model.dart';

class LabourService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addLabour(Labour labour) async {
    await _firestore.collection('labours').doc(labour.id).set(
      labour.toMap(),
    );
  }
}