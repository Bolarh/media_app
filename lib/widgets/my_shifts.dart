import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyShifts extends StatefulWidget {
  const MyShifts({super.key});

  @override
  State<MyShifts> createState() => _MyShiftsState();
}


class _MyShiftsState extends State<MyShifts> {
  @override
  Widget build(BuildContext context) {
   
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Shifts",
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: h*0.02,),
        Container(
          height: h * 0.08,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(6.0),
              boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 248, 241, 241),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          )
                        ],),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: w * 0.0, vertical: h * 0.01),
            child: Center(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: h * 0.03,
                    width: w * 0.006,
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(6.0),
                      
                    ),
                  ),
                  SizedBox(width: w * 0.05),
                  Text(
                    "No shift today",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
