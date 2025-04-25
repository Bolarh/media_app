import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kp2/model/user_model.dart';
import 'package:kp2/screens/admin_add_events.dart';
import 'package:kp2/screens/admin_add_user_screen.dart';
import 'package:kp2/utils/navigation.dart';

class AdminHomepage extends StatefulWidget {
  final UserInfor userData;
  const AdminHomepage({super.key, required this.userData});

  @override
  State<AdminHomepage> createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                  InkWell(
                    onTap: (){
                      NavigationHelper.navigatingToNextScreen(context, AdminScreen());
                    },
                    child: buildColumn(Icons.person_add, "Register")),
                  SizedBox(width: w * 0.05), 
                  InkWell(onTap: (){
                     NavigationHelper.navigatingToNextScreen(context, AddEvents());
                  },
                    
                    child: buildColumn(Icons.event, "Events")),
                ],
              ),
              SizedBox(height: h * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildColumn(Icons.settings, "Settings"),
                  SizedBox(width: w * 0.05),
                  buildColumn(Icons.notifications, "Notifications"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildColumn(IconData icon, String label) {
    return Column(
      children: [
        buildContainer(Icon(icon, size: 50, color: Colors.blue)),
        buildLabel(label),
      ],
    );
  }

  Widget buildContainer(Widget icon) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Center(child: icon), // Centering icon inside container
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
