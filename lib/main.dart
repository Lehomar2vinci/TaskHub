import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/providers/tasks_provider.dart';

import 'package:todolist/todolist_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TasksProvider(),
        ),
      ],
      child: const TodoListApp(),
    ),
  );
}
