part of 'repair_bloc.dart';

abstract class RepairEvent extends Equatable {
  const RepairEvent();
}

class SaveRepair extends RepairEvent {
  final Repair repair;
  SaveRepair(this.repair);

  @override
  List<Object> get props => [repair];
}

class CancelRepair extends RepairEvent {
  CancelRepair();

  @override
  List<Object> get props => [];
}