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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentTime,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              if (time != t)
                ElevatedButton(onPressed: reset, child: Text('Reset')),
              if (time == t)
                ElevatedButton(onPressed: start, child: Text('Start'))
            ],
          ),
        ),
      ),
    );
  }
}
