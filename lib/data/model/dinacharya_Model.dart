import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:dinalipi/data/model/task.dart';

const String dinacharjyaTable = 'dinacharjya';

class DinacharjyaFields {
  static const List<String> values = [
    id,
    tasks,
    taskName,
    taskType,
    taskStartTime,
    taskEndTime,
  ];
  static const String id = '_id';
  static const String tasks = '_tasks';
  static const String taskName = '_taskName';
  static const String taskType = '_taskType';
  static const String taskStartTime = '_taskStartTime';
  static const String taskEndTime = '_taskEndTime';
}

class Dinacharjya {
  String? id;
  List<Task>? tasks;
  String taskName;
  TaskType taskType = TaskType.boolean;
  DateTime? taskStartTime;
  DateTime? taskEndTime;

  Dinacharjya({
    this.id,
    this.tasks,
    required this.taskName,
    required this.taskType,
    this.taskStartTime,
    this.taskEndTime,
  });

  Dinacharjya copy({
    String? id,
    List<Task>? tasks,
    required String taskName,
    TaskType taskType = TaskType.boolean,
    DateTime? taskStartTime,
    DateTime? taskEndTime,
  }) =>
      Dinacharjya(
        id: id,
        tasks: tasks,
        taskName: taskName,
        taskType: taskType,
        taskStartTime: taskStartTime,
        taskEndTime: taskEndTime,
      );

  Dinacharjya copyWith({
    String? id,
    List<Task>? tasks,
    String? taskName,
    TaskType? taskType,
    DateTime? taskStartTime,
    DateTime? taskEndTime,
  }) {
    return Dinacharjya(
      id: id ?? this.id,
      tasks: tasks ?? this.tasks,
      taskName: taskName ?? this.taskName,
      taskType: taskType ?? this.taskType,
      taskStartTime: taskStartTime ?? this.taskStartTime,
      taskEndTime: taskEndTime ?? this.taskEndTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tasks': tasks?.map((x) => x.toMap()).toList(),
      'taskName': taskName,
      'taskType': taskType,
      'taskStartTime': taskStartTime?.millisecondsSinceEpoch,
      'taskEndTime': taskEndTime?.millisecondsSinceEpoch,
    };
  }

  factory Dinacharjya.fromMap(Map<String, dynamic> map) {
    return Dinacharjya(
      id: map['id'],
      tasks: map['tasks'] != null
          ? List<Task>.from(map['tasks']?.map((x) => Task.fromMap(x)))
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

  factory Dinacharjya.fromJson(Map<String, Object?> json) => Dinacharjya(
        id: json[DinacharjyaFields.id] as String,
        taskName: json[DinacharjyaFields.taskName] as String,
        taskType: json[DinacharjyaFields.taskType] as TaskType,
        tasks: json[DinacharjyaFields.taskType] as List<Task>,
        taskStartTime: json[DinacharjyaFields.taskStartTime] as DateTime,
        taskEndTime: json[DinacharjyaFields.taskEndTime] as DateTime,
      );

  // factory Dinacharjya.fromJson(String source) =>
  //     Dinacharjya.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Dinacharjya(id: $id, tasks: $tasks, taskName: $taskName, taskType: $taskType, taskStartTime: $taskStartTime, taskEndTime: $taskEndTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Dinacharjya &&
        other.id == id &&
        listEquals(other.tasks, tasks) &&
        other.taskName == taskName &&
        other.taskType == taskType &&
        other.taskStartTime == taskStartTime &&
        other.taskEndTime == taskEndTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        tasks.hashCode ^
        taskName.hashCode ^
        taskType.hashCode ^
        taskStartTime.hashCode ^
        taskEndTime.hashCode;
  }
}
