import 'package:flutter/material.dart';
import 'package:kp2/model/events_model.dart';
import 'package:kp2/model/user_model.dart';
import 'package:kp2/services/db_services.dart';
import 'package:kp2/widgets/below_top_info.dart';
import 'package:kp2/widgets/my_shifts.dart';
import 'package:kp2/widgets/top_info_section.dart';

class AllEvents extends StatefulWidget {
    final UserInfor userData;
    final List<Event> events;
  const AllEvents({super.key, required this.userData, required this.events});

  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  @override
   Widget build(BuildContext context) {
    print("Homepage received userData: ${widget.userData.fullname}");
    print("Homepage received userData: ${widget.userData.email}");
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: DatabaseService().getEvents(), // Ensure correct instance call
          builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No events available"));
            }

            final events = snapshot.data!;
            print("Fetched events in MainScreen: $events");

            return Column(
              children: [
                MyInfo(userData: widget.userData, events: widget.events,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.035, vertical: h * 0.013),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Buttons(),
                      SizedBox(height: h * 0.025),
                      MyShifts(),
                      SizedBox(height: h * 0.025),
                      Text("Events:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      for (var event in events)
                        ListTile(
                          title: Text(event['title'] ?? 'No Title'),
                          subtitle: Text(event['description'] ?? 'No Description'),
                        ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}