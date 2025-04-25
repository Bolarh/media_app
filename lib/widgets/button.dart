import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text; // Text to display on the button
  final Function onTap; // Function to execute when the button is pressed
  final Color color; // Button color
  final double width; // Width of the button

  const Button({
    super.key,
    required this.text,
    required this.onTap,
    this.color = Colors.deepPurpleAccent, // Default color
    this.width = double.infinity, // Default to full width
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: width, // You can change the width when using the button
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 242, 239, 239),
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
