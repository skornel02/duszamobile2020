part of 'reminder_bloc.dart';

abstract class ReminderEvent extends Equatable {
  const ReminderEvent();
}

class SaveReminder extends ReminderEvent {
  final Reminder reminder;
  SaveReminder(this.reminder);

  @override
  List<Object> get props => [reminder];
}

class CancelReminder extends ReminderEvent {
  CancelReminder();

  @override
  List<Object> get props => [];
}