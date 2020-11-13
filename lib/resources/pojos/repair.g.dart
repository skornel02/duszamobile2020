// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repair _$RepairFromJson(Map<String, dynamic> json) {
  return Repair(
    json['id'] as String,
    json['reason'] as String,
    json['date'] == null ? null : DateTime.parse(json['date'] as String),
    json['milage'] as int,
    (json['price'] as num)?.toDouble(),
    (json['items'] as List)?.map((e) => e as String)?.toList(),
    json['description'] as String,
  );
}

Map<String, dynamic> _$RepairToJson(Repair instance) => <String, dynamic>{
      'id': instance.id,
      'reason': instance.reason,
      'date': instance.date?.toIso8601String(),
      'milage': instance.milage,
      'price': instance.price,
      'items': instance.items,
      'description': instance.description,
    };
