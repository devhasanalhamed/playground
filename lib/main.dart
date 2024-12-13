import 'package:flutter/material.dart';
import 'package:playground/floating_action_button/circular_fab_widget.dart';
import 'package:playground/home.dart';
import 'package:playground/im_stepper.dart';

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
    return const MaterialApp(
      home: Home(),
    );
  }
}
