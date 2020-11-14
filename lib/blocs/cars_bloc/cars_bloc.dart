import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/resources/pojos/car.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

part 'cars_event.dart';
part 'cars_state.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  CarRepository _repository;
  StreamSubscription _carsSubscription;

  CarsBloc(this._repository) : super(InitialState()) {
    _repository.getCars().then((cars) {
      this.add(CarsLoaded(cars));
    }).catchError((_err, stacktrace) {
      printError("Car loading faled!!!");
      printError(stacktrace);
      this.add(CarsLoaded([]));
    });

    _carsSubscription = _repository.carsCubit.listen((cars) {
      this.add(CarsLoaded(cars));
    });
  }

  @override
  Future<void> close() {
    _carsSubscription.cancel();
    return super.close();
  }

  @override
  Stream<CarsState> mapEventToState(
    CarsEvent event,
  ) async* {
    print('event $event');
    if (event is CarsLoaded) {
      yield ReadyState(event.cars);
    } else if (event is RefreshCars) {
      print("refreshing...");
      yield ReadyState(await _repository.getCars());
    }
  }
}
