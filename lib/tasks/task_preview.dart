import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/tasks/tasks_details.dart';
// ignore: unused_import
import 'package:uuid/uuid.dart';

class TaskPreview extends StatelessWidget {
  final Task task;

  const TaskPreview({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.content),
      subtitle: Text(task.done ? 'Fait' : 'Pas fait'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TaskDetails(task: task)),
        );
      },
    );
  }
}
