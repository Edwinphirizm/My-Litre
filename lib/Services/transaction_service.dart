import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> buyBottles(String companyId, int quantity) async {
    await _firestore.collection('transactions').add({
      'companyId': companyId,
      'quantity': quantity,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> addDumpsite(String location) async {
    await _firestore.collection('dumpsites').add({'location': location});
  }

  Future<List<Map<String, dynamic>>> getProcurementHistory(
      String companyId) async {
    final querySnapshot = await _firestore
        .collection('transactions')
        .where('companyId', isEqualTo: companyId)
        .orderBy('timestamp', descending: true)
        .get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}
