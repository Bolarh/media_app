import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kp2/widgets/general_info.dart';
import 'package:kp2/widgets/profile_avatar_details.dart';
import 'package:kp2/widgets/settings_info.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
     double h = MediaQuery.of(context).size.height;
     double w = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("My Account",style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),),
        ),
      ),
      body: Padding(
         padding: EdgeInsets.symmetric(horizontal: w * 0.035, vertical: h * 0.013),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
          
           
            SizedBox(height: h * 0.02),
          
            // circle avater
            ProfileAvatarDetails(),
          
          
          
            // General details
           
          
            GeneralInfo(),
            SizedBox(height: h * 0.02),
            SettingsInfo()
          ],),
        ),
      ),
    );
  }
}