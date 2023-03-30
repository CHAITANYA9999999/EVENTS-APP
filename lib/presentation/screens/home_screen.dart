import 'package:events_app/blocks/bloc/events_bloc.dart';
import 'package:events_app/blocks/bloc/specificevent_bloc.dart';
import 'package:events_app/data/models/single_event.dart';
import 'package:events_app/data/repository/events_repository.dart';
import 'package:events_app/presentation/screens/event_details.dart';
import 'package:events_app/presentation/screens/search_event.dart';
import 'package:events_app/presentation/widgets/event_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Events',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              onPressed: () {
                // BlocProvider(
                //   create: ((context) {
                //     SpecificeventBloc(EventRepository())
                //       ..add(LoadSpecificEvent());
                //   }),
                //   child: SearchEvent(),
                // );
                Navigator.of(context).pushNamed(SearchEvent.routeName);
              },
              icon: Icon(Icons.search),
            ),
            PopupMenuButton(itemBuilder: ((context) {
              return [];
            }))
          ]),
      body: BlocBuilder<EventsBloc, EventsState>(builder: ((context, state) {
        print(state);
        if (state is EventsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is EventsLoaded) {
          List<SingleEvent> eventsList = state.events;
          return ListView.builder(
            itemBuilder: ((_, index) {
              return EventTile(eventsList[index]);
            }),
            itemCount: eventsList.length,
          );
        }
        return Text('');
      })),
    );
  }
}
