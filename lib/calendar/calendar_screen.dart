import 'package:flutter/material.dart';
import 'package:playground/calendar/appointment_dialog.dart';
import 'package:playground/calendar/calendar_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Calendar'),
          ),
          body: SfCalendar(
            key: UniqueKey(),
            allowedViews: value.views,
            timeSlotViewSettings: value.timeSlotViewSettings,
            dataSource: AppointmentsDataSource(value.appointments),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () => showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  context: context,
                  builder: (context) => AppointmentDialog(),
                ),
                child: Icon(Icons.add),
              ),
            ],
          ),
        );
      },
    );
  }
}
