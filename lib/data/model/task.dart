import 'dart:convert';
import 'package:dinalipi/data/model/utility.dart';
import 'package:flutter/material.dart';

class Task {
  String taskName;
  TimeOfDay startTime;
  TimeOfDay endTime;

  Task({
    required this.taskName,
    required this.startTime,
    required this.endTime,
  });

  Task copyWith({
    String? taskName,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
  }) {
    return Task(
      taskName: taskName ?? this.taskName,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'taskName': taskName,
      'startTime': Utility.timeOfDayString(
          startTime), // TODO: need to check this if toString() works
      'endTime': Utility.timeOfDayString(
          endTime), // TODO: need to check this if toString() works
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      taskName: map['taskName'],
      startTime: Utility.getTimeOfDay(map['startTime']),
      endTime: Utility.getTimeOfDay(map['endTime']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() =>
      'Task(taskName: $taskName, startTime: $startTime, endTime: $endTime)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.taskName == taskName &&
        other.startTime == startTime &&
        other.endTime == endTime;
  }

  @override
  int get hashCode => taskName.hashCode ^ startTime.hashCode ^ endTime.hashCode;
}
