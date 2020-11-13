// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refuel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Refuel _$RefuelFromJson(Map<String, dynamic> json) {
  return Refuel(
    json['id'] as String,
    (json['refueled'] as num)?.toDouble(),
    (json['paid'] as num)?.toDouble(),
    json['lastMilage'] as int,
    json['milage'] as int,
  );
}

Map<String, dynamic> _$RefuelToJson(Refuel instance) => <String, dynamic>{
      'id': instance.id,
      'refueled': instance.refueled,
      'paid': instance.paid,
      'lastMilage': instance.lastMilage,
      'milage': instance.milage,
    };
