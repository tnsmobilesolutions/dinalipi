import 'dart:convert';

enum TaskType {
  boolean,
  number,
  string,
  singleDateTime,
  singleDateRange,
  singleDateRangeWithDuration,
  other,
}

class Task {
  String taskName;
  TaskType taskType;
  DateTime? taskDate;
  DateTime? taskStartTime;
  DateTime? taskEndTime;
  bool? boolValue;
  int? numValue;
  String? stringValue;
  DateTime? singleDateTimeValue;
  String? singleDateRangeValue;
  String? durationValue;
  String? otherValue;
  Task({
    required this.taskType,
    required this.taskName,
    this.taskDate,
    this.taskStartTime,
    this.taskEndTime,
    this.boolValue,
    this.numValue,
    this.stringValue,
    this.singleDateTimeValue,
    this.singleDateRangeValue,
    this.durationValue,
    this.otherValue,
  });

  Task copyWith({
    String? taskName,
    DateTime? taskDate,
    DateTime? taskStartTime,
    DateTime? taskEndTime,
    bool? boolValue,
    int? numValue,
    String? stringValue,
    DateTime? singleDateTimeValue,
    String? singleDateRangeValue,
    String? durationValue,
    String? otherValue,
  }) {
    return Task(
      taskType: taskType,
      taskName: taskName ?? this.taskName,
      taskDate: taskDate ?? this.taskDate,
      taskStartTime: taskStartTime ?? this.taskStartTime,
      taskEndTime: taskEndTime ?? this.taskEndTime,
      boolValue: boolValue ?? this.boolValue,
      numValue: numValue ?? this.numValue,
      stringValue: stringValue ?? this.stringValue,
      singleDateTimeValue: singleDateTimeValue ?? this.singleDateTimeValue,
      singleDateRangeValue: singleDateRangeValue ?? this.singleDateRangeValue,
      durationValue: durationValue ?? this.durationValue,
      otherValue: otherValue ?? this.otherValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'taskType': taskType,
      'taskName': taskName,
      'taskDate': taskDate?.millisecondsSinceEpoch,
      'taskStartTime': taskStartTime?.millisecondsSinceEpoch,
      'taskEndTime': taskEndTime?.millisecondsSinceEpoch,
      'boolValue': boolValue,
      'numValue': numValue,
      'stringValue': stringValue,
      'singleDateTimeValue': singleDateTimeValue?.millisecondsSinceEpoch,
      'singleDateRangeValue': singleDateRangeValue,
      'durationValue': durationValue,
      'otherValue': otherValue,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      taskType: map['taskType'],
      taskName: map['taskName'] ?? '',
      taskDate: map['taskDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['taskDate'])
          : null,
      taskStartTime: map['taskStartTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['taskStartTime'])
          : null,
      taskEndTime: map['taskEndTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['taskEndTime'])
          : null,
      boolValue: map['boolValue'],
      numValue: map['numValue']?.toInt(),
      stringValue: map['stringValue'],
      singleDateTimeValue: map['singleDateTimeValue'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['singleDateTimeValue'])
          : null,
      singleDateRangeValue: map['singleDateRangeValue'],
      durationValue: map['durationValue'],
      otherValue: map['otherValue'],
    );
  }

  toJson() => json.encode(toMap());

  Task copy({
    required String taskName,
    TaskType taskType = TaskType.boolean,
    DateTime? taskDate,
    DateTime? taskStartTime,
    DateTime? taskEndTime,
    bool? boolValue,
    int? numValue,
    String? stringValue,
    DateTime? singleDateTimeValue,
    String? singleDateRangeValue,
    String? durationValue,
    String? otherValue,
  }) =>
      Task(
        taskType: taskType,
        taskName: taskName,
        taskDate: taskDate,
        boolValue: boolValue,
        durationValue: durationValue,
        numValue: numValue,
        otherValue: otherValue,
        singleDateRangeValue: singleDateRangeValue,
        singleDateTimeValue: singleDateTimeValue,
        stringValue: stringValue,
        taskEndTime: taskEndTime,
        taskStartTime: taskStartTime,
      );

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Task(taskName: $taskName, taskDate: $taskDate, taskStartTime: $taskStartTime, taskEndTime: $taskEndTime, boolValue: $boolValue, numValue: $numValue, stringValue: $stringValue, singleDateTimeValue: $singleDateTimeValue, singleDateRangeValue: $singleDateRangeValue, durationValue: $durationValue, otherValue: $otherValue)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.taskName == taskName &&
        other.taskDate == taskDate &&
        other.taskStartTime == taskStartTime &&
        other.taskEndTime == taskEndTime &&
        other.boolValue == boolValue &&
        other.numValue == numValue &&
        other.stringValue == stringValue &&
        other.singleDateTimeValue == singleDateTimeValue &&
        other.singleDateRangeValue == singleDateRangeValue &&
        other.durationValue == durationValue &&
        other.otherValue == otherValue;
  }

  @override
  int get hashCode {
    return taskName.hashCode ^
        taskDate.hashCode ^
        taskStartTime.hashCode ^
        taskEndTime.hashCode ^
        boolValue.hashCode ^
        numValue.hashCode ^
        stringValue.hashCode ^
        singleDateTimeValue.hashCode ^
        singleDateRangeValue.hashCode ^
        durationValue.hashCode ^
        otherValue.hashCode;
  }
}
