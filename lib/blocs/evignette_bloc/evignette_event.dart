part of 'evignette_bloc.dart';

abstract class EVignetteEvent extends Equatable {
  const EVignetteEvent();
}

class SaveEVignette extends EVignetteEvent {
  final EVignette eVignette;
  SaveReminder(this.eVignette);

  @override
  List<Object> get props => [eVignette];
}

class CancelEVignette extends EVignetteEvent {
  EVignetteReminder();

  @override
  List<Object> get props => [];
}