/// Экран для отправки обратной связи пользователя.
///
/// Содержит текстовое поле для ввода сообщения и кнопку для отправки.
import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  /// Ключ для глобального состояния формы.
  final _formKey = GlobalKey<FormState>();

  /// Контроллер для текстового поля, чтобы получать значение введенное пользователем.
  final _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// Заголовок экрана обратной связи.
        title: Text('Обратная связь'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          /// Используем ключ для идентификации формы и ее состояния.
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                /// Контроллер для управления содержимым текстового поля.
                controller: _feedbackController,
                decoration: InputDecoration(
                  labelText: 'Ваше сообщение',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  /// Проверка на пустое значение.
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите ваше сообщение';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                /// Обработчик нажатия на кнопку отправки.
                onPressed: () {
                  /// Проверка валидности формы перед отправкой.
                  if (_formKey.currentState.validate()) {
                    // Здесь должна быть логика отправки обратной связи.
                    // Например, отправка данных на сервер или в базу данных.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Обратная связь отправлена')),
                    );
                  }
                },
                child: Text('Отправить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
