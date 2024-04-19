import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'circular_fab_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
        primary: Color.fromARGB(255, 79, 79, 79),
        secondary: Colors.grey,
      )),
      home: const MyHomePage(title: 'Flutter Common Date Formats'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final date = DateTime(2024, 1, 28);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: const CircularFabWidget(),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Table(
                border: TableBorder.all(
                  color: Colors.black,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6),
                  ),
                  width: 2.0,
                  style: BorderStyle.solid,
                ),
                children: [
                  const TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Format',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          'Code',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TableCell(
                          child: Text(
                            DateFormat().format(date),
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: TableCell(
                          child: Text(
                            'DateFormat().format(date)',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TableCell(
                          child: Text(
                            DateFormat.yMd().format(date),
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: TableCell(
                          child: Text(
                            'DateFormat.yMd().format(date)',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TableCell(
                          child: Text(
                            DateFormat.yMMMd().format(date),
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: TableCell(
                          child: Text(
                            'DateFormat.yMMMd().format(date),',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TableCell(
                          child: Text(
                            DateFormat.yMMMMd().format(date),
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: TableCell(
                          child: Text(
                            'DateFormat.yMMMMd().format(date),',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TableCell(
                          child: Text(
                            DateFormat('dd/MM/yyyy').format(date),
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: TableCell(
                          child: Text(
                            "DateFormat('dd/MM/yyyy').format(date)",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TableCell(
                          child: Text(
                            DateFormat('MM-dd-yyyy').format(date),
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: TableCell(
                          child: Text(
                            "DateFormat('MM-dd-yyyy').format(date)",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      FontAwesomeIcons.twitter,
                    ),
                    Text(
                      'realhassan97',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
