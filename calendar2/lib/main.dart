import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  DateTime today = DateTime.now();
  Map<DateTime, List<CalendarEvent>> events = {};

  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today=day;
    });
    
  }

  void _addEvent() {

    setState(() {});    
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Calendrier flutter")),
      body: content(),
    );
  }

  
  Widget content(){
    return Column(
      children: [
        Container(
          child: TableCalendar(
            locale: "en_US",
            rowHeight: 43,
            headerStyle: 
              HeaderStyle(formatButtonVisible: false, titleCentered: true),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day)=>isSameDay(day, today),
            focusedDay: today, 
            firstDay: DateTime.utc(2010,10,16),
            lastDay: DateTime.utc(2030, 3, 14),
            onDaySelected: _onDaySelected,
          ),
        ),
        Text(DateFormat('d MMM y').format(today)),
        ElevatedButton(
          onPressed: () {
            setState(() {
              today = DateTime.now();
            });
          },
          child: Text('Aujourd hui'),
        ),
        ElevatedButton(
          onPressed: _addEvent, 
          child: Text("S'inscrire à un évenement"),
        )

      ],
    );
  }
}

class CalendarEvent {
  final String title;
  final Color backgroundColor;

  CalendarEvent({required this.title, required this.backgroundColor});
}