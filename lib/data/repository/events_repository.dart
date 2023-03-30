import 'dart:convert';

import 'package:events_app/data/models/single_event.dart';
import 'package:http/http.dart' as http;

class EventRepository {
  Future<List<SingleEvent>> getEvents(String controller) async {
    final url = Uri.parse(
        'https://sde-007.api.assignment.theinternetfolks.works/v1/event?search=$controller');
    final response = await http.get(url);
    print(response.statusCode);
    final data = json.decode(response.body)['content']['data'] as List<dynamic>;
    List<SingleEvent> _events = [];
    data.forEach((element) {
      _events.add(SingleEvent(
          id: element['id'].toString(),
          title: element['title']!,
          description: element['description']!,
          banner_image: element['banner_image']!,
          date_time: element['date_time']!,
          organiser_name: element['organiser_name']!,
          organiser_icon: element['organiser_icon']!,
          venue_name: element['venue_name']!,
          venue_city: element['venue_city']!,
          venue_country: element['venue_country']!));
    });
    return _events;
  }
}
