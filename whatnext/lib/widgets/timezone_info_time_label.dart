import 'package:flutter/material.dart';

class TimezoneInfo extends StatelessWidget {
  final String time, location;

  const TimezoneInfo({super.key, required this.time, required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          location,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class TimeLabel extends StatelessWidget {
  final String label, time;

  const TimeLabel({super.key, required this.label, required this.time});

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
