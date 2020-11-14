import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:duszamobile2020/blocs/states/states.dart';
import 'package:duszamobile2020/resources/pojos/repair.dart';
import 'package:equatable/equatable.dart';

part 'repair_event.dart';

class RepairBloc extends Bloc<RepairEvent, State> {
  RepairBloc() : super(InitialState());

  @override
  Stream<State> mapEventToState(
    RepairEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
