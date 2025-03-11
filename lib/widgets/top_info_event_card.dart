import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsCard extends StatefulWidget {
  const EventsCard({super.key});

  @override
  State<EventsCard> createState() => _EventsCardState();
}

class _EventsCardState extends State<EventsCard> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.035, vertical: h * 0.013),
      child: Container(
        height: h * 0.25,
        width: w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: const Color.fromARGB(255, 242, 239, 239),
          //     spreadRadius: 2,
          //     blurRadius: 2,
          //     offset: const Offset(0, 2),
          //   )
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.035, vertical: h * 0.05),
              child: Container(
                height: h * 0.15,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 252, 233),
                  borderRadius: BorderRadius.circular(10.0)
                ),

                child: Padding(
                  padding: EdgeInsets.symmetric(
                  horizontal: w * 0.02, vertical: h * 0.01),
                  child: Center(
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: h*0.14,
                          width: w*0.01,
                          decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10.0)
                ),
                        ),

                        SizedBox(width: w*0.05),
                    
                        Text("No Event today",
                        style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),)
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
