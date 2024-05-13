/// Экран со списком задач.
///
/// Отображает список задач и позволяет пользователю отмечать задачи как выполненные.

import 'package:flutter/material.dart';
import 'done_task.dart';

class TaskList extends StatelessWidget {
  /// Список названий задач.
  final List<String> _tasks = ['Задача 1', 'Задача 2', 'Задача 3'];

  /// Список выполненных задач.
  final List<String> _completedTasks = [];

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
              // Добавляем задачу в список выполненных и обновляем UI.
              _completedTasks.add(_tasks[index]);
              // Обычно здесь мы бы использовали setState, но так как это StatelessWidget,
              // мы используем другой подход, например, пересоздание виджета с новым состоянием.
              Navigator.pushReplacement(
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
