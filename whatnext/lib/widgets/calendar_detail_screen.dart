import 'package:flutter/material.dart';
import 'package:whatnext/models/event_model.dart';
import 'package:whatnext/utils/color.dart';
import 'package:intl/intl.dart';
import 'package:whatnext/widgets/event_detail_screen.dart';
import 'package:whatnext/widgets/timezone_info_time_label.dart';

class CalendarDetailScreen extends StatelessWidget {
  const CalendarDetailScreen({super.key});

  String formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);

    if (hours > 0) {
      return "$hours ${hours == 1 ? 'hour' : 'hours'}${minutes > 0 ? ' $minutes mins' : ''}";
    } else {
      return "$minutes mins";
    }
  }

  DateTime getCurrentDateTime() {
    return DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // --- Header Buttons ---
              Row(
                children: [
                  _buildTabButton("Today", isSelected: true),
                  const SizedBox(width: 10),
                  _buildTabButton("Calendar", isSelected: false),
                  const Spacer(),
                  _buildAddButton(),
                ],
              ),
              const SizedBox(height: 40),
              // --- Date and Timezones ---
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('EEEE').format(getCurrentDateTime()),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('dd MMM').format(getCurrentDateTime()),
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                        Text(
                          DateFormat('yyyy').format(getCurrentDateTime()),
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            height: 0.8,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 30),
                    // Đường kẻ dọc
                    Center(
                      child: Container(
                        width: 1,
                        height: 100,
                        color: Colors.black26,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TimezoneInfo(time: "1:20 PM", location: "New York"),
                        SizedBox(height: 20),
                        TimezoneInfo(
                          time: "6:20 PM",
                          location: "United Kingdom",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // --- Task Card Section ---
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Today tasks",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          _buildSmallChip("Reminders"),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(child: _buildEventList()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget con cho nút Today/Calendar
  Widget _buildTabButton(String text, {required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Widget nút Add (+) tròn
  Widget _buildAddButton() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
      child: const Icon(Icons.add, size: 28),
    );
  }

  Widget _buildEventList() {
    final List<Event> mockEvents = [
      Event(
        title: "You Have A Meeting",
        startTime: DateTime(2024, 6, 1, 15, 0),
        endTime: DateTime(2024, 6, 1, 15, 30),
        location: "Conference Room A",
      ),
      Event(
        title: "Project Discussion",
        startTime: DateTime(2024, 6, 1, 16, 0),
        endTime: DateTime(2024, 6, 1, 17, 0),
        location: "Meeting Room B",
      ),
      Event(
        title: "Client Call",
        startTime: DateTime(2024, 6, 1, 18, 0),
        endTime: DateTime(2024, 6, 1, 18, 30),
        location: "Office",
      ),
    ];

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: mockEvents.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return _buildMeetingCard(context, mockEvents[index]);
      },
    );
  }

  // Widget thẻ Meeting màu vàng
  Widget _buildMeetingCard(BuildContext context, Event event) {
    final Color currentColor = randomColor();

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  EventDetailScreen(event: event, cardColor: currentColor),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 3),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: currentColor, // Màu vàng đồng
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 260,
                    child: Text(
                      event.title,
                      maxLines: 2,
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
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TimeLabel(
                    label: "Start",
                    time: DateFormat('h:mm a').format(event.startTime),
                  ),
                  _buildSmallChip(
                    formatDuration(event.endTime.difference(event.startTime)),
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
