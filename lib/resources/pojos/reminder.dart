import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'reminder.g.dart';

@JsonSerializable()
@immutable
class Reminder extends Equatable {
  final String id;
  final String name;
  final String description;
  final List<String> items;
  final DateTime date;
  final int afterDays;
  final int startMilage;
  final int afterMilage;
  final bool completed;

  Reminder.create(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.items,
      @required this.date,
      this.afterDays,
      @required this.startMilage,
      this.afterMilage,
      @required this.completed});

  Reminder(this.id, this.name, this.description, this.items, this.date,
      this.afterDays, this.startMilage, this.afterMilage, this.completed);

  /// Static copy constructor with overriding.
  factory Reminder.from(
    Reminder reminder, {
    String id,
    String name,
    String description,
    List<String> items,
    DateTime date,
    int afterDays,
    int startMilage,
    int afterMilage,
    bool completed,
  }) {
    return Reminder.create(
        id: id ?? reminder.id,
        name: name ?? reminder.name,
        description: description ?? reminder.description,
        items: items ?? reminder.items,
        date: date ?? reminder.date,
        afterDays: afterDays ?? reminder.afterDays,
        startMilage: startMilage ?? reminder.startMilage,
        afterMilage: afterMilage ?? reminder.afterMilage,
        completed: completed ?? reminder.completed);
  }

  bool _isDueToDate(DateTime date) {
    if (afterDays == null) return false;
    var dueDateTime = this.date.add(Duration(days: afterDays));
    var dateDate = DateTime.utc(date.year, date.month, date.day);
    var dueDate =
        DateTime.utc(dueDateTime.year, dueDateTime.month, dueDateTime.day);
    return dateDate.isAtSameMomentAs(dueDate) || dateDate.isAfter(dueDate);
  }

  bool _isDueToMilage(int milage) {
    if (afterMilage == null) return false;
    var milageDifference = milage - this.startMilage;
    return milageDifference > afterMilage;
  }

  bool isDue(DateTime date, int milage) {
    if (completed) return false;
    return _isDueToDate(date) || _isDueToMilage(milage);
  }

  Reminder getSuggestion(DateTime date, int milage) {
    return Reminder.from(this,
        id: Uuid().v4(), date: date, startMilage: milage, completed: false);
  }

  @override
  factory Reminder.fromJson(Map<String, dynamic> json) =>
      _$ReminderFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ReminderToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
        description,
        items,
        date,
        afterDays,
        startMilage,
        afterMilage,
        completed
      ];

  @override
  bool get stringify => true;
}
