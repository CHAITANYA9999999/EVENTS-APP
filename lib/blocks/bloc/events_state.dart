part of 'events_bloc.dart';

abstract class EventsState extends Equatable {}

class EventsLoading extends EventsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EventsLoaded extends EventsState {
  final List<SingleEvent> events;

  EventsLoaded(this.events);
  @override
  // TODO: implement props
  List<Object?> get props => [...events];
}
