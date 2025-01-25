import 'package:flutter/material.dart';
import 'package:playground/calendar/calendar_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalendarProvider(),
      child: Consumer<CalendarProvider>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Calendar'),
            ),
            body: SfCalendar(
              allowedViews: value.views,
              timeSlotViewSettings: value.timeSlotViewSettings,
              dataSource: MeetingDataSource(value.getDataSource()),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
