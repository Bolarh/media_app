import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kp2/model/user_model.dart';

Future<UserInfor?> getUserData(User? user) async {
  if (user != null) {
    try {
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

      if (userDoc.exists) {
        var personalDetails = userDoc.data()?['personal_details'] ?? {};
        var emergencyContact = userDoc.data()?['emergency_contact'] ?? {};
        var address = userDoc.data()?['address'] ?? {};

        String fullname = personalDetails['fullname'] ?? 'N/A';
        String dob = personalDetails['date_of_birth'] ?? 'N/A';
        String personalTelephone = personalDetails['telephone'] ?? 'N/A';
        String personalEmail = personalDetails['email'] ?? 'N/A';
        String country = address['country'] ?? 'N/A';
        String postCode = address['post_code'] ?? 'N/A';
        String detailedAddress = address['detail_address'] ?? 'N/A';
        String city = address['city'] ?? 'N/A';
        String emergencyNumber = emergencyContact['telephone'] ?? 'N/A';
        String department = userDoc.data()?['department'] ?? 'N/A';
        String role = userDoc.data()?['role'] ?? 'N/A';
        String name = emergencyContact['name'];
        String relationship = emergencyContact['relationship'] ?? 'N/A';


        return UserInfor(
          fullname: fullname,
          dob: dob,
          id: user.uid,
          email: personalEmail,
          personalTelephone: personalTelephone,
          country:country,
          postCode: postCode,
          emergencyNumber: emergencyNumber,
          city: city,
          detailedAddress: detailedAddress, 
          department: department,
          name:name,
          relationship:relationship,
          role: role,
        );
      } else {
        print('User document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching user info: $e');
      return null;
    }
  } else {
    print('User is null');
    return null;
  }
}
