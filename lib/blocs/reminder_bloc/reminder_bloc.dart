import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:duszamobile2020/resources/pojos/reminder.dart';
import 'package:equatable/equatable.dart';

part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  ReminderBloc() : super(ReminderInitial());

  @override
  Stream<ReminderState> mapEventToState(
    ReminderEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
