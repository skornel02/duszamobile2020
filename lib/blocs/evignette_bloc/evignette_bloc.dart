import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:duszamobile2020/blocs/states/states.dart';
import 'package:equatable/equatable.dart';

part 'evignette_event.dart';

class EVignetteBloc extends Bloc<EVignetteEvent, State> {
  EVignetteBloc() : super(InitialState());

  @override
  Stream<State> mapEventToState(
    EVignetteEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
