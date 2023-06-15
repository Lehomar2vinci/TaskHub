import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:uuid/uuid.dart';

class TaskForm extends StatefulWidget {
  final Task? task;
  final Function onSubmit;

  const TaskForm({super.key, this.task, required this.onSubmit});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  String? content;
  bool? done;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      content = widget.task!.content;
      done = widget.task!.done;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task != null ? 'Edit Task' : 'Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Content'),
              onChanged: (value) {
                setState(() {
                  content = value;
                });
              },
              controller: TextEditingController(text: content),
            ),
            CheckboxListTile(
              title: const Text('Done'),
              value: done ?? false,
              onChanged: (value) {
                setState(() {
                  done = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Sauvegarde ou met à jour la tâche
                if (widget.task != null) {
                  // Mets à jour la tâche
                  final updatedTask = Task(
                    id: widget.task!.id,
                    content: content ?? '',
                    done: done ?? false,
                    createdAt: widget.task!.createdAt,
                    updatedAt: DateTime.now(),
                  );
                  widget.onSubmit(updatedTask);
                  // Effectue la logique de mise à jour nécessaire
                } else {
                  // Créer une nouvelle tâche
                  final newTask = Task(
                    id: const Uuid().v4(),
                    content: content ?? '',
                    done: done ?? false,
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                  );
                  widget.onSubmit(newTask);
                  // Effectue la logique de sauvegarde nécessaire
                }
                Navigator.pop(context);
              },
              child: Text(widget.task != null ? 'Save' : 'Add'),
            ),
          ],
        ),
      ),
    );
  }
}
