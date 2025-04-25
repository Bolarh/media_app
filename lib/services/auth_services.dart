import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kp2/model/events_model.dart';
import 'package:kp2/model/user_model.dart';
import 'package:kp2/screens/admin_homepage.dart';
import 'package:kp2/screens/mainscreen.dart';
import 'package:kp2/services/db_services.dart';
import 'package:kp2/services/get_user_data.dart';

Future<Usar?> registerUser(
  BuildContext context,
   TextEditingController fullnameController,
  TextEditingController emailController,
  TextEditingController dobController,
  TextEditingController telephoneController,
  TextEditingController emergencyContactNameController,
  TextEditingController emergencyContactTelephoneController,
  TextEditingController emergencyContactRelationshipController,
  TextEditingController departmentController,
  TextEditingController countryController,
  TextEditingController postCodeController,
  TextEditingController detailAddressController,
  TextEditingController cityController,) async {
  try {
     showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
         double h = MediaQuery.of(context).size.height;
         double w = MediaQuery.of(context).size.width;
        return Center(
          child: Container(
              width: w*0.35,
              height: h*0.1,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white54,
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        color: Colors.black87,
                      ),
                    ),
                    Text("Please wait...",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ))
                  ],
                ),
              )),
        );
      },
    );

    
    String password = _generatePassword();
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: password,
    );
    await userCredential.user!.updateDisplayName(fullnameController.text);

    print('User registered: ${userCredential.user!.uid}');
    print("password: $password");

    FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({
      'personal_details': {
        'fullname': fullnameController.text.trim(),
        'email': emailController.text.trim(),
        'date_of_birth': dobController.text.trim(),
        'telephone': telephoneController.text.trim(),
      },
      'emergency_contact': {
        'name': emergencyContactNameController.text.trim(),
        'telephone': emergencyContactTelephoneController.text.trim(),
        'relationship': emergencyContactRelationshipController.text.trim(),
      },
      'department': departmentController.text.trim(),
      'address': {
        'country': countryController.text.trim(),
        'post_code': postCodeController.text.trim(),
        'detail_address': detailAddressController.text.trim(),
        'city': cityController.text.trim(),
      },
      'role': 'user',
    }).then((value) {

      Fluttertoast.showToast(msg: "Registration Successful");
      print('User Added');
      Navigator.of(context).pop();


      fullnameController.clear();
      telephoneController.clear();
      countryController.clear();
      cityController.clear();
      departmentController.clear();
      postCodeController.clear();
      detailAddressController.clear();
      emergencyContactNameController.clear();
      emergencyContactTelephoneController.clear();
      dobController.clear();
      emailController.clear();
    }).catchError((error) {
      print('Failed to add user: $error');
      Navigator.of(context).pop();
      Fluttertoast.showToast(msg: "Registration Failed: ${error.message}");
    });
  } catch (e) {
    print('Failed to register user: $e');
    Navigator.of(context).pop();
  }
  return null;
}

String _generatePassword() {
  const length = 8;
  const charset =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#\$%^&*';
  final random = Random.secure();
  return List.generate(length, (_) => charset[random.nextInt(charset.length)])
      .join();
}
// Future<Usar?> userLogin(BuildContext context, String email, String password) async {
//   try {
//     // Show loading indicator while logging in
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return const Center(
//           child: CircularProgressIndicator(color: Colors.blue),
//         );
//       },
//     );

//     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     //new line
//     User? user = userCredential.user;
//     UserInfor? userData = await getUserData(user);

//     print("User data: ${userData!.fullname}");
//     print("country: ${userData.country}");

//     Navigator.of(context).pop();

//      Navigator.of(context).pushReplacement(
//       MaterialPageRoute(builder: (context) => Mainscreen(userData: userData)),
//     );

//   } on FirebaseAuthException catch (e) {
//     print('Error logging in: ${e.message}');

//     Navigator.of(context).pop();

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Error logging in: ${e.message}')),
//     );
//   } catch (e) {
//     print('Unexpected error logging in: $e');

//     Navigator.of(context).pop();

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Unexpected error logging in: $e')),
//     );
//   }
//   return null;
// }

Future<UserInfor?> userLogin(
    BuildContext context, String email, String password) async {
  try {
    // Show loading indicator while logging in
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
         double h = MediaQuery.of(context).size.height;
         double w = MediaQuery.of(context).size.width;
        return Center(
          child: Container(
              width: w*0.35,
              height: h*0.1,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white54,
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        color: Colors.black87,
                      ),
                    ),
                    Text("Please wait...",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ))
                  ],
                ),
              )),
        );
      },
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Fetch user data after login
    User? user = userCredential.user;
    if (user != null) {
      UserInfor? userData = await getUserData(user);

      if (userData != null) {
        print("User data: ${userData.fullname}");
        print("Country: ${userData.country}");

        // Close loading dialog
        Navigator.of(context).pop();

         // Fetch current events
       List<Map<String, dynamic>> currentEventsData = await DatabaseService().getEvents();
       List<Event> currentEvents = currentEventsData.map((eventData) => Event.fromMap(eventData)).toList();

        print("Fetched events on login: $currentEvents");


        // Check if the user is an admin or a regular user
        if (userData.role == 'admin') {
          // Navigate to Admin Home Page
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => AdminHomepage(userData: userData)),
          );
        } else {
          // Navigate to User Home Page
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => Mainscreen(userData: userData, events: currentEvents,)),
          );
        }
      } else {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error fetching user data')),
        );
      }
    } else {
      // No user found (shouldn't happen as FirebaseAuth should guarantee user)
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No user found')),
      );
    }
  } on FirebaseAuthException catch (e) {
    // Handle Firebase login exceptions
    print('Error logging in: ${e.message}');
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error logging in: ${e.message}')),
    );
  } catch (e) {
    // Handle unexpected errors
    print('Unexpected error logging in: $e');
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Unexpected error logging in: $e')),
    );
  }

  return null;
}

Future<void> userLogout(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    print('User logged out successfully');
    Navigator.pop(context);
  } catch (e) {
    print('Error logging out user: $e');
  }
}

Future<void> reset(String email) async {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  try {
    await auth.sendPasswordResetEmail(email: email);

    Fluttertoast.showToast(msg: "Link delivered to your email");
  } on FirebaseAuthException catch (e) {
    Fluttertoast.showToast(msg: "Registration Failed: ${e.message}");

    print(e);
  } catch (e) {
    Fluttertoast.showToast(msg: "Registration Failed: $e");
  }
}
