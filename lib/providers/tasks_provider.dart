import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class TasksProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void update(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void delete(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  Task findById(String id) {
    return _tasks.firstWhere((task) => task.id == id);
  }
}
