import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lib/add_coin_screen.dart';

void main() {
  group('AddCoinScreen Tests', () {
    // Тестирование, что все виджеты присутствуют на экране.
    testWidgets('Проверка наличия всех элементов', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: AddCoinScreen()));

      // Проверка наличия AppBar.
      expect(find.byType(AppBar), findsOneWidget);

      // Проверка наличия текстовых полей.
      expect(find.byType(TextFormField), findsNWidgets(2));

      // Проверка наличия кнопки добавления.
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    // Тестирование ввода данных в текстовые поля.
    testWidgets('Ввод данных в текстовые поля', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: AddCoinScreen()));

      // Ввод текста в поле названия монеты.
      await tester.enterText(find.byType(TextFormField).at(0), 'Bitcoin');

      // Ввод текста в поле количества монет.
      await tester.enterText(find.byType(TextFormField).at(1), '3.5');

      // Проверка, что текст был введен.
      expect(find.text('Bitcoin'), findsOneWidget);
      expect(find.text('3.5'), findsOneWidget);
    });

    // Тестирование нажатия кнопки добавления.
    testWidgets('Нажатие кнопки "Добавить"', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: AddCoinScreen()));

      // Нажатие кнопки.
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Здесь должна быть проверка результата нажатия кнопки.
      // Например, можно проверить, была ли вызвана функция добавления монеты.
    });
  });
}