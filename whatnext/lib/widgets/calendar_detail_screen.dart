import 'package:flutter/material.dart';
import 'package:whatnext/models/event_model.dart';
import 'package:whatnext/utils/color.dart';

class CalendarDetailScreen extends StatelessWidget {
  const CalendarDetailScreen({super.key});

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
                  children: const [
                    Text(
                      "Tuesday",
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "13.12",
                          style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                        Text(
                          "DEC",
                          style: TextStyle(
                            fontSize: 70,
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
                        _TimezoneInfo(time: "1:20 PM", location: "New York"),
                        SizedBox(height: 20),
                        _TimezoneInfo(
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
        startTime: "3:00 PM",
        endTime: "3:30 PM",
      ),
      Event(
        title: "Project Discussion",
        startTime: "4:00 PM",
        endTime: "5:00 PM",
      ),
      Event(title: "Client Call", startTime: "6:00 PM", endTime: "6:30 PM"),
    ];

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: mockEvents.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return _buildMeetingCard(mockEvents[index]);
      },
    );
  }

  // Widget thẻ Meeting màu vàng
  Widget _buildMeetingCard(Event event) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: randomColor(), // Màu vàng đồng
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                event.title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5D4037),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TimeLabel(label: "Start", time: event.startTime),
              _buildSmallChip(
                "30 Min",
                color: const Color(0xFF5D4037),
                textColor: Colors.white,
              ),
              _TimeLabel(label: "End", time: event.endTime),
            ],
          ),
        ],
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

// Các Helper Widget nhỏ để code gọn hơn
class _TimezoneInfo extends StatelessWidget {
  final String time, location;
  const _TimezoneInfo({required this.time, required this.location});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(location, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }
}

class _TimeLabel extends StatelessWidget {
  final String label, time;
  const _TimeLabel({required this.label, required this.time});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF5D4037),
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF5D4037)),
        ),
      ],
    );
  }
}
