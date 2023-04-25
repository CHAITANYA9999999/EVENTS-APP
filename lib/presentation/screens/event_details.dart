import 'package:events_app/data/models/single_event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDetailScreen extends StatelessWidget {
  static const routeName = '/event-detail';
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)!.settings.arguments as SingleEvent;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Event Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0x44000000),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Container(
            height: 700,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.network(event.banner_image),
                        Text(
                          event.title,
                          style: const TextStyle(fontSize: 40),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Container(
                              child: ClipRect(
                            child: Image.network(event.organiser_icon),
                          )),
                          title: Text(event.organiser_name),
                          subtitle: const Text('Organizer'),
                        ),
                        ListTile(
                          leading: Container(
                              child: ClipRect(
                            child: Image.asset('assets/images/Date.png'),
                          )),
                          title: Text(DateFormat.yMMMd()
                              .format(DateTime.parse(event.date_time))),
                          subtitle: Row(
                            children: [
                              Text(DateFormat.E()
                                  .format(DateTime.parse(event.date_time))),
                              const Text(', '),
                              Text(event.date_time.substring(11, 16)),
                              const Text('PM'),
                            ],
                          ),
                        ),
                        ListTile(
                          leading: Container(
                              child: ClipRect(
                            child: Image.asset('assets/images/Location.png'),
                          )),
                          title: Text(event.venue_name),
                          subtitle: Text(
                              '${event.venue_city}, ${event.venue_country}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'About Event',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                event.description,
                                style: const TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.only(right: 8, left: 8),
              height: 40,
              width: 200,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color.fromARGB(246, 81, 100, 239)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'BOOK NOW',
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
