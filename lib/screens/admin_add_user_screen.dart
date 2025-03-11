import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _emergencyContactNameController = TextEditingController();
  final _emergencyContactTelephoneController = TextEditingController();
  final _emergencyContactRelationshipController = TextEditingController();
  final _departmentController = TextEditingController();
  final _postCodeController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _detailAddressController = TextEditingController();

  @override
   Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dobController.text = DateFormat('dd-MM-yy').format(picked);
      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

              buildLabel("Full Name"),
              buildTextField( controller: _fullnameController,validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              }),

             buildLabel("Email"),
             buildTextField(controller: _emailController, validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your nationality';
                }
                return null;
              }),

             buildLabel("D.O.B"),
             buildTextFieldDOB( controller: _dobController,  onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                _selectDate(context);
              }, validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select your date of birth';
                }
                return null;
              }),

             buildLabel("Telephone"),
             buildTextField(controller: _telephoneController,validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your nationality';
                }
                return null;
              }),

             buildLabel("E.Full Name"),
             buildTextField(controller: _emergencyContactNameController, validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your nationality';
                }
                return null;
              }),

             buildLabel("E.Telephone"),
             buildTextField(controller: _emergencyContactTelephoneController, validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your nationality';
                }
                return null;
              }),

             buildLabel("E.Relationship"),
             buildTextField(controller: _emergencyContactRelationshipController, validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your nationality';
                }
                return null;
              }),

             buildLabel("Country"),
             buildTextField(controller: _countryController, validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your nationality';
                }
                return null;
              }),

             buildLabel("Department"),
             buildTextField(controller: _departmentController, validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your nationality';
                }
                return null;
              }),

             buildLabel("Post Code"),
             buildTextField(controller: _postCodeController,validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Post Code';
                }
                return null;
              }),

             buildLabel("Detailed Address"),
             buildTextField(controller: _detailAddressController, validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your nationality';
                }
                return null;
              }),

             buildLabel("City"),
             buildTextField(controller: _cityController, validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your City name';
                }
                return null;
              }),
             
             
              
             
              
              
              
           
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addUser,
                child: Text('Add User'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addUser() {
    if (_formKey.currentState!.validate()) {
      FirebaseFirestore.instance.collection('users').add({
        'personal_details': {
        'fullname': _fullnameController.text,
        'email': _emailController.text,
        'date_of_birth': _dobController.text,
        'telephone': _telephoneController.text,
        },
        
        'emergency_contact': {
          'name': _emergencyContactNameController.text,
          'telephone': _emergencyContactTelephoneController.text,
          'relationship': _emergencyContactRelationshipController.text,
        },
        'department': _departmentController.text,
        'address': {
          'post_code': _postCodeController.text,
          'city': _cityController.text,
          'country': _countryController.text,
          'detail_address': _detailAddressController.text,
        },
      }).then((value) {
        print('User Added');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User added successfully')),
        );
      }).catchError((error) {
        print('Failed to add user: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add user')),
        );
      });
    }
  }
  Widget buildTextField( {int maxLines = 1, TextEditingController? controller, required String? Function(dynamic value) validator}) {
    return TextField(
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
    _fullnameController.dispose();
    _dobController.dispose();
    _telephoneController.dispose();
    _emergencyContactNameController.dispose();
    _emergencyContactTelephoneController.dispose();
    _emergencyContactRelationshipController.dispose();
    _departmentController.dispose();
    _postCodeController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _detailAddressController.dispose();
    super.dispose();
  }
  
  buildTextFieldDOB({int maxLines = 1 , required TextEditingController controller, required VoidCallback onTap, required String? Function(dynamic value) validator}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
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
    );
  }
}
