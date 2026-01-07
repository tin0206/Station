import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatnext/models/event_model.dart';
import 'package:whatnext/widgets/timezone_info_time_label.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;
  final Color cardColor;

  const EventDetailScreen({
    super.key,
    required this.event,
    required this.cardColor,
  });

  String formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);

    if (hours > 0) {
      return "$hours ${hours == 1 ? 'hour' : 'hours'}${minutes > 0 ? ' $minutes mins' : ''}";
    } else {
      return "$minutes mins";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE5E5E0),
        centerTitle: true,
        title: const Text('Event Details'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Edit Event',
            onPressed: () {
              // Handle edit action
            },
          ),
          IconButton(
            color: Colors.red,
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Delete Event',
            onPressed: () {
              // Handle delete action
            },
          ),
          SizedBox(width: 10), // Thêm khoảng cách bên phải
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Text(
                              event.title,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF5D4037),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TimeLabel(
                            label: "Start",
                            time: DateFormat('h:mm a').format(event.startTime),
                          ),
                          _buildSmallChip(
                            formatDuration(
                              event.endTime.difference(event.startTime),
                            ),
                            color: const Color(0xFF5D4037),
                            textColor: Colors.white,
                          ),
                          TimeLabel(
                            label: "End",
                            time: DateFormat('h:mm a').format(event.endTime),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.query_builder_rounded,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Date & Time",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(left: 34),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat(
                                'EEEE, MMM d, y',
                              ).format(event.startTime),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "${DateFormat('h:mm a').format(event.startTime)} - ${DateFormat('h:mm a').format(event.endTime)}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Location",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(left: 34),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.location ?? "",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications_none,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Reminder",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(left: 34),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.remindType == RemindType.none
                                  ? "No Reminder"
                                  : event.remindType.name
                                        .replaceAllMapped(
                                          RegExp(r'([A-Z])'),
                                          (match) => ' ${match.group(0)}',
                                        )
                                        .trim(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.description, color: Colors.grey[600]),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(left: 34),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.description?.data ?? "No Description",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSmallChip(
    String text, {
    Color color = Colors.black12,
    Color textColor = Colors.black,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
