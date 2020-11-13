// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reminder _$ReminderFromJson(Map<String, dynamic> json) {
  return Reminder(
    json['id'] as String,
    json['name'] as String,
    json['description'] as String,
    json['date'] == null ? null : DateTime.parse(json['date'] as String),
    json['milage'] as int,
    json['recurringDate'] as String,
    json['startMilageOffset'] as int,
    json['everyMilage'] as int,
  );
}

Map<String, dynamic> _$ReminderToJson(Reminder instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'date': instance.date?.toIso8601String(),
      'milage': instance.milage,
      'recurringDate': instance.recurringDate,
      'startMilageOffset': instance.startMilageOffset,
      'everyMilage': instance.everyMilage,
    };
