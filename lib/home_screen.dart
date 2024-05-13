/// Главный экран приложения.
///
/// Отображает список задач и содержит меню с дополнительными опциями.
import 'package:flutter/material.dart';
import 'task_list.dart';
import 'add_coin.dart';
import 'feedback.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// Заголовок главной страницы.
        title: Text('Главная страница'),
      ),
      /// Основное содержимое главной страницы - список задач.
      body: TaskList(),
      /// Выдвижная панель для навигации по разделам приложения.
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              /// Заголовок меню в выдвижной панели.
              child: Text('Меню'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              /// Пункт меню для добавления монет.
              title: Text('Добавить монеты'),
              onTap: () {
                /// Навигация к экрану добавления монет.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCoinScreen()),
                );
              },
            ),
            ListTile(
              /// Пункт меню для обратной связи.
              title: Text('Обратная связь'),
              onTap: () {
                /// Навигация к экрану обратной связи.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
