import 'package:flutter/material.dart';
import 'package:playground/calendar/calendar_provider.dart';
import 'package:playground/calendar/user_appointment.dart';
import 'package:provider/provider.dart';

class AppointmentDialog extends StatefulWidget {
  const AppointmentDialog({super.key});

  @override
  State<AppointmentDialog> createState() => _AppointmentDialogState();
}

class _AppointmentDialogState extends State<AppointmentDialog> {
  final eventNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final today = DateTime.now();
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 32.0,
        right: 16.0,
        bottom: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16.0,
        children: [
          TextField(
            controller: eventNameController,
            decoration: InputDecoration(
              hintText: 'Event name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: 'Description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          Row(
            spacing: 16.0,
            children: [
              Expanded(
                child: TextField(
                  controller: startDateController,
                  decoration: InputDecoration(
                    hintText: 'From',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  readOnly: true,
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(
                        Duration(days: 365),
                      ),
                    );

                    if (picked != null) {
                      setState(() {
                        startDate = picked;
                        startDateController.text = startDate.toString();
                      });
                    }
                  },
                ),
              ),
              Expanded(
                child: TextField(
                  controller: endDateController,
                  decoration: InputDecoration(
                    hintText: 'To',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  readOnly: true,
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(
                        Duration(days: 365),
                      ),
                    );

                    if (picked != null) {
                      setState(() {
                        endDate = picked;
                        endDateController.text = endDate.toString();
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              context.read<CalendarProvider>().addAppointment(
                    UserAppointment(
                      name: eventNameController.text,
                      description: descriptionController.text,
                      from: startDate!,
                      to: endDate!,
                      isAllDay: false,
                    ),
                  );
            },
            child: Text('Add Event'),
          ),
        ],
      ),
    );
  }
}
