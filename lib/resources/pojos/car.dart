import 'package:duszamobile2020/resources/pojos/refuel.dart';
import 'package:duszamobile2020/resources/pojos/reminder.dart';
import 'package:duszamobile2020/resources/pojos/repair.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'car.g.dart';

@JsonSerializable()
@immutable
class Car {
  final String id;
  final String name;
  final String image; //Base64
  final List<Repair> repairs;
  final List<Refuel> refuels;
  final List<Reminder> reminds;
  final double cost;
  final int year;

  Car(
      {@required this.id,
      @required this.name,
      @required this.image,
      @required this.repairs,
      @required this.refuels,
      @required this.reminds,
      @required this.cost,
      @required this.year});

  /// Static copy constructor with overriding.
  factory Car.from(Car car,
      {String id,
      String name,
      String image,
      List<Repair> repairs,
      List<Refuel> refuels,
      List<Reminder> reminds,
      double cost,
      int year}) {
    return Car(
        id: id ?? car.id,
        name: name ?? car.name,
        image: image ?? car.image,
        repairs: repairs ?? car.repairs,
        refuels: refuels ?? car.refuels,
        reminds: reminds ?? car.reminds,
        cost: cost ?? car.cost,
        year: year ?? car.year);
  }

  int get totalMilage {
    if (refuels.isEmpty) {
      return 0;
    } else {
      return refuels[refuels.length - 1].milage;
    }
  }

  double get runningCost {
    double totalRepairs = 0;
    for (var repair in repairs) {
      totalRepairs += repair.price;
    }
    return totalRepairs;
  }

  double get totalCost => this.cost + runningCost;

  @override
  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CarToJson(this);
}
