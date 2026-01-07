import 'package:flutter/foundation.dart'; // 1. Fixes kReleaseMode
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:whatnext/widgets/calendar_detail_screen.dart';

void main() => runApp(
  DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // 2. Fixes Key parameter error

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const CalendarDetailScreen(),
    );
  }
}
