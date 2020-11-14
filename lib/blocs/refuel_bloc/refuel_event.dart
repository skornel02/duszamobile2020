part of 'refuel_bloc.dart';

abstract class RefuelEvent extends Equatable {
  const RefuelEvent();
}

class SaveRefuel extends RefuelEvent {
  final Refuel refuel;
  SaveRefuel(this.refuel);

  @override
  List<Object> get props => [refuel];
}


class CancelRefuel extends RefuelEvent {
  CancelRefuel();

  @override
  List<Object> get props => [];
}