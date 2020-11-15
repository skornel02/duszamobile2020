// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repair _$RepairFromJson(Map<String, dynamic> json) {
  return Repair(
    json['id'] as String,
    json['date'] == null ? null : DateTime.parse(json['date'] as String),
    json['milage'] as int,
    (json['price'] as num)?.toDouble(),
    json['reason'] as String,
    (json['items'] as List)?.map((e) => e as String)?.toList(),
    json['description'] as String,
    json['warranty'] as bool,
  );
}

Map<String, dynamic> _$RepairToJson(Repair instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'milage': instance.milage,
      'price': instance.price,
      'reason': instance.reason,
      'items': instance.items,
      'description': instance.description,
      'warranty': instance.warranty,
    };
