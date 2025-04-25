import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kp2/model/events_model.dart';
import 'package:intl/intl.dart'; // To format date

class EventsCard extends StatefulWidget {
  final List<Event> events;

  const EventsCard({super.key, required this.events});

  @override
  State<EventsCard> createState() => _EventsCardState();
}

class _EventsCardState extends State<EventsCard> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    // Get today's date formatted as dd-MM-yy to match Firebase format
    String today = DateFormat('dd-MM-yy').format(DateTime.now());

    // Find if there is an event today
    Event? eventToday;
    for (var event in widget.events) {
      // Assuming 'date' is a string in the format 'dd-MM-yy'
      if (event.date == today) {
        eventToday = event;
        break;
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.035, vertical: h * 0.013),
      child: Container(
        height: h * 0.25,
        width: w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.035, vertical: h * 0.05),
              child: Container(
                height: h * 0.15,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 252, 233),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.01),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: h * 0.14,
                          width: w * 0.01,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        SizedBox(width: w * 0.05),
                        eventToday == null
                            ? Text(
                                "No Event today",
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    eventToday.title,
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: h*0.01),

                                  Text(
                                    eventToday.description,
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),


                              ],
                            ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
