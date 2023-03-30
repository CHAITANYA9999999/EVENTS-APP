class SingleEvent {
  final String id;
  final String title;
  final String description;
  final String banner_image;
  final String date_time;
  final String organiser_name;
  final String organiser_icon;
  final String venue_name;
  final String venue_city;
  final String venue_country;

  SingleEvent(
      {required this.id,
      required this.title,
      required this.description,
      required this.banner_image,
      required this.date_time,
      required this.organiser_name,
      required this.organiser_icon,
      required this.venue_name,
      required this.venue_city,
      required this.venue_country});
}
