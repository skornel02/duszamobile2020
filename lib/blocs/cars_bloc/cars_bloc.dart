import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:duszamobile2020/resources/pojos/car.dart';
import 'package:equatable/equatable.dart';

part 'cars_event.dart';
part 'cars_state.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  CarsBloc() : super(InitialState());

  @override
  Stream<CarsState> mapEventToState(
    CarsEvent event,
  ) async* {

  }
}
