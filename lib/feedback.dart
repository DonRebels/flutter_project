// lib/feedback.dart
import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Здесь должен быть интерфейс для отправки обратной связи
    return Scaffold(
      appBar: AppBar(
        title: Text('Обратная связь'),
      ),
      body: Center(
        child: Text('Форма обратной связи'),
      ),
    );
  }
}
