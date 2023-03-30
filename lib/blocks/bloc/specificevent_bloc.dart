import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/single_event.dart';
import '../../data/repository/events_repository.dart';

part 'specificevent_event.dart';
part 'specificevent_state.dart';

class SpecificeventBloc extends Bloc<SpecificeventEvent, SpecificeventState> {
  final EventRepository _eventRepository;
  final String controller;

  SpecificeventBloc(this._eventRepository, this.controller)
      : super(SpecificeventLoading()) {
    on<LoadSpecificEvent>((event, emit) async {
      emit(SpecificeventLoading());
      try {
        final loadedevent = await _eventRepository.getEvents(controller);
        emit(SpecificeventLoaded(loadedevent));
      } catch (e) {}
    });
  }
}
