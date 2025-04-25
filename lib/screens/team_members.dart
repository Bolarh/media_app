import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamMembers extends StatefulWidget {
  const TeamMembers({super.key});

  @override
  State<TeamMembers> createState() => _TeamMembersState();
}

class _TeamMembersState extends State<TeamMembers> {
  List<Map<String, dynamic>> usersList = [];

  Future<void> fetchUsers() async {
    try {
     
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('users').get();

      User? currentUser = FirebaseAuth.instance.currentUser;
 
      if (snapshot.docs.isEmpty) {
        Fluttertoast.showToast(msg: "No users found.");
        return;
      }

      setState(() {
        usersList = snapshot.docs.where((doc) {
          
          return doc.id != currentUser?.uid;
        }).map((doc) {
          return doc.data() as Map<String, dynamic>;
        }).toList();
      });

      print("Users fetched: ${usersList.length}");
    } catch (e) {
      print("Error fetching users: $e");
      Fluttertoast.showToast(msg: "Error fetching users.");
    }
  }

  @override
  void initState() {
    super.initState();
    
    fetchUsers();
  }

  String getInitials(String fullname) {
    List<String> nameParts = fullname.split(' ');
    String initials = '';

    for (String name in nameParts) {
      if (name.isNotEmpty) {
        initials +=
            name[0].toUpperCase(); 
      }
    }

    return initials.isNotEmpty
        ? initials
        : 'U'; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Members', style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),),
      ),
      body: usersList.isEmpty
          ? Center(
              child:
                  CircularProgressIndicator())
                         : ListView.builder(
              itemCount: usersList.length,
              itemBuilder: (context, index) {
                var user = usersList[index];
                String fullname =
                    user['personal_details']['fullname'] ?? 'Unknown';

                String initials = getInitials(fullname);

                return ListTile(
                  title: Text(
                    user['personal_details']['fullname'] ?? 'Unknown',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ), 
                  subtitle: Text(
                    user['personal_details']['email'] ?? 'No email',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ), 
                  leading: CircleAvatar(
                    child: Text(
                      initials, 
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                   
                  },
                );
              },
            ),
    );
  }
}
