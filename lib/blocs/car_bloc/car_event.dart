part of 'car_bloc.dart';

abstract class CarEvent extends Equatable {
  const CarEvent();
}

class CarFound extends CarEvent {
  final Car car;
  CarFound(this.car);

  List<Object> get props => [car];
}

class CarNotFound extends CarEvent {
  CarNotFound();
  @override
  List<Object> get props => ["carNotFound"];
}

class UpdateSettings extends CarEvent {
  final CarSettings settings;
  UpdateSettings(this.settings);

  @override
  List<Object> get props => [settings];
}

//region Refuel
class SaveRefuelItem extends CarEvent {
  final Refuel refuel;
  SaveRefuelItem(this.refuel);

  @override
  List<Object> get props => [refuel];
}

class RemoveRefuelItem extends CarEvent {
  final String id;
  RemoveRefuelItem(this.id);

  @override
  List<Object> get props => [id];
}
//endregion

//region Repair
class SaveRepairItem extends CarEvent {
  final Repair repair;
  SaveRepairItem(this.repair);

  @override
  List<Object> get props => [repair];
}

class RemoveRepairItem extends CarEvent {
  final String id;
  RemoveRepairItem(this.id);

  @override
  List<Object> get props => [id];
}
//endregion

//region Reminder
class SaveReminderItem extends CarEvent {
  final Reminder reminder;
  SaveReminderItem(this.reminder);

  @override
  List<Object> get props => [reminder];
}

class RemoveReminderItem extends CarEvent {
  final String id;
  RemoveReminderItem(this.id);

  @override
  List<Object> get props => [id];
}
//endregion

//region EVignette
class SaveEVignetteItem extends CarEvent {
  final EVignette eVignette;
  SaveEVignetteItem(this.eVignette);

  @override
  List<Object> get props => [eVignette];
}

class RemoveEVignetteItem extends CarEvent {
  final String id;
  RemoveEVignetteItem(this.id);

  @override
  List<Object> get props => [id];
}
//endregion
