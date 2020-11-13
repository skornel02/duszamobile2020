// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Car _$CarFromJson(Map<String, dynamic> json) {
  return Car(
    json['id'] as String,
    json['name'] as String,
    json['image'] as String,
    (json['repairs'] as List)
        ?.map((e) =>
            e == null ? null : Repair.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['refuels'] as List)
        ?.map((e) =>
            e == null ? null : Refuel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['reminds'] as List)
        ?.map((e) =>
            e == null ? null : Reminder.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['cost'] as num)?.toDouble(),
    json['year'] as int,
  );
}

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'repairs': instance.repairs,
      'refuels': instance.refuels,
      'reminds': instance.reminds,
      'cost': instance.cost,
      'year': instance.year,
    };
