import 'package:events_app/data/models/single_event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                padding: const EdgeInsets.only(left: 18, right: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          DateFormat.yMMMd()
                              .format(DateTime.parse(event.date_time)),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          ' , ',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(event.date_time.substring(11, 16),
                            style: Theme.of(context).textTheme.displayMedium),
                        Text(
                          'PM',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    Text(event.title),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Row(
                        children: [
                          Icon(Icons.location_on),
                          Text(event.venue_city),
                          Text('.'),
                          Text(
                            event.venue_country,
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
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
