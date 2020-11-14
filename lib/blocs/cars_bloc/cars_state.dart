part of 'cars_bloc.dart';

abstract class CarsState extends Equatable {
  const CarsState();
}

class InitialState extends CarsState {
  @override
  List<Object> get props => [];
}

class ReadyState extends CarsState {
  final Car car;

  ReadyState(this.car);

  @override
  List<Object> get props => [car];
}

