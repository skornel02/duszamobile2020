import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refuel.g.dart';

enum ConsumptionRating { BELLOW_AVERAGE, NORMAL, ABOVE_NORMAL, HIGH }

@JsonSerializable()
@immutable
class Refuel extends Equatable {
  final String id;
  final DateTime date;
  final double refueled;
  final double paid;
  final int lastMilage;
  final int milage;

  Refuel.create({
    @required this.id,
    @required this.date,
    @required this.refueled,
    @required this.paid,
    @required this.lastMilage,
    @required this.milage,
  });

  Refuel(
    this.id,
    this.date,
    this.refueled,
    this.paid,
    this.lastMilage,
    this.milage,
  );

  /// Static copy constructor with overriding.
  factory Refuel.from(
    Refuel refuel, {
    String id,
    DateTime date,
    double refueled,
    double paid,
    int lastMilage,
    int milage,
  }) {
    return Refuel.create(
      id: id ?? refuel.id,
      date: date ?? refuel.date,
      refueled: refueled ?? refuel.refueled,
      paid: paid ?? refuel.paid,
      lastMilage: lastMilage ?? refuel.lastMilage,
      milage: milage ?? refuel.milage,
    );
  }

  double get pricePerLiter => paid / refueled;

  /// Efficiency is liters per 100 km
  double get efficieny => refueled / ((milage - lastMilage) / 100);

  ConsumptionRating getConsumptionRating(double averageConsumption) {
    if (averageConsumption > efficieny) return ConsumptionRating.BELLOW_AVERAGE;
    if (averageConsumption * 1.2 > efficieny) return ConsumptionRating.NORMAL;
    if (averageConsumption * 1.6 > efficieny)
      return ConsumptionRating.ABOVE_NORMAL;
    return ConsumptionRating.HIGH;
  }

  @override
  factory Refuel.fromJson(Map<String, dynamic> json) => _$RefuelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RefuelToJson(this);

  @override
  List<Object> get props => [id, date, refueled, paid, lastMilage, milage];

  @override
  bool get stringify => true;
}
