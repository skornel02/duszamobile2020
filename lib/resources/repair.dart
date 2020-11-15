import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repair.g.dart';

@JsonSerializable()
@immutable
class Repair extends Equatable {
  final String id;
  final DateTime date;
  final int milage;
  final double price;

  final String reason;
  final List<String> items;
  final String description;
  final bool warranty;

  Repair.create({
    @required this.id,
    @required this.date,
    @required this.milage,
    @required this.price,
    @required this.reason,
    @required this.items,
    @required this.description,
    @required this.warranty,
  });

  Repair(
    this.id,
    this.date,
    this.milage,
    this.price,
    this.reason,
    this.items,
    this.description,
    this.warranty,
  );

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
    bool warranty,
  }) {
    return Repair.create(
        id: id ?? repair.id,
        date: date ?? repair.date,
        milage: milage ?? repair.milage,
        price: price ?? repair.price,
        reason: reason ?? repair.reason,
        items: items ?? repair.items,
        description: description ?? repair.description,
        warranty: warranty ?? repair.warranty);
  }

  @override
  factory Repair.fromJson(Map<String, dynamic> json) => _$RepairFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RepairToJson(this);

  @override
  List<Object> get props =>
      [id, date, milage, price, reason, items, description, warranty];

  @override
  bool get stringify => true;
}
