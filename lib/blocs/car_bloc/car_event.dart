part of 'car_bloc.dart';

abstract class CarEvent extends Equatable {
  const CarEvent();
}

class CarNotFound extends CarEvent {
  CarNotFound();
  @override
  List<Object> get props => [];
}

class UpdateSettings extends CarEvent {
  final CarSettings settings;
  UpdateSettings(this.settings);

  @override
  List<Object> get props => [settings];
}

//region Refuel
class AddRefuelItem extends CarEvent {
  final Refuel refuel;
  AddRefuelItem(this.refuel);

  @override
  List<Object> get props => [refuel];
}

class UpdateRefuelItem extends CarEvent {
  final String id;
  final Refuel refuel;
  UpdateRefuelItem(this.id, this.refuel);

  @override
  List<Object> get props => [id, refuel];
}

class RemoveRefuelItem extends CarEvent {
  final String id;
  RemoveRefuelItem(this.id);

  @override
  List<Object> get props => [id];
}
//endregion

//region Repair
class AddRepairItem extends CarEvent {
  final Repair repair;
  AddRepairItem(this.repair);

  @override
  List<Object> get props => [repair];
}

class UpdateRepairItem extends CarEvent {
  final String id;
  final Repair repair;
  UpdateRepairItem(this.id, this.repair);

  @override
  List<Object> get props => [id, repair];
}

class RemoveRepairItem extends CarEvent {
  final String id;
  RemoveRepairItem(this.id);

  @override
  List<Object> get props => [id];
}
//endregion

//region Reminder
class AddReminderItem extends CarEvent {
  final Reminder reminder;
  AddReminderItem(this.reminder);

  @override
  List<Object> get props => [reminder];
}

class UpdateReminderItem extends CarEvent {
  final String id;
  final Reminder reminder;
  UpdateReminderItem(this.id, this.reminder);

  @override
  List<Object> get props => [id, reminder];
}

class RemoveReminderItem extends CarEvent {
  final String id;
  RemoveReminderItem(this.id);

  @override
  List<Object> get props => [id];
}
//endregion

//region EVignette
class AddEVignetteItem extends CarEvent {
  final EVignette eVignette;
  AddEVignetteItem(this.eVignette);

  @override
  List<Object> get props => [eVignette];
}

class UpdateEVignetteItem extends CarEvent {
  final String id;
  final EVignette eVignette;
  UpdateEVignetteItem(this.id, this.eVignette);

  @override
  List<Object> get props => [id, eVignette];
}

class RemoveEVignetteItem extends CarEvent {
  final String id;
  RemoveEVignetteItem(this.id);

  @override
  List<Object> get props => [id];
}
//endregion