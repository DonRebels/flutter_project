/// Экран, отображающий сообщение о выполнении задачи.
///
/// Принимает строковый параметр [task], который содержит название выполненной задачи.
/// Показывает пользователю сообщение о том, что задача успешно выполнена.
import 'package:flutter/material.dart';

class DoneTaskScreen extends StatelessWidget {
  /// Название задачи, которая была выполнена.
  final String task;

  /// Конструктор принимает [task] и является обязательным параметром.
  DoneTaskScreen({@required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// Заголовок экрана, сообщающий о выполнении задачи.
        title: Text('Задача выполнена'),
      ),
      body: Center(
        /// Сообщение пользователю с названием выполненной задачи.
        child: Text('Поздравляем! Задача "$task" выполнена.'),
      ),
    );
  }
}
