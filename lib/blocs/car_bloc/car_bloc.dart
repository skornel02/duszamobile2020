import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/resources/car.dart';
import 'package:duszamobile2020/resources/car_settings.dart';
import 'package:duszamobile2020/resources/e_vignette.dart';
import 'package:duszamobile2020/resources/refuel.dart';
import 'package:duszamobile2020/resources/reminder.dart';
import 'package:duszamobile2020/resources/repair.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  String _carId;
  CarRepository _repo;
  StreamSubscription _carsSubscription;

  CarBloc({String carId, @required CarRepository repo})
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
      print("ERROR Couldn't load car because: $err");
      this.add(CarNotFound());
    });

    _carsSubscription = repo.carsCubit.listen((cars) {
      Car car;
      for (Car matching in cars) {
        if (matching.id == _carId) {
          car = matching;
          break;
        }
      }
      if (car != null) {
        this.add(CarFound(car));
      } else {
        this.add(CarNotFound());
      }
    });
  }

  @override
  Future<void> close() {
    _carsSubscription.cancel();
    return super.close();
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
    } else if (event is SaveRefuelItem) {
      handleSaveRefuel(event);
    } else if (event is RemoveRefuelItem) {
      handleRemoveRefuel(event);
    } else if (event is SaveRepairItem) {
      handleSaveRepair(event);
    } else if (event is RemoveRepairItem) {
      handleRemoveRepair(event);
    } else if (event is SaveEVignetteItem) {
      handleSaveEVignette(event);
    } else if (event is RemoveEVignetteItem) {
      handleRemoveEVignette(event);
    } else if (event is SaveReminderItem) {
      handleSaveReminder(event);
    } else if (event is RemoveReminderItem) {
      handleRemoveReminder(event);
    }
  }

  void handleSaveRefuel(SaveRefuelItem event) async {
    Car original = await _repo.getCar(_carId);

    int index = -1;
    for (int i = 0; i < original.refuels.length; i++) {
      Refuel refuel = original.refuels[i];
      if (refuel.id == event.refuel.id) {
        index = i;
        break;
      }
    }

    List<Refuel> nextRefuels = List.from(original.refuels);
    if (index == -1) {
      nextRefuels.add(event.refuel);
    } else {
      nextRefuels.replaceRange(index, index + 1, [event.refuel]);
    }

    nextRefuels.sort((a, b) => a.milage.compareTo(b.milage));

    Car next = Car.from(original, refuels: nextRefuels);
    _repo.updateCar(next);
  }

  void handleRemoveRefuel(RemoveRefuelItem event) async {
    Car original = await _repo.getCar(_carId);
    List<Refuel> nextRefuels = List();
    for (int i = 0; i < original.refuels.length; i++) {
      Refuel refuel = original.refuels[i];
      if (refuel.id != event.id) nextRefuels.add(refuel);
    }
    Car next = Car.from(original, refuels: nextRefuels);
    _repo.updateCar(next);
  }

  void handleSaveReminder(SaveReminderItem event) async {
    Car original = await _repo.getCar(_carId);
    int index = -1;
    for (int i = 0; i < original.reminds.length; i++) {
      Reminder reminder = original.reminds[i];
      if (reminder.id == event.reminder.id) {
        index = i;
        break;
      }
    }
    List<Reminder> nextReminders = List.from(original.reminds);
    if (index == -1) {
      nextReminders.add(event.reminder);
    } else {
      nextReminders.replaceRange(index, index + 1, [event.reminder]);
    }
    Car next = Car.from(original, reminds: nextReminders);
    _repo.updateCar(next);
  }

  void handleRemoveReminder(RemoveReminderItem event) async {
    Car original = await _repo.getCar(_carId);
    List<Reminder> nextReminders = List();
    for (int i = 0; i < original.reminds.length; i++) {
      Reminder reminder = original.reminds[i];
      if (reminder.id != event.id) nextReminders.add(reminder);
    }
    Car next = Car.from(original, reminds: nextReminders);
    _repo.updateCar(next);
  }

  void handleSaveRepair(SaveRepairItem event) async {
    Car original = await _repo.getCar(_carId);
    int index = -1;
    for (int i = 0; i < original.repairs.length; i++) {
      Repair repair = original.repairs[i];
      if (repair.id == event.repair.id) {
        index = i;
        break;
      }
    }
    List<Repair> nextRepairs = List.from(original.repairs);
    if (index == -1) {
      nextRepairs.add(event.repair);
    } else {
      nextRepairs.replaceRange(index, index + 1, [event.repair]);
    }
    Car next = Car.from(original, repairs: nextRepairs);
    _repo.updateCar(next);
  }

  void handleRemoveRepair(RemoveRepairItem event) async {
    Car original = await _repo.getCar(_carId);
    List<Repair> nextRepairs = List();
    for (int i = 0; i < original.repairs.length; i++) {
      Repair repair = original.repairs[i];
      if (repair.id != event.id) nextRepairs.add(repair);
    }
    Car next = Car.from(original, repairs: nextRepairs);
    _repo.updateCar(next);
  }

  void handleSaveEVignette(SaveEVignetteItem event) async {
    Car original = await _repo.getCar(_carId);
    int index = -1;
    for (int i = 0; i < original.eVignettes.length; i++) {
      EVignette eVignette = original.eVignettes[i];
      if (eVignette.id == event.eVignette.id) {
        index = i;
        break;
      }
    }
    List<EVignette> nextEVignettes = List.from(original.eVignettes);
    if (index == -1) {
      nextEVignettes.add(event.eVignette);
    } else {
      nextEVignettes.replaceRange(index, index + 1, [event.eVignette]);
    }
    Car next = Car.from(original, eVignettes: nextEVignettes);
    _repo.updateCar(next);
  }

  void handleRemoveEVignette(RemoveEVignetteItem event) async {
    Car original = await _repo.getCar(_carId);
    List<EVignette> nextEVignettes = List();
    for (int i = 0; i < original.eVignettes.length; i++) {
      EVignette eVignette = original.eVignettes[i];
      if (eVignette.id != event.id) nextEVignettes.add(eVignette);
    }
    Car next = Car.from(original, eVignettes: nextEVignettes);
    _repo.updateCar(next);
  }
}
