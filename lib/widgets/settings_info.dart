import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kp2/model/user_model.dart';
import 'package:kp2/services/auth_services.dart';

class SettingsInfo extends StatefulWidget {
  const SettingsInfo({super.key, required UserInfor userData});

  @override
  State<SettingsInfo> createState() => _SettingsInfoState();
}

class _SettingsInfoState extends State<SettingsInfo> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Settings"),
        Divider(height: h*0.05,thickness: 1, color: Colors.grey.shade100,),
        // SizedBox(height: h * 0.02),

        Padding(
            padding: EdgeInsets.only(top: h * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.settings,size: h * 0.025,color: Colors.black54),
                     SizedBox(width: w*0.02),
                    Text(
                      "Change Password",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.grey,
                  size: h * 0.025,
                )
              ],
            ),
          ),

Divider(height: h*0.05,thickness: 1, color: Colors.grey.shade100,),

           InkWell(
            onTap: (){
              userLogout(context);
            },
             child: Padding(
              padding: EdgeInsets.only(top: h * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.logout_outlined,size: h * 0.025,color: Colors.black54),
                       SizedBox(width: w*0.02),
                      Text(
                        "Log out",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.grey,
                    size: h * 0.025,
                  )
                ],
              ),
                       ),
           ),
          Divider(height: h*0.05,thickness: 1, color: Colors.grey.shade100,),
      ],
    );
  }
}