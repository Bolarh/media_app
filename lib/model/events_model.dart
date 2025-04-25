import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String title;
  final String description;
  final String date;
  final DateTime createdAt;
  final List<dynamic> mentions;

  Event({
    required this.title,
    required this.description,
    required this.date,
    required this.createdAt,
    required this.mentions,
  });

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      date: map['date'] ?? '',
      createdAt: (map['created_at'] as Timestamp).toDate(),
      mentions: map['mentions'] ?? [],
    );
  }
}
