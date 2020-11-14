import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:duszamobile2020/blocs/states/states.dart';
import 'package:duszamobile2020/resources/pojos/car.dart';
import 'package:equatable/equatable.dart';

part 'add_car_event.dart';

class AddCarBloc extends Bloc<AddCarEvent, State> {
  AddCarBloc() : super(InitialState());

  @override
  Stream<State> mapEventToState(
    AddCarEvent event,
  ) async* {

  }
}
