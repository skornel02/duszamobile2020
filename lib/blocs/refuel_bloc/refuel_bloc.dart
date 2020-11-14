import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:duszamobile2020/blocs/states/states.dart';
import 'package:duszamobile2020/resources/pojos/refuel.dart';
import 'package:equatable/equatable.dart';

part 'refuel_event.dart';

class RefuelBloc extends Bloc<RefuelEvent, State> {
  RefuelBloc() : super(InitialState());

  @override
  Stream<State> mapEventToState(
    RefuelEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
