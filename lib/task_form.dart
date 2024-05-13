/// Экран формы для создания новой задачи.
///
/// Позволяет пользователю ввести название задачи и добавить её в список.

import 'package:flutter/material.dart';
import 'task.dart'; // Импортируем модель задачи

class TaskForm extends StatefulWidget {
  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  String _taskName = '';

  /// Метод для отправки задачи.
  ///
  /// Проверяет форму и, если она валидна, сохраняет задачу.
  void _submitTask() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // Создаем новую задачу и добавляем ее в список задач.
      Task newTask = Task(name: _taskName);
      tasks.add(newTask); // Предполагаем, что список задач доступен
      Navigator.pop(context); // Возвращаемся на предыдущий экран
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// Заголовок экрана для добавления новой задачи.
        title: Text('Новая задача'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                /// Поле ввода для названия задачи.
                decoration: InputDecoration(labelText: 'Название задачи'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Пожалуйста, введите название задачи';
                  }
                  return null;
                },
                onSaved: (value) => _taskName = value,
              ),
              ElevatedButton(
                /// Кнопка для добавления задачи в список.
                onPressed: _submitTask,
                child: Text('Добавить задачу'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
