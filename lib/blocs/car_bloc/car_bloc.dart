import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/resources/pojos/car.dart';
import 'package:duszamobile2020/resources/pojos/car_settings.dart';
import 'package:duszamobile2020/resources/pojos/e_vignette.dart';
import 'package:duszamobile2020/resources/pojos/refuel.dart';
import 'package:duszamobile2020/resources/pojos/reminder.dart';
import 'package:duszamobile2020/resources/pojos/repair.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  String _carId;
  CarRepository _repo;

  CarBloc({@required String carId, @required CarRepository repo})
      : super(InitialState()) {
    _carId = carId;
    _repo = repo;
    repo.getCar(carId).then((car) {
      if (car != null) {
        this.add(CarFound(car));
      } else {
        this.add(CarNotFound());
      }
    }).catchError((err) {
      printError("Couldn't load car because: $err");
      this.add(CarNotFound());
    });
  }

  @override
  Stream<CarState> mapEventToState(
    CarEvent event,
  ) async* {
    if (event is CarNotFound) {
      yield CarNotFoundState();
    } else if (event is CarFound) {
      yield ReadyState(event.car);
    } else if (event is UpdateSettings) {
      Car original = await _repo.getCar(_carId);
      Car next = Car.from(original, settings: event.settings);
      _repo.updateCar(next);
      yield ReadyState(next);
    }
  }
}
