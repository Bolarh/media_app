import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kp2/screens/login_screen.dart';
import 'package:kp2/services/auth_services.dart';
import 'package:kp2/utils/navigation.dart';
import 'package:lottie/lottie.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.035, vertical: h * 0.013),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               InkWell(
                onTap: () {
            //Navigator.pop(context);
          NavigationHelper.navigatingBackToPreviousScreen(context ,  SignInScreen());
          },
                
                child: Icon(Icons.arrow_back_ios, color: Colors.black,size: h * 0.025,)),
          

SizedBox(height: h*0.15),
               SizedBox(
                height: h*0.2,
                child: Center(child: LottieBuilder.asset("lottie_files/passwordreset.json"))),
              Text(
                "Forgot Password?",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: h*0.04,),
              Text(
                "Enter your email adress to recieve a password reset link and regain control of your account",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.black45,
                  ),
                ),
              ),

              SizedBox(height: h*0.04,),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 5),
                child: Text(
                  "Email",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),
              Container(
                height: h * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: Colors.deepPurple.shade100, // Border color
                    width: 1, // Border thickness
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 236, 230, 230),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: emailController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87,
                  ),
                ),
              ),

              SizedBox(height: h*0.04,),

              //button
              InkWell(
                onTap: (){
                  reset(emailController.text);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.deepPurpleAccent,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 254, 253, 253),
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
                      "request a link",
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
