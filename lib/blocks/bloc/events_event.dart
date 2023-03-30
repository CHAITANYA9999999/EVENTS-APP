part of 'events_bloc.dart';

@immutable
abstract class EventsEvent extends Equatable {
  const EventsEvent();
}

class LoadAllEvent extends EventsEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
