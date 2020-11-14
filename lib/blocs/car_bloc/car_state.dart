part of 'car_bloc.dart';

abstract class CarState extends Equatable {
  const CarState();
}

class InitialState extends CarState {
  @override
  List<Object> get props => [];
}

class ReadyState extends CarState {
  final Car car;

  ReadyState(this.car);

  @override
  List<Object> get props => [car];
}

class CarNotFoundState extends CarState {
  CarNotFoundState();

  @override
  List<Object> get props => [];
}
