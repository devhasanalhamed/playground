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
  bool _isActive = false;

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

  bool get isActive {
    if (time < t || _isActive) {
      return true;
    }
    return false;
  }

  start() {
    if (!isActive) {
      setState(() {
        _isActive = true;
      });
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
  }

  reset(int duration) {
    if (isActive) {
      timer.cancel();
    }
    setState(() {
      _isActive = false;
      t = duration;
      time = t;
    });
  }

  String counter(int time) {
    final minutes = '${time ~/ 60}'.padLeft(2, '0');
    final seconds = '${time % 60}'.padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pomodoro'),
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
                    counter(time),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: durations
                  .map(
                    (e) => ChoiceChip(
                      label: Text(
                        counter(e),
                      ),
                      selected: e == t,
                      onSelected: (value) => reset(e),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 16.0,
            ),
            if (!isActive)
              CustomElevatedButton(title: 'Start', onPressed: start),
            if (isActive)
              CustomElevatedButton(
                title: 'Reset',
                onPressed: () => reset(t),
                color: Colors.amber,
              ),
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
