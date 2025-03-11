import 'package:flutter/material.dart';

class FunctionalButtons extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.calendar_today, 'color': Colors.blue, 'label': 'My Shifts'},
    {'icon': Icons.event, 'color': Colors.orange, 'label': 'Leave Request'},
    {'icon': Icons.schedule, 'color': Colors.blue, 'label': 'Schedule'},
    {'icon': Icons.check_circle, 'color': Colors.green, 'label': 'Attendance Log'},
  ];

   FunctionalButtons({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 1.5,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Handle tap
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${menuItems[index]["label"]} clicked')),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: menuItems[index]['color'].withOpacity(0.2),
                    child: Icon(menuItems[index]['icon'], color: menuItems[index]['color'], size: 30),
                  ),
                  SizedBox(height: h*0.02),
                  Text(menuItems[index]['label'], style: TextStyle(fontSize: 16)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}