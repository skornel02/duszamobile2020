// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Car _$CarFromJson(Map<String, dynamic> json) {
  return Car(
    json['id'] as String,
    json['name'] as String,
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
    (json['eVignettes'] as List)
        ?.map((e) =>
            e == null ? null : EVignette.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    _$enumDecodeNullable(_$TireTypeEnumMap, json['tire']),
    json['settings'] == null
        ? null
        : CarSettings.fromJson(json['settings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'repairs': instance.repairs,
      'refuels': instance.refuels,
      'reminds': instance.reminds,
      'eVignettes': instance.eVignettes,
      'tire': _$TireTypeEnumMap[instance.tire],
      'settings': instance.settings,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$TireTypeEnumMap = {
  TireType.NOT_SPECIFIED: 'NotSpecified',
  TireType.WINTER: 'Winter',
  TireType.SUMMER: 'Summer',
  TireType.ALL_YEAR: 'AllYear',
};
