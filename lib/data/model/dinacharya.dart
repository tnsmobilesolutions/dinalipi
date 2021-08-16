import 'dart:convert';

import 'package:dinalipi/data/model/task.dart';
import 'package:flutter/foundation.dart';

class Dinacharya {
  List<Task> tasks;
  Dinacharya({
    required this.tasks,
  });

  Dinacharya copyWith({
    List<Task>? tasks,
  }) {
    return Dinacharya(
      tasks: tasks ?? this.tasks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tasks': tasks.map((x) => x.toMap()).toList(),
    };
  }

  factory Dinacharya.fromMap(Map<String, dynamic> map) {
    return Dinacharya(
      tasks: List<Task>.from(map['tasks']?.map((x) => Task.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Dinacharya.fromJson(String source) =>
      Dinacharya.fromMap(json.decode(source));

  @override
  String toString() => 'Dinacharya(tasks: $tasks)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Dinacharya && listEquals(other.tasks, tasks);
  }

  @override
  int get hashCode => tasks.hashCode;
}
