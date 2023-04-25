import 'package:events_app/blocks/bloc/events_bloc.dart';
import 'package:events_app/blocks/bloc/specificevent_bloc.dart';
import 'package:events_app/data/repository/events_repository.dart';
import 'package:events_app/presentation/screens/event_details.dart';
import 'package:events_app/presentation/screens/home_screen.dart';
import 'package:events_app/presentation/screens/search_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EventsBloc>(
            create: ((context) => EventsBloc(EventRepository()))),
        BlocProvider(
            create: ((context) => SpecificeventBloc(EventRepository(), '')))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: ThemeData.light().textTheme.copyWith(
                displayMedium: const TextStyle(
                    color: Color.fromARGB(246, 81, 100, 239), fontSize: 17))),
        home: BlocProvider(
          create: (context) =>
              EventsBloc(EventRepository())..add(LoadAllEvent()),
          child: const HomeScreen(),
        ),
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          EventDetailScreen.routeName: (context) => const EventDetailScreen(),
          SearchEvent.routeName: (context) => SearchEvent(),
        },
      ),
    );
  }
}
