/// Основной файл приложения Flutter.
///
/// Здесь находится точка входа в приложение и базовая конфигурация темы.

import 'package:flutter/material.dart';
import 'authentication_wrapper.dart';

/// Точка входа в приложение.
///
/// Функция main запускает приложение, используя класс MyApp.
void main() => runApp(MyApp());

/// Корневой виджет приложения.
///
/// Определяет тему и начальный маршрут приложения.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Название приложения.
      title: 'Flutter Demo',

      /// Глобальная тема приложения.
      ///
      /// Здесь задается основной цвет приложения.
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      /// Начальный экран приложения.
      ///
      /// AuthenticationWrapper управляет аутентификацией пользователя.
      home: AuthenticationWrapper(),
    );
  }
}
