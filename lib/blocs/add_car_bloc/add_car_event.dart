part of 'add_car_bloc.dart';

abstract class AddCarEvent extends Equatable {
  const AddCarEvent();
}

class SaveCar extends AddCarEvent {
  final Car car;
  SaveCar(this.car);

  @override
  List<Object> get props => [car];
}


class CancelCar extends AddCarEvent {
  CancelCar();

  @override
  List<Object> get props => [];
}