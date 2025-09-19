import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(String uid, Map<String, dynamic> data) async {
    await _firestore.collection('users').doc(uid).set(data, SetOptions(merge: true));
  }

  Stream<Map<String, dynamic>?> streamUserData(String uid) {
    return _firestore.collection('users').doc(uid).snapshots().map((snapshot) => snapshot.data());
  }
}
