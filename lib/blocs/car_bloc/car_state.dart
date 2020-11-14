part of 'car_bloc.dart';

abstract class CarState extends Equatable {
  const CarState();
}

class InitialState extends CarState {
  @override
  List<Object> get props => [];
}

class ReadyState extends CarState {

  final List<Car> cars;

  ReadyState(this.cars);

  @override
  List<Object> get props => [cars];
}

class CarNotFoundState extends CarState {
  CarNotFoundState();

  @override
  List<Object> get props => [];
}
