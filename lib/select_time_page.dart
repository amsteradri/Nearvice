import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'RequestSentPage.dart'; // This is the new page you will create

class SelectTimePage extends StatefulWidget {
  @override
  _SelectTimePageState createState() => _SelectTimePageState();
}

class _SelectTimePageState extends State<SelectTimePage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  String? _selectedTimeSlot;

  @override
  Widget build(BuildContext context) {
    List<String> timeSlots = List.generate(12, (index) => '${index + 12}:00');

    return Scaffold(
      appBar: AppBar(
        title: Text('Día y hora', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
                rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
                titleTextStyle: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                ),
                itemCount: timeSlots.length,
                itemBuilder: (context, index) {
                  final String timeSlot = timeSlots[index];
                  bool isSelected = _selectedTimeSlot == timeSlot;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTimeSlot = timeSlot;
                      });
                    },
                    child: Card(
                      color: isSelected ? Colors.deepPurple : Colors.grey[200],
                      child: Center(
                        child: Text(
                          timeSlot,
                          style: TextStyle(
                            fontSize: 18,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {
                  if (_selectedTimeSlot != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RequestConfirmationPage(
                        selectedDay: _selectedDay,
                        selectedTimeSlot: _selectedTimeSlot!,
                      ),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a time slot')),
                    );
                  }
                },
                child: Text('Siguiente', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
