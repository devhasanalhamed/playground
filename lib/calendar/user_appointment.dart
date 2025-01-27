import 'package:flutter/material.dart';

class UserAppointment {
  final String name;
  final String description;
  final DateTime from;
  final DateTime to;
  final bool isAllDay;
  final Color background;

  UserAppointment({
    required this.name,
    required this.description,
    required this.from,
    required this.to,
    required this.isAllDay,
    Color? background,
  }) : background = background ??
            Colors.primaries[name.hashCode % Colors.primaries.length];
}
