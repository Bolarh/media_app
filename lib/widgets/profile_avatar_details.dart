import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileAvatarDetails extends StatefulWidget {
  const ProfileAvatarDetails({super.key});

  @override
  State<ProfileAvatarDetails> createState() => _ProfileAvatarDetailsState();
}

class _ProfileAvatarDetailsState extends State<ProfileAvatarDetails> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade300,
                child:
                    Icon(Icons.person, size: 50, color: Colors.grey.shade600),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(Icons.edit, size: 18, color: Colors.blue),
                    onPressed: () {
                      // Handle edit action
                    },
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: h * 0.01),

          //name

          Text(
            "Derrick Opoku Nyame",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: h * 0.01),

          Text(
            "derrick@gmail.com",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w200,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: h * 0.01),

          Text(
            "Media Team . Since 2024",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: h * 0.01),
        ],
      ),
    ));
  }
}
