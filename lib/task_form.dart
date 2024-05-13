// lib/task_form.dart
import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  String _taskName = '';

  void _submitTask() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // Здесь должна быть логика добавления задачи в список
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
