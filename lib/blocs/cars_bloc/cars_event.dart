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

class RefreshCars extends CarsEvent {
  RefreshCars();

  @override
  List<Object> get props => ["carsEvent"];
}
