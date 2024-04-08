import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

class DoctorBookingPage extends StatefulWidget {
  const DoctorBookingPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DoctorBookingPageState();
  }
}

class _DoctorBookingPageState extends State<DoctorBookingPage> {
  List<String> _getAvailableTimeSlots() {
    return [
      "08:00 am",
      "08:30 am",
      "09:00 am",
      "09:30 am",
      "10:00 am",
      "10:30 am",
      "13:00 am",
      "13:30 am",
    ];
  }

  Future<void> _bookAppointment() async {
    debugPrint("Booking appointment");
    return Future.value("Booking appointment");
  }

  _goToBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: TextButton(
        onPressed: () => _bookAppointment(),
        style: TextButton.styleFrom(
            backgroundColor: const Color.fromRGBO(41, 170, 225, 1),
            foregroundColor: Colors.white,
            minimumSize: const Size(318, 55)),
        child: const Text("Confirm"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 36.0, right: 36.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(
                          foregroundColor:
                          const HSLColor.fromAHSL(1.0, 0, 0, 0).toColor(),
                          backgroundColor:
                          const HSLColor.fromAHSL(1.0, 192.0, 0.82, 0.90)
                              .toColor()),
                      onPressed: () => _goToBack(context),
                      icon: const FaIcon(FontAwesomeIcons.arrowLeftLong),
                    ),
                  ],
                ),

                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.41, top: 30),
                      child: Text(
                        "Dr. Jamie Dew",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color.fromRGBO(120, 59, 99, 1)),
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [Text("Select date", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(120, 59, 99, 1)
                    ))],
                  ),
                ),
                TableCalendar(
                    headerVisible: false,
                    focusedDay: DateTime.now(),
                    firstDay: DateTime.now(),
                    lastDay: DateTime.now().add(const Duration(days: 365)),
                    onDaySelected: (date, _) => {}),
                const Row(
                  children: [
                    Text(
                      "Available Times (EAT)",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 19.59),
                  child: Row(
                    children: [
                      OutlinedButton(
                        onPressed: () => {},
                        style: OutlinedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(120, 59, 99, 1),
                            minimumSize: Size(68, 29),
                            foregroundColor: Colors.white),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8),
                          child: Text("Day"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 21.0),
                        child: OutlinedButton(
                            onPressed: () => {},
                            style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black,
                                minimumSize: Size(68, 29)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 7),
                              child: Text("Night"),
                            )),
                      )
                    ],
                  ),
                ),
                Wrap(
                  spacing: 2.0,
                  runSpacing: 4.0,
                  children: [
                    ..._getAvailableTimeSlots().map(
                      (slot) =>
                      FilterChip(
                        onSelected: (_)=>{},
                        label:Text(slot)
                      )

                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DoctorBookingRequestDto {
  String doctorId = "";
  DateTime date;
  String timeSlot;

  DoctorBookingRequestDto(
      {required this.doctorId, required this.date, required this.timeSlot}) {}
}
