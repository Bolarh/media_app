import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kp2/model/user_model.dart';
import 'package:kp2/utils/navigation.dart';
import 'package:kp2/widgets/detailed_address_page.dart';
import 'package:kp2/widgets/detailed_contacts.dart';
import 'package:kp2/widgets/personal_info.dart';

class GeneralInfo extends StatefulWidget {
  final UserInfor userData;
  const GeneralInfo({super.key, required this.userData});

  @override
  State<GeneralInfo> createState() => _GeneralInfoState();
}

class _GeneralInfoState extends State<GeneralInfo> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "General Information",
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Divider(height: h*0.05,thickness: 1, color: Colors.grey.shade100,),
          // SizedBox(height: h * 0.02),
          InkWell(
            onTap: (){
               NavigationHelper.navigatingToNextScreen(context,  PersonalInfo(userData: widget.userData,));
            },
            child: Padding(
              padding: EdgeInsets.only(top: h * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person,size: h * 0.025,color: Colors.black54),
                       SizedBox(width: w*0.02),
                      Text(
                        "Personal Info",
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
          InkWell(
            onTap: () {
                  NavigationHelper.navigatingToNextScreen(context,  DetailedContacts(userData: widget.userData));
                },
            child: Padding(
              padding: EdgeInsets.only(top: h * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.phone_outlined,size: h * 0.025,color: Colors.black54),
                       SizedBox(width: w*0.02),
                      Text(
                        "Contacts",
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
          InkWell(
             onTap: () {
                  NavigationHelper.navigatingToNextScreen(context,  AddressView(userData: widget.userData,));
                },
            child: Padding(
              padding: EdgeInsets.only(top: h * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,size: h * 0.025, color: Colors.black54,
                      ),
                      SizedBox(width: w*0.02),
                      Text(
                        "Address",
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
      ),
    );
  }
}
