// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kp2/screens/forgot_password.dart';
import 'package:kp2/services/auth_services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SigninForms extends StatefulWidget {
  const SigninForms({super.key});

  @override
  State<SigninForms> createState() => _SigninFormsState();
}

final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
final _passwordContrller = TextEditingController();

class _SigninFormsState extends State<SigninForms> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Log into your account",
            style: GoogleFonts.poppins(
              fontSize: h*0.03,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          buildLabel("Email"),
          buildTextField(
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              }),
          buildLabel("Password"),
          PasswordTextField(
              controller: _passwordContrller,
              
              ),
          SizedBox(height: h * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                   Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ResetPassword()));
                },
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: h * 0.035),
          InkWell(
  onTap: () {
    _addUser();
  },
  child: buildButton(),
),

        ],
      ),
    );
  }

 void _addUser() {
 
  if (_formKey.currentState!.validate()) {
    userLogin(context, _emailController.text, _passwordContrller.text).then((_) {
    });
  }
}


  Widget buildButton() {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      //width: w*0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.deepPurpleAccent,
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
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "Login",
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      )),
    );
  }

 Widget buildTextField({
  int maxLines = 1,
  TextEditingController? controller,
  required String? Function(dynamic value) validator,
}) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;

  return Container(
    margin: EdgeInsets.only(bottom: h * 0.015),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 236, 230, 230),
          spreadRadius: 2,
          blurRadius: 4,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white, // Full white background
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.deepPurple.shade100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      style: GoogleFonts.poppins(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
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


  @override
  void dispose() {
    _emailController.dispose();
    _passwordContrller.dispose();
    super.dispose();
  }
}
class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  
  const PasswordTextField({super.key, required this.controller});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscured = true; // Controls visibility

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    
    return Container(
      //height: h * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color:  Colors.deepPurple.shade100,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
             color: Color.fromARGB(255, 236, 230, 230),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _isObscured, // Toggles visibility
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Image.asset(
              _isObscured
                  ? 'assets/hide.png' 
                  : 'assets/view.png',    
              
              height: h*0.03,
              color: Colors.deepPurple, // Optional: Change color if needed
            ),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          filled: true,
          fillColor:  Colors.white70,
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
      ),
    );
  }
}
