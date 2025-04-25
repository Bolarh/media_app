import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kp2/services/db_services.dart';
import 'package:kp2/widgets/button.dart';
import 'package:kp2/widgets/multi_select.dart';


class AddEvents extends StatefulWidget {
  const AddEvents({super.key});

  @override
  State<AddEvents> createState() => _AddEventsState();
}
class _AddEventsState extends State<AddEvents> {
  List<String> members = [];
  List<String> selectedMembers = []; // List to hold selected members
  bool isFetching = false;
  final TextEditingController _mentionController = TextEditingController(); // Create the controller
final _formKey = GlobalKey<FormState>();
final _dateController = TextEditingController();
final _titleController = TextEditingController();
final _descriptionController = TextEditingController();
  // Fetch members from Firestore
  Future<void> fetchMembers() async {
    if (members.isNotEmpty) return; // Avoid unnecessary fetch

    setState(() => isFetching = true);

    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users').get();

      List<String> fetchedMembers = snapshot.docs.map((doc) {
       var personalInfo = doc['personal_details'] as Map<String, dynamic>?;
var name = personalInfo != null && personalInfo['fullname'] != null
    ? personalInfo['fullname'] as String
    : "Unnamed";

        return name;
      }).toList();

      setState(() {
        members = fetchedMembers;
        isFetching = false;
      });
      print("members : $members");
    } catch (e) {
      print("Error fetching members: $e");
      setState(() => isFetching = false);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMembers(); // Fetch members when the widget is created
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2026),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dateController.text = DateFormat('dd-MM-yy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
     double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Event"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 buildLabel("Title"),
                buildTextField(
                    controller: _titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter title';
                      }
                      return null;
                    }),
                buildLabel("Description"),
                buildTextField(
                    controller: _descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter description';
                      }
                      return null;
                    }),
                buildLabel("Date"),
                buildDate(
                    controller: _dateController,
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      _selectDate(context);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a date';
                      }
                      return null;
                    }),
                    
               // buildLabel("Mention Members"),
               MultiSelectDropdown(
  controller: _mentionController,
  members: members,
  onSelectedMembersChanged: (List<String> selected) {
    setState(() {
      selectedMembers = List.from(selected); // Ensure it's a new list reference
    });
    print("Updated selectedMembers: $selectedMembers"); // Debugging
  },
),

            
                SizedBox(height: h*0.02,),
               
                Button(
                  text: "Add event",
                 onTap: () async {
              if (_formKey.currentState!.validate()) {
                print("Title: ${_titleController.text}");
                print("Description: ${_descriptionController.text}");
                print("Date: ${_dateController.text}");
                print("Selected Members: $selectedMembers");
            
                await DatabaseService().addEvent(
                  _titleController.text, 
                  _descriptionController.text, 
                  _dateController.text,
                  selectedMembers  // Pass the list directly
                  
                );
              } else {
                print('Form is not valid');
              }
            },
            
                ),
              ],
            ),
          ),
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

  Widget buildTextField(
      {int maxLines = 1,
      TextEditingController? controller,
      required String? Function(dynamic value) validator}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
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
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ),
      validator: validator,
    );
  }

  Widget buildDate(
      {required TextEditingController controller,
      required VoidCallback onTap,
      required String? Function(dynamic value) validator}) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      onTap: onTap,
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
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ),
      validator: validator,
    );
  }
}



// class _AddEventsState extends State<AddEvents> {
//   List<String> members = [];
//   List<String> selectedMembers = []; // Track selected members
//   bool isFetching = false;

//   // Fetch members from Firestore
//   Future<void> fetchMembers() async {
//     if (members.isNotEmpty) return; // Avoid unnecessary fetch

//     setState(() => isFetching = true);

//     try {
//       QuerySnapshot snapshot =
//           await FirebaseFirestore.instance.collection('users').get();

//       List<String> fetchedMembers = snapshot.docs.map((doc) {
//         var personalInfo = doc['personal_details'] as Map<String, dynamic>?; // Ensure it's a Map
//         var name = (personalInfo?['fullname'] ?? "Unnamed") as String; // Explicit cast
//         return name;
//       }).toList();

//       setState(() {
//         members = fetchedMembers;
//         isFetching = false;
//       });
//     } catch (e) {
//       print("Error fetching members: $e");
//       setState(() => isFetching = false);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchMembers(); // Fetch members when the widget is created
//   }
// final _formKey = GlobalKey<FormState>();
// final _dateController = TextEditingController();
// final _descriptionController = TextEditingController();
// final _emailController = TextEditingController();
// final _titleController = TextEditingController();


//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null && picked != DateTime.now()) {
//       setState(() {
//         _dateController.text = DateFormat('dd-MM-yy').format(picked);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Add Event",
//           style: GoogleFonts.poppins(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon:
//               Icon(Icons.arrow_back_ios, color: Colors.black, size: h * 0.025),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding:
//               EdgeInsets.symmetric(horizontal: w * 0.035, vertical: h * 0.013),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               buildLabel("Title"),
//               buildTextField(
//                   controller: _titleController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter title';
//                     }
//                     return null;
//                   }),
//               buildLabel("Description"),
//               buildTextField(
//                   controller: _descriptionController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter description';
//                     }
//                     return null;
//                   }),
//               buildLabel("Date"),
//               buildDate(
//                   controller: _dateController,
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     _selectDate(context);
//                   },
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please select a date';
//                     }
//                     return null;
//                   }),
//               buildLabel("Mention Members"),
//               MultiSelectDropdown(
//                 members: members,
//                 onSelectedMembersChanged: (List<String> selected) {
//                   setState(() {
//                     selectedMembers = selected; // Update selected members
//                   });
//                 },
//               ),
//               SizedBox(height: h * 0.02),
//               Button(
//                 text: "Add event",
//                 onTap: () async {
//                   if (_formKey.currentState!.validate()) {
//                     await DatabaseService().addEvent(
//                       _titleController,
//                       _descriptionController,
//                       selectedMembers, // Pass the selected members
//                       _dateController,
//                     );
//                   } else {
//                     print('Form is not valid');
//                   }
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildLabel(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10, bottom: 5),
//       child: Text(
//         text,
//         style: GoogleFonts.poppins(
//           fontSize: 12,
//           fontWeight: FontWeight.w300,
//           color: Colors.black87,
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(
//       {int maxLines = 1,
//       TextEditingController? controller,
//       required String? Function(dynamic value) validator}) {
//     return TextFormField(
//       controller: controller,
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
//         filled: true,
//         fillColor: Colors.grey[200],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide.none,
//         ),
//       ),
//       style: GoogleFonts.poppins(
//         fontSize: 14,
//         fontWeight: FontWeight.w400,
//         color: Colors.black87,
//       ),
//       validator: validator,
//     );
//   }

//   Widget buildDate(
//       {required TextEditingController controller,
//       required VoidCallback onTap,
//       required String? Function(dynamic value) validator}) {
//     return TextFormField(
//       controller: controller,
//       readOnly: true,
//       onTap: onTap,
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
//         filled: true,
//         fillColor: Colors.grey[200],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide.none,
//         ),
//       ),
//       style: GoogleFonts.poppins(
//         fontSize: 14,
//         fontWeight: FontWeight.w400,
//         color: Colors.black87,
//       ),
//       validator: validator,
//     );
//   }
// }
