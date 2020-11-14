import 'package:equatable/equatable.dart';

abstract class State extends Equatable {
	const State();
}

class InitialState extends State {
	InitialState();

	@override
	List<Object> get props => [];
}

class AddedState extends State {
	AddedState();

	@override
	List<Object> get props => [];
}

class ErrorState extends State {
	ErrorState();

	@override
	List<Object> get props => [];
}