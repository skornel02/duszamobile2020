part of 'google_bloc.dart';

abstract class GoogleEvent extends Equatable {
  const GoogleEvent();

  @override
  List<Object> get props => [];
}

class GoogleLoginButtonPressedEvent extends GoogleEvent {
  const GoogleLoginButtonPressedEvent();

  @override
  List<Object> get props => ["googleButtonPressed"];
}

class GoogleUpdateEvent extends GoogleEvent {
  const GoogleUpdateEvent();

  @override
  String toString() => 'googleUpdateAccessToken';
}

class GoogleLogoutButtonPressedEvent extends GoogleEvent {
  const GoogleLogoutButtonPressedEvent();

  @override
  List<Object> get props => ["signoutButtonPressed"];
}

class GoogleSynchronizeEvent extends GoogleEvent {
  const GoogleSynchronizeEvent();

  @override
  List<Object> get props => ["synchronizeEvent"];
}
