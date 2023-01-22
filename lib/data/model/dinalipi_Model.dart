import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:dinalipi/data/model/task.dart';

const String dinalipiTable = 'dinalipi';

class DinalipiFields {
  static const List<String> values = [
    id,
    tasks,
    date,
    taskName,
    taskType,
    taskStartTime,
    taskEndTime,
  ];
  static const String id = '_id';
  static const String tasks = '_tasks';
  static const String date = '_date';
  static const String taskName = '_taskName';
  static const String taskType = '_taskType';
  static const String taskStartTime = '_taskStartTime';
  static const String taskEndTime = '_taskEndTime';
}

class Dinalipi {
  String? id;
  List<Task>? tasks;
  DateTime? date;
  String taskName;
  TaskType taskType = TaskType.boolean;
  DateTime? taskStartTime;
  DateTime? taskEndTime;
  Dinalipi({
    this.id,
    this.tasks,
    this.date,
    required this.taskName,
    required this.taskType,
    this.taskStartTime,
    this.taskEndTime,
  });

  Dinalipi copyWith({
    String? id,
    List<Task>? tasks,
    DateTime? date,
    String? taskName,
    TaskType? taskType,
    DateTime? taskStartTime,
    DateTime? taskEndTime,
  }) {
    return Dinalipi(
      id: id ?? this.id,
      tasks: tasks ?? this.tasks,
      date: date ?? this.date,
      taskName: taskName ?? this.taskName,
      taskType: taskType ?? this.taskType,
      taskStartTime: taskStartTime ?? this.taskStartTime,
      taskEndTime: taskEndTime ?? this.taskEndTime,
    );
  }

  Dinalipi copy({
    String? id,
    List<Task>? tasks,
    DateTime? date,
    required String taskName,
    TaskType taskType = TaskType.boolean,
    DateTime? taskStartTime,
    DateTime? taskEndTime,
  }) =>
      Dinalipi(
        id: id,
        tasks: tasks,
        date: date,
        taskName: taskName,
        taskType: taskType,
        taskStartTime: taskStartTime,
        taskEndTime: taskEndTime,
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tasks': tasks?.map((x) => x.toMap()).toList(),
      'date': date?.millisecondsSinceEpoch,
      'taskName': taskName,
      'taskType': taskType,
      'taskStartTime': taskStartTime?.millisecondsSinceEpoch,
      'taskEndTime': taskEndTime?.millisecondsSinceEpoch,
    };
  }

  factory Dinalipi.fromMap(Map<String, dynamic> map) {
    return Dinalipi(
      id: map['id'],
      tasks: map['tasks'] != null
          ? List<Task>.from(map['tasks']?.map((x) => Task.fromMap(x)))
          : null,
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'])
          : null,
      taskName: map['taskName'] ?? '',
      taskType: map['taskType'],
      taskStartTime: map['taskStartTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['taskStartTime'])
          : null,
      taskEndTime: map['taskEndTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['taskEndTime'])
          : null,
    );
  }

  toJson() => json.encode(toMap());

  factory Dinalipi.fromJson(Map<String, Object?> json) => Dinalipi(
        id: json[DinalipiFields.id] as String,
        taskName: json[DinalipiFields.taskName] as String,
        taskType: json[DinalipiFields.taskType] as TaskType,
        date: json[DinalipiFields.date] as DateTime,
        tasks: json[DinalipiFields.taskType] as List<Task>,
        taskStartTime: json[DinalipiFields.taskStartTime] as DateTime,
        taskEndTime: json[DinalipiFields.taskEndTime] as DateTime,
      );

  // factory Dinalipi.fromJson(String source) =>
  //     Dinalipi.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Dinalipi(id: $id, tasks: $tasks, date: $date, taskName: $taskName, taskType: $taskType, taskStartTime: $taskStartTime, taskEndTime: $taskEndTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Dinalipi &&
        other.id == id &&
        listEquals(other.tasks, tasks) &&
        other.date == date &&
        other.taskName == taskName &&
        other.taskType == taskType &&
        other.taskStartTime == taskStartTime &&
        other.taskEndTime == taskEndTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        tasks.hashCode ^
        date.hashCode ^
        taskName.hashCode ^
        taskType.hashCode ^
        taskStartTime.hashCode ^
        taskEndTime.hashCode;
  }
}
