part of 'evignette_bloc.dart';

abstract class EVignetteEvent extends Equatable {
  const EVignetteEvent();
}

class SaveEVignette extends EVignetteEvent {
  final EVignette eVignette;
  SaveEVignette(this.eVignette);

  @override
  List<Object> get props => [eVignette];
}

class CancelEVignette extends EVignetteEvent {
  CancelEVignette();

  @override
  List<Object> get props => [];
}
