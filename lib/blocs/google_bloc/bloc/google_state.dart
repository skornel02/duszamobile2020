part of 'google_bloc.dart';

abstract class GoogleState extends Equatable {
  const GoogleState();

  @override
  List<Object> get props => [];
}

class GoogleReadyToLoginState extends GoogleState {
  const GoogleReadyToLoginState();

  @override
  List<Object> get props => ["ready"];
}

class GoogleLoginWaitingState extends GoogleState {
  const GoogleLoginWaitingState();

  @override
  List<Object> get props => ["waiting"];
}

class GoogleLoginSuccessfulState extends GoogleState {
  final String email;
  final String accessToken;
  final Map<String, String> headers;

  const GoogleLoginSuccessfulState(this.email, this.accessToken, this.headers);

  @override
  List<Object> get props => [email, accessToken];
}
