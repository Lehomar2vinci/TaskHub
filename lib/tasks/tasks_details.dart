import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
// ignore: unused_import
import 'package:uuid/uuid.dart';

class TaskDetails extends StatelessWidget {
  final Task task;

  const TaskDetails({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détail de la tâche'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Contenu:'),
            subtitle: Text(task.content),
          ),
          ListTile(
            title: const Text('Statuts:'),
            subtitle: Text(task.done ? 'Fait' : 'Pas fait'),
          ),
        ],
      ),
    );
  }
}
