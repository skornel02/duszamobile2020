import 'package:duszamobile2020/provider/car_provider.dart';
import 'package:duszamobile2020/resources/car.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarsCubit extends Cubit<List<Car>> {
  CarsCubit() : super([]);

  void nextState(List<Car> cars) => emit(cars);
}

class CarRepository {
  CarProvider _provider;
  CarsCubit carsCubit;

  CarRepository() {
    if (kIsWeb) {
      _provider = WebCarProvider();
    } else {
      _provider = FileCarProvider();
    }

    carsCubit = CarsCubit();
    _provider.loadCars().then((value) => carsCubit.nextState(value));
  }

  Future<List<Car>> getCars() async {
    return carsCubit.state;
  }

  /// Returns null if car is not found
  Future<Car> getCar(String id) async {
    var cars = await getCars();
    for (var car in cars) {
      if (car.id == id) return car;
    }
    return null;
  }

  Future<DateTime> lastModified() {
    return _provider.lastModified();
  }

  Future<void> updateCar(Car car) async {
    if (car.id == null) throw "CAN ID CAN'T BE NULL, INVALID UPDATE CAR!";

    var cars = await getCars();
    int index = -1;
    for (int i = 0; i < cars.length; i++) {
      var matching = cars[i];
      if (matching.id == car.id) {
        index = i;
        break;
      }
    }
    List<Car> newCars;
    print("INDEX: $index");
    if (index == -1) {
      newCars = List<Car>.from(cars)..add(car);
    } else {
      newCars = List<Car>.from(cars)..replaceRange(index, index + 1, [car]);
    }

    await updateCars(newCars);
  }

  Future<void> removeCar(Car car) {
    return removeCarById(car.id);
  }

  Future<void> removeCarById(String id) async {
    var cars = await getCars();
    List<Car> newCars = List();
    for (var matching in cars) {
      if (matching.id != id) newCars.add(matching);
    }

    await updateCars(newCars);
  }

  Future<void> updateCars(List<Car> cars) async {
    carsCubit.nextState(cars);
    await _provider.saveCars(cars);
  }
}
