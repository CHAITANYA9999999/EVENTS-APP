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
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Event Details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Image.network(event.banner_image),
                Text(
                  event.title,
                  style: TextStyle(fontSize: 40),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: Container(
                      child: ClipRect(
                    child: Image.network(event.organiser_icon),
                  )),
                  title: Text(event.organiser_name),
                  subtitle: Text('Organizer'),
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
                      Text(', '),
                      Text(event.date_time.substring(11, 16)),
                      Text('PM'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Container(
                      child: ClipRect(
                    child: Image.asset('assets/images/Location.png'),
                  )),
                  title: Text(event.venue_name),
                  subtitle: Text('${event.venue_city}, ${event.venue_country}'),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'About Event',
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(event.description)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8),
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.lightBlue),
              child: Row(
                children: [
                  Text('BOOK NOW'),
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
