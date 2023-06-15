import 'package:uuid/uuid.dart';

class Task {
  String? id;
  String content;
  bool done;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deadline;
  String? category;
  int? priority;
  String? userId;

  Task({
    required this.content,
    this.done = false,
    this.createdAt,
    this.updatedAt,
    this.deadline,
    this.category,
    this.priority,
    this.userId,
    this.id,
  }) {
    id ?? const Uuid().v4();
  }
}
