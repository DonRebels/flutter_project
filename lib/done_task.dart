// lib/done_task.dart
import 'package:flutter/material.dart';

class DoneTaskScreen extends StatelessWidget {
  final String task;

  DoneTaskScreen({@required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Задача выполнена'),
      ),
      body: Center(
        child: Text('Поздравляем! Задача "$task" выполнена.'),
      ),
    );
  }
}
