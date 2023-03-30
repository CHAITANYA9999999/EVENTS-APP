part of 'specificevent_bloc.dart';

abstract class SpecificeventState extends Equatable {}

class SpecificeventLoading extends SpecificeventState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SpecificeventLoaded extends SpecificeventState {
  final List<SingleEvent> events;

  SpecificeventLoaded(this.events);

  @override
  // TODO: implement props
  List<Object?> get props => [...events];
}
