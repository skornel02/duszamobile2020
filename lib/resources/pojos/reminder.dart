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
      @required this.afterDays,
      @required this.startMilage,
      @required this.afterMilage,
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
        afterMilage: afterMilage ?? reminder.afterDays,
        completed: completed ?? reminder.completed);
  }

  bool isDue(DateTime date, int milage) => false;

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
