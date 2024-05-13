// lib/sign_in_screen.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _referralCodeController = TextEditingController();

  void _signIn() async {
    try {
      // Здесь должна быть ваша логика проверки реферального кода
      // Для примера, мы просто пытаемся войти анонимно
      UserCredential userCredential = await _auth.signInAnonymously();
      if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } catch (e) {
      // Обработка ошибок аутентификации
      print(e); // В реальном приложении следует показать ошибку пользователю
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вход в систему'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _referralCodeController,
              decoration: InputDecoration(
                labelText: 'Реферальный код',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signIn,
              child: Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}
