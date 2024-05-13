/// Модель данных для задачи.
///
/// Представляет задачу с уникальным идентификатором, названием, описанием,
/// датой выполнения и статусом выполнения.
class Task {
  /// Уникальный идентификатор задачи.
  String id;

  /// Название задачи.
  String title;

  /// Описание задачи.
  String description;

  /// Дата, к которой задача должна быть выполнена.
  DateTime dueDate;

  /// Флаг, указывающий, выполнена ли задача.
  bool isDone;

  /// Конструктор задачи.
  /// 
  /// Принимает [id], [title], [description], [dueDate], и [isDone],
  /// где [isDone] по умолчанию равно `false`.
  Task({
    this.id,
    this.title,
    this.description,
    this.dueDate,
    this.isDone = false,
  });

  /// Конвертирует объект [Task] в [Map] для сохранения в базу данных.
  ///
  /// Возвращает [Map] с ключами, соответствующими полям объекта [Task].
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'isDone': isDone ? 1 : 0,
    };
  }

  /// Создает объект [Task] из [Map], полученного из базы данных.
  ///
  /// Принимает [Map] и возвращает экземпляр [Task],
  /// заполненный данными из [Map].
  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      dueDate: DateTime.parse(map['dueDate']),
      isDone: map['isDone'] == 1,
    );
  }

  /// Создает копию объекта [Task] с возможностью изменения его свойств.
  ///
  /// Принимает необязательные параметры [id], [title], [description],
  /// [dueDate], и [isDone], и возвращает новый экземпляр [Task],
  /// который может содержать измененные значения свойств.
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
