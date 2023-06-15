import 'package:flutter/material.dart';
import 'package:todolist/tasks/tasks_master.dart';
// import 'package:go_router/go_router.dart';

class TodoListApp extends StatelessWidget {
  const TodoListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todolist App',
      home: TasksMaster(),
      debugShowCheckedModeBanner: false,
    );
  }
}
