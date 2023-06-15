import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/providers/tasks_provider.dart';
import 'package:todolist/tasks/task_preview.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';

class TasksMaster extends StatefulWidget {
  const TasksMaster({super.key});

  @override
  State<TasksMaster> createState() => _TasksMasterState();
}

class _TasksMasterState extends State<TasksMaster> {
  void addTask(Task task) {
    showSnackBar('Tâche rajoutée avec succès');
  }

  void updateTask(Task task) {
    showSnackBar('Tâche mise à jour avec succès');
  }

  void deleteTask(Task task) {
    showSnackBar('Tâche supprimée avec succès');
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<TasksProvider>(builder:
            (BuildContext context, TasksProvider tasksProvider, child) {
          return ListView.builder(
            itemCount: tasksProvider.tasks.length,
            itemBuilder: (context, index) {
              final Task task = tasksProvider.tasks[index];

              return TaskPreview(task: task);
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => {
          Provider.of<TasksProvider>(context, listen: false).add(Task(
              id: const Uuid().v4(), content: 'Nouvelle tâche', done: false))
        },
      ),
    );
  }
}
