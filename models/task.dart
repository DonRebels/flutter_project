// lib/models/task.dart
class Task {
  String id;
  String title;
  String description;
  DateTime dueDate;
  bool isDone;

  Task({
    this.id,
    this.title,
    this.description,
    this.dueDate,
    this.isDone = false,
  });

  // Конвертация объекта Task в Map, полезно для сохранения в базу данных
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'isDone': isDone ? 1 : 0,
    };
  }

  // Создание объекта Task из Map, полезно при чтении из базы данных
  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      dueDate: DateTime.parse(map['dueDate']),
      isDone: map['isDone'] == 1,
    );
  }

  // Копирование объекта Task с возможностью изменения свойств
  Task copyWith({
    String id,
    String title,
    String description,
    DateTime dueDate,
    bool isDone,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      isDone: isDone ?? this.isDone,
    );
  }
}
