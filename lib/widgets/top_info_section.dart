import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kp2/model/events_model.dart';
import 'package:kp2/model/user_model.dart';
import 'package:kp2/widgets/top_info_event_card.dart';

class MyInfo extends StatelessWidget {
  final UserInfor? userData;
   final List<Event> events;

  const MyInfo({super.key, this.userData, required this.events});

  String _getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good morning';
    } else if (hour < 17) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }

  @override
  Widget build(BuildContext context) {
     print("new : ${userData!.fullname}");
     String firstName = userData?.fullname.split(' ').first ?? 'User';
     String formattedDate = DateFormat('EEEE, d MMMM yyyy').format(DateTime.now());
    String greeting = _getGreeting();
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h * 0.4,
      child: Stack(
        children: [
          Container(
            height: h * 0.30,
            width: w,
            color: Colors.purple,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.035, vertical: h * 0.013),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date
                  Text(
                    formattedDate,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "$greeting, $firstName",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            top: MediaQuery.of(context).size.height * 0.1,
            right: 0.0,
            child:EventsCard(events: events,),
          )
        ],
      ),
    );
  }
}
