/// Экран входа в систему.
///
/// Позволяет пользователю войти в систему, используя реферальный код.

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  /// Экземпляр FirebaseAuth для аутентификации пользователя.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Контроллер для управления текстовым полем реферального кода.
  final TextEditingController _referralCodeController = TextEditingController();

  /// Метод для входа в систему.
  ///
  /// Проверяет реферальный код и осуществляет вход пользователя.
  void _signIn() async {
    try {
      // Предполагаем, что реферальный код должен быть не пустым.
      // В реальном приложении здесь может быть запрос к серверу для проверки кода.
      if (_referralCodeController.text.isNotEmpty) {
        // Попытка анонимного входа для демонстрации.
        UserCredential userCredential = await _auth.signInAnonymously();
        if (userCredential.user != null) {
          // Переход на главный экран после успешного входа.
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      } else {
        // Вывод сообщения об ошибке, если реферальный код пуст.
        _showError('Пожалуйста, введите реферальный код.');
      }
    } catch (e) {
      // Вывод сообщения об ошибке при возникновении исключения.
      _showError(e.toString());
    }
  }

  /// Метод для отображения ошибок.
  ///
  /// Принимает строку с сообщением об ошибке и отображает её в виде снэкбара.
  void _showError(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// Заголовок экрана входа.
        title: Text('Вход в систему'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              /// Текстовое поле для ввода реферального кода.
              controller: _referralCodeController,
              decoration: InputDecoration(
                labelText: 'Реферальный код',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              /// Кнопка для инициации процесса входа.
              onPressed: _signIn,
              child: Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}
