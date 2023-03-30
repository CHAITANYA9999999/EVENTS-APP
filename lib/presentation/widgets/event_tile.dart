import 'package:events_app/data/models/single_event.dart';
import 'package:flutter/material.dart';

import '../screens/event_details.dart';

class EventTile extends StatelessWidget {
  final SingleEvent event;
  const EventTile(this.event);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(EventDetailScreen.routeName, arguments: event),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Container(
          padding: EdgeInsets.all(6),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Row(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  child: Image.network(event.banner_image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(event.date_time),
                    Text(event.title),
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        Text(event.venue_city),
                        Text('.'),
                        Text(event.venue_country)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
