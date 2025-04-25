import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kp2/model/user_model.dart';

class PersonalInfo extends StatelessWidget {
  final UserInfor userData;
  const PersonalInfo({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personal Info",
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,size: h * 0.025,),
          onPressed: () {
            Navigator.pop(context);
          //  NavigationHelper.navigatingBackToPreviousScreen(context ,  Profile(userData: userData,));
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            buildLabel("Name"),
            buildTextField(userData.fullname),
            
            buildLabel("Email"),
            buildTextField(userData.email),

             buildLabel("Tel"),
            buildTextField(userData.personalTelephone),

            buildLabel("Nationality"),
            buildTextField(userData.country),

            buildLabel("Date of Birth"),
            buildTextField(userData.dob),
          ],
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget buildTextField(String text, {int maxLines = 1}) {
    return TextField(
      controller: TextEditingController(text: text),
      maxLines: maxLines,
      readOnly: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black54,
      ),
    );
  }
}