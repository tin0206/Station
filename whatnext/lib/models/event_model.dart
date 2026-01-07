import 'package:flutter/material.dart';

enum RemindType {
  none,
  atTimeOfEvent,
  fiveMinutesBefore,
  tenMinutesBefore,
  fifteenMinutesBefore,
  thirtyMinutesBefore,
  oneHourBefore,
  twoHoursBefore,
  oneDayBefore,
  twoDaysBefore,
  oneWeekBefore,
}

class Event {
  final String title;
  final DateTime startTime;
  final DateTime endTime;
  final String? location;
  final RemindType remindType;
  final Text? description;

  Event({
    required this.title,
    required this.startTime,
    required this.endTime,
    this.location,
    this.remindType = RemindType.none,
    this.description,
  });
}
