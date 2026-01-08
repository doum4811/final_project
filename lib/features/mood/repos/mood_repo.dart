import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/features/mood/models/mood_entry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moodRepoProvider = Provider((ref) => MoodRepo());

class MoodRepo {
  final _db = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _col => _db.collection("moods");

  // Stream<List<MoodEntry>> watchMoods(String uid) {
  //   return _col
  //       .where("uid", isEqualTo: uid)
  //       .orderBy("createdAt", descending: true)
  //       .snapshots()
  //       .map((snap) => snap.docs.map((d) => MoodEntry.fromDoc(d)).toList());
  // }
  Stream<List<MoodEntry>> watchMoods(String uid) {
    return _col.where("uid", isEqualTo: uid).snapshots().map((snap) {
      final list = snap.docs.map((d) => MoodEntry.fromDoc(d)).toList();
      list.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return list;
    });
  }

  Future<void> createMood({
    required String uid,
    required String emoji,
    required String description,
  }) async {
    await _col.add({
      "uid": uid,
      "emoji": emoji,
      "description": description,
      "createdAt": FieldValue.serverTimestamp(),
    });
  }

  Future<void> deleteMood(String id) async {
    await _col.doc(id).delete();
  }
}
