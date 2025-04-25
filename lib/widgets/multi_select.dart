import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MultiSelectDropdown extends StatefulWidget {
  final List<String> members; // List of members
  final TextEditingController controller;
  final Function(List<String>) onSelectedMembersChanged;

  const MultiSelectDropdown({
    super.key,
    required this.members,
    required this.controller,
    required this.onSelectedMembersChanged,
  });

  @override
  _MultiSelectDropdownState createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
  List<String> selectedMembers = [];
  bool isFetching = false; 

  @override
  void initState() {
    super.initState();
    fetchMembers(); 
  }

  Future<void> fetchMembers() async {
    if (widget.members.isNotEmpty) return; 

    setState(() => isFetching = true);

    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('users').get();

      List<String> fetchedMembers = snapshot.docs.map((doc) {
        var personalInfo = doc['personal_details'] as Map<String, dynamic>?;
        var name = (personalInfo?['fullname'] ?? "Unnamed") as String;
        return name;
      }).toList();

      setState(() {
        widget.members.clear();
        widget.members.addAll(fetchedMembers); 
        isFetching = false;
      });
    } catch (e) {
      print("Error fetching members: $e");
      setState(() => isFetching = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          child: Text(
            "Mentions",
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Colors.black87,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _showMultiSelectDialog(context),
          child: AbsorbPointer(
            child: TextField(
              controller: widget.controller,
              readOnly: true,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                hintText: selectedMembers.isNotEmpty
                    ? selectedMembers.join(', ')
                    : 'Select members',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showMultiSelectDialog(BuildContext context) async {
  final List<String> tempSelectedMembers = List.from(selectedMembers);

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder( 
        builder: (context, setDialogState) {
          return AlertDialog(
            title: Text(
              'Select Members',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: widget.members.map<Widget>((String member) {
                  return CheckboxListTile(
                    value: tempSelectedMembers.contains(member),
                    onChanged: (bool? selected) {
                      setDialogState(() { 
                        if (selected ?? false) {
                          tempSelectedMembers.add(member);
                        } else {
                          tempSelectedMembers.remove(member);
                        }
                      });
                    },
                    title: Text(
                      member,
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  );
                }).toList(),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedMembers = List.from(tempSelectedMembers);
                  });

                  widget.controller.text = selectedMembers.join(', ');

                  // 🔹 Ensure onSelectedMembersChanged is called
                  widget.onSelectedMembersChanged(selectedMembers);

                  Navigator.pop(context);
                },
                child: Text('Done'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
            ],
          );
        },
      );
    },
  );
}
}
