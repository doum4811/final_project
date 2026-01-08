import 'package:cloud_firestore/cloud_firestore.dart';

class MoodEntry {
  final String id;
  final String uid;
  final String emoji;
  final String description;
  final DateTime createdAt;

  MoodEntry({
    required this.id,
    required this.uid,
    required this.emoji,
    required this.description,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() => {
    "uid": uid,
    "emoji": emoji,
    "description": description,
    "createdAt": Timestamp.now(), //Timestamp.fromDate(createdAt),
  };

  factory MoodEntry.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    final ts = data["createdAt"] as Timestamp?;
    return MoodEntry(
      id: doc.id,
      uid: data["uid"] as String? ?? "",
      emoji: data["emoji"] as String? ?? "😀",
      description: data["description"] as String? ?? "",
      createdAt: (ts?.toDate()) ?? DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
