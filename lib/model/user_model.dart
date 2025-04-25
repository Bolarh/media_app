

class Usar{

  final String uid;

  Usar({required this.uid});

 
}

 class UserInfor {
  final String id;
  final String fullname;
  final String dob;
  final String name;
  final String email;
  final String country;
  final String postCode;
  final String detailedAddress;
  final String city;
  final String emergencyNumber;
  final String personalTelephone;
  final String department;
  final String relationship;
  final String role;

  UserInfor({
    required this.role,
    required this.relationship,
    required this.id, 
    required this.emergencyNumber, 
    required this.personalTelephone, 
   required this.name,
    required this.postCode,
     required this.fullname, 
    required this.dob, 
    required this.email,
    required this.detailedAddress,
    required this.city,
    required this.department, 
    required this.country,
    
  });
  }