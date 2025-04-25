import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kp2/model/user_model.dart';

class ProfileAvatarDetails extends StatefulWidget {
  final UserInfor userData;
  const ProfileAvatarDetails({super.key, required this.userData});

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
            widget.userData.fullname,
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
            widget.userData.email,
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
            widget.userData.department,
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
