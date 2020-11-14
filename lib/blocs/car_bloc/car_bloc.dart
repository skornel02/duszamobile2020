import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/resources/pojos/car.dart';
import 'package:duszamobile2020/resources/pojos/e_vignette.dart';
import 'package:duszamobile2020/resources/pojos/car_settings.dart';
import 'package:duszamobile2020/resources/pojos/refuel.dart';
import 'package:duszamobile2020/resources/pojos/reminder.dart';
import 'package:duszamobile2020/resources/pojos/repair.dart';
import 'package:equatable/equatable.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  CarBloc(CarRepository repo) : super(InitialState());

  @override
  Stream<CarState> mapEventToState(
    CarEvent event,
  ) async* {}
}
