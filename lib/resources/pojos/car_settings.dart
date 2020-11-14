import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'car_settings.g.dart';

@JsonSerializable()
@immutable
class CarSettings {
  /// Base64 encoded
  final String image;
  final double cost;
  final int year;

  CarSettings.create(
      {@required this.image, @required this.cost, @required this.year});

  CarSettings(this.image, this.cost, this.year);

  /// Static copy constructor with overriding.
  factory CarSettings.from(
    CarSettings settings, {
    String image,
    double cost,
    int year,
  }) {
    return CarSettings.create(
        image: image ?? settings.image,
        cost: cost ?? settings.cost,
        year: year ?? settings.year);
  }

  @override
  factory CarSettings.fromJson(Map<String, dynamic> json) =>
      _$CarSettingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CarSettingsToJson(this);
}
