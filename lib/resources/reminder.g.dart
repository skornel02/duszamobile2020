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
    (json['items'] as List)?.map((e) => e as String)?.toList(),
    json['date'] == null ? null : DateTime.parse(json['date'] as String),
    json['afterDays'] as int,
    json['startMilage'] as int,
    json['afterMilage'] as int,
    json['completed'] as bool,
  );
}

Map<String, dynamic> _$ReminderToJson(Reminder instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'items': instance.items,
      'date': instance.date?.toIso8601String(),
      'afterDays': instance.afterDays,
      'startMilage': instance.startMilage,
      'afterMilage': instance.afterMilage,
      'completed': instance.completed,
    };
