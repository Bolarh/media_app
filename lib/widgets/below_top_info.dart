import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
                radius: 20, backgroundColor: Colors.white,
                child: Icon(Icons.calendar_month_outlined),
                 ),
                 Text("My Shifts",style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),)
          ],
        ),


        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
                radius: 20, backgroundColor: Colors.white,
                child: Icon(Icons.calendar_view_day_sharp,color: Colors.lightGreen,),
                 ),
                 Text("My Shifts",style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),)
          ],
        ),


        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
                radius: 20, backgroundColor: Colors.white,
                child: Icon(Icons.schedule_outlined, color: Colors.blueAccent,),
                 ),
                 Text("Schedule",style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),)
          ],
        ),


        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
                radius: 20, backgroundColor: Colors.white,
                child: Icon(Icons.person_pin, color: Colors.amber,),
                 ),
                 Text("Attendance Log",style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),)
          ],
        ),
      ],
    );
  }
}
