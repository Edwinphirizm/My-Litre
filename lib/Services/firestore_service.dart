import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addUser(String uid, String email) async {
    await _db.collection('users').doc(uid).set({
      'uid': uid,
      'email': email,
      'reward_points': 0,
    });
  }

  Future<void> updateRewardPoints(String uid, int points) async {
    final userRef = _db.collection('users').doc(uid);
    final userDoc = await userRef.get();
    final currentPoints = userDoc['reward_points'];
    await userRef.update({'reward_points': currentPoints + points});
  }

  Future<int> getRewardPoints(String uid) async {
    final userDoc = await _db.collection('users').doc(uid).get();
    return userDoc['reward_points'];
  }
}
