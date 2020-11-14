import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'repair.g.dart';

@JsonSerializable()
@immutable
class Repair {
  final String id;
  final DateTime date;
  final int milage;
  final double price;

  final String reason;
  final List<String> items;
  final String description;

  Repair({
    @required this.id,
    @required this.date,
    @required this.milage,
    @required this.price,
    @required this.reason,
    @required this.items,
    @required this.description,
  });

  /// Static copy constructor with overriding.
  factory Repair.from(
    Repair repair, {
    String id,
    DateTime date,
    int milage,
    double price,
    String reason,
    List<String> items,
    String description,
  }) {
    return Repair(
        id: id ?? repair.id,
        date: date ?? repair.date,
        milage: milage ?? repair.milage,
        price: price ?? repair.price,
        reason: reason ?? repair.reason,
        items: items ?? repair.items,
        description: description ?? repair.description);
  }

  @override
  factory Repair.fromJson(Map<String, dynamic> json) => _$RepairFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RepairToJson(this);
}
