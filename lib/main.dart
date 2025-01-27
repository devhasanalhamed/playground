import 'package:flutter/material.dart';
import 'package:playground/calendar/calendar_provider.dart';
import 'package:playground/calendar/calendar_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalendarProvider(),
      child: const MaterialApp(
        home: CalendarScreen(),
      ),
    );
  }
}
