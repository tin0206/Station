class Event {
  final String title;
  final String startTime;
  final String endTime;
  final String? location;
  final bool isReminder;

  Event({
    required this.title,
    required this.startTime,
    required this.endTime,
    this.location,
    this.isReminder = false,
  });
}
