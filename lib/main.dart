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
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) =>
              EventsBloc(EventRepository())..add(LoadAllEvent()),
          child: HomeScreen(),
        ),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          EventDetailScreen.routeName: (context) => EventDetailScreen(),
          SearchEvent.routeName: (context) => SearchEvent(),
        },
      ),
    );
  }
}
