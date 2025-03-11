import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// General TextStyle function with additional parameters
TextStyle textStyle({
  FontWeight fontWeight = FontWeight.normal,
  double fontSize = 12,
  required Color color,
  required double height,
  required TextDecoration decoration,
  required FontStyle fontStyle,
}) {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
      height: height,
      fontStyle: fontStyle,
    ),
  );
}

// // Usage examples
// TextStyle headerStyle = textStyle(
//   fontWeight: FontWeight.bold,
//   fontSize: 16,
//   color: Colors.black,
//   height: 1.5,
// );

// TextStyle subheaderStyle = textStyle(
//   fontWeight: FontWeight.w500,
//   fontSize: 14,
//   color: Colors.grey[700],
//   fontStyle: FontStyle.italic,
// );
