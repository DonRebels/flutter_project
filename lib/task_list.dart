// lib/task_list.dart
import 'package:flutter/material.dart';
import 'done_task.dart';

class TaskList extends StatelessWidget {
  final List<String> _tasks = ['Задача 1', 'Задача 2', 'Задача 3'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_tasks[index]),
          trailing: IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              // Здесь должна быть логика для отметки задачи как выполненной
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoneTaskScreen(task: _tasks[index])),
              );
            },
          ),
        );
      },
    );
  }
}
