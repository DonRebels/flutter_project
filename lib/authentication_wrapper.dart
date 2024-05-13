/// Обертка аутентификации, которая управляет потоком пользователя между экраном входа и главным экраном.
///
/// Этот виджет использует `StreamBuilder` для прослушивания изменений состояния аутентификации Firebase.
/// В зависимости от состояния аутентификации, он переключает пользователя между `SignInScreen` и `HomeScreen`.
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'sign_in_screen.dart';
import 'home_screen.dart';

class AuthenticationWrapper extends StatelessWidget {
  /// Создаем экземпляр FirebaseAuth для доступа к функциям аутентификации.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    /// Используем `StreamBuilder` для отслеживания изменений состояния аутентификации пользователя.
    return StreamBuilder<User?>(
      /// Подписываемся на поток изменений состояния аутентификации.
      stream: _auth.authStateChanges(),
      builder: (context, snapshot) {
        /// Проверяем состояние соединения.
        if (snapshot.connectionState == ConnectionState.active) {
          /// Получаем пользователя из снимка данных.
          User? user = snapshot.data;
          /// Если пользователь не вошел в систему, показываем `SignInScreen`.
          if (user == null) {
            return SignInScreen();
          }
          /// Если пользователь вошел, показываем `HomeScreen`.
          return HomeScreen();
        } else {
          /// Пока соединение не активно, показываем индикатор загрузки.
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
