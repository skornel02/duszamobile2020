part of 'cars_bloc.dart';

abstract class CarsEvent extends Equatable {
  const CarsEvent();
}

class CarsLoaded extends CarsEvent {
  final List<Car> cars;
  CarsLoaded(this.cars);

  @override
  List<Object> get props => [cars];
}

class OnSelectCar extends CarsEvent {
  final String uuid;
  OnSelectCar(this.uuid);

  @override
  List<Object> get props => [uuid];
}

class OnAddCar extends CarsEvent {
  OnAddCar();

  @override
  List<Object> get props => [];
}