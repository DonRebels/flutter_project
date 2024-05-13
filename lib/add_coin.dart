/// Экран для добавления монеты в портфель пользователя.
///
/// Этот экран предоставляет форму, где пользователи могут ввести данные о новой монете,
/// которую они хотят добавить в свой портфель.
import 'package:flutter/material.dart';

class AddCoinScreen extends StatelessWidget {
  // Контроллеры для текстовых полей.
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Добавить монеты'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /// Поле ввода для названия монеты.
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Название монеты',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8.0),

            /// Поле ввода для количества монет.
            TextFormField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Количество',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 24.0),

            /// Кнопка для подтверждения добавления монеты.
            ElevatedButton(
              onPressed: () {
                // Здесь должна быть логика добавления монеты.
              },
              child: Text('Добавить'),
            ),
          ],
        ),
      ),
    );
  }
}
