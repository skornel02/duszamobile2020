import 'package:duszamobile2020/resources/pojos/car_settings.dart';
import 'package:duszamobile2020/resources/pojos/e_vignette.dart';
import 'package:duszamobile2020/resources/pojos/refuel.dart';
import 'package:duszamobile2020/resources/pojos/reminder.dart';
import 'package:duszamobile2020/resources/pojos/repair.dart';
import 'package:duszamobile2020/resources/pojos/tire_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'car.g.dart';

@JsonSerializable()
@immutable
class Car extends Equatable {
  final String id;
  final String name;
  final List<Repair> repairs;
  final List<Refuel> refuels;
  final List<Reminder> reminds;
  final List<EVignette> eVignettes;
  final TireType tire;
  final CarSettings settings;

  Car.create(
      {@required this.id,
      @required this.name,
      @required this.repairs,
      @required this.refuels,
      @required this.reminds,
      @required this.eVignettes,
      @required this.tire,
      @required this.settings});

  Car(this.id, this.name, this.repairs, this.refuels, this.reminds,
      this.eVignettes, this.tire, this.settings);

  /// Static copy constructor with overriding.
  factory Car.from(
    Car car, {
    String id,
    String name,
    List<Repair> repairs,
    List<Refuel> refuels,
    List<Reminder> reminds,
    List<EVignette> eVignettes,
    TireType tire,
    CarSettings settings,
  }) {
    return Car.create(
        id: id ?? car.id,
        name: name ?? car.name,
        repairs: repairs ?? car.repairs,
        refuels: refuels ?? car.refuels,
        reminds: reminds ?? car.reminds,
        eVignettes: eVignettes ?? car.eVignettes,
        tire: tire ?? car.tire,
        settings: settings ?? car.settings);
  }

  Car.fromName(this.name)
      : id = Uuid().v4(),
        repairs = List(),
        refuels = List(),
        reminds = List(),
        eVignettes = List(),
        tire = TireType.NOT_SPECIFIED,
        settings = CarSettings.basic();

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

  double get totalCost => settings.cost + runningCost;

  @override
  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CarToJson(this);

  @override
  List<Object> get props =>
      [id, name, repairs, refuels, reminds, eVignettes, tire, settings];

  @override
  bool get stringify => true;
}
