import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:events_app/data/models/single_event.dart';
import 'package:events_app/data/repository/events_repository.dart';
import 'package:flutter/cupertino.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final EventRepository _eventRepository;

  EventsBloc(this._eventRepository) : super(EventsLoading()) {
    on<LoadAllEvent>((event, emit) async {
      emit(EventsLoading());
      try {
        final loadedevent = await _eventRepository.getEvents();
        emit(EventsLoaded(loadedevent));
      } catch (e) {}
    });
  }
}
