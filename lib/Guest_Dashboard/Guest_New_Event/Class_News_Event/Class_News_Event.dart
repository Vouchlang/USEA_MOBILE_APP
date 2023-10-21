class Class_News_Events {
  late String event_name;
  List<Event_Data> events;
  Class_News_Events({
    required this.event_name,
    required this.events,
  });
}

class Event_Data {
  late String image, title, description, event_date, time;
  Event_Data({
    required this.image,
    required this.title,
    required this.description,
    required this.event_date,
    required this.time,
  });
}
