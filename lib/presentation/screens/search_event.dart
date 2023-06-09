import 'package:events_app/blocks/bloc/specificevent_bloc.dart';
import 'package:events_app/data/repository/events_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocks/bloc/events_bloc.dart';
import '../../data/models/single_event.dart';
import '../widgets/event_tile.dart';

class SearchEvent extends StatefulWidget {
  static const routeName = '/search-event';

  @override
  State<SearchEvent> createState() => _SearchEventState();
}

class _SearchEventState extends State<SearchEvent> {
  var controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    controller = TextEditingController(text: '');
    controller.addListener(printlatest);
    super.initState();
  }

  void printlatest() {
    print(controller.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Search',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // Add padding around the search bar
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  // Use a Material design search bar
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Type Event',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => controller.clear(),
                      ),
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 710,
                child: BlocProvider(
                  lazy: false,
                  create: (context) =>
                      SpecificeventBloc(EventRepository(), controller.text)
                        ..add(LoadSpecificEvent()),
                  child: BlocBuilder<SpecificeventBloc, SpecificeventState>(
                      builder: ((context, state) {
                    print(state);
                    if (state is SpecificeventLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is SpecificeventLoaded) {
                      List<SingleEvent> eventsList = state.events;
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: ((_, index) {
                          return EventTile(eventsList[index]);
                        }),
                        itemCount: eventsList.length,
                      );
                    }
                    return const Text('');
                  })),
                ),
              ),
            ],
          ),
        ));
  }
}
