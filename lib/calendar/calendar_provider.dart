import 'package:flutter/material.dart';
import 'package:playground/calendar/user_appointment.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarProvider extends ChangeNotifier {
  List<CalendarView> views = [
    CalendarView.day,
    CalendarView.week,
    CalendarView.workWeek,
    CalendarView.month,
    CalendarView.timelineDay,
    CalendarView.timelineWeek,
    CalendarView.timelineWorkWeek,
    CalendarView.timelineMonth,
    CalendarView.schedule,
  ];

  TimeSlotViewSettings timeSlotViewSettings = TimeSlotViewSettings(
    startHour: 7,
    endHour: 16,
    nonWorkingDays: <int>[DateTime.saturday, DateTime.friday],
  );

  List<UserAppointment> appointments = [];

  void addAppointment(UserAppointment appointment) {
    appointments.add(appointment);
    print(appointments.length);
    notifyListeners();
  }

  List<UserAppointment> getDataSource() {
    final List<UserAppointment> meetings = <UserAppointment>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
      UserAppointment(
        name: 'Conference',
        description: 'we have to meet today!',
        from: startTime,
        to: endTime,
        isAllDay: false,
      ),
    );
    return meetings;
  }
}

class AppointmentsDataSource extends CalendarDataSource {
  AppointmentsDataSource(List<UserAppointment> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].name;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
