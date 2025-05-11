import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

const durations = [300, 600, 900, 1500, 2100]; // seconds

class _MyAppState extends State<MyApp> {
  late Timer timer;
  late int t;
  late int time;

  start() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (time <= 0) {
        timer.cancel();
      } else {
        setState(() {
          time -= 1;
        });
      }
    });
  }

  reset() {
    timer.cancel();
    setState(() {
      time = t;
    });
  }

  @override
  void initState() {
    t = durations[0];
    time = t;
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = '${time ~/ 60}'.padLeft(2, '0');
    final seconds = '${time % 60}'.padLeft(2, '0');
    final currentTime = '$minutes:$seconds';
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentTime,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            if (time != t)
              CustomElevatedButton(title: 'Reset', onPressed: reset),
            if (time == t)
              CustomElevatedButton(title: 'Start', onPressed: start),
          ],
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color;
  const CustomElevatedButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.color = Colors.deepPurpleAccent});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          fixedSize: Size.fromHeight(64.0)),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
    );
  }
}
