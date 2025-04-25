import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // Firestore instance
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add event to Firestore
  Future<void> addEvent( String eventName, String eventDescription,
   String eventDate,  List<String> mentions, ) async {
    try {
      await _db.collection('events').add({
        'title': eventName.trim(),
        'description': eventDescription.trim(),
        'date': eventDate.trim(),
        'mentions': mentions,
        'created_at': FieldValue.serverTimestamp(), // Timestamp for when the event is created
      });
      print("Event added successfully!");
    } catch (e) {
      print("Failed to add event: $e");
      rethrow; // Rethrow to handle in the UI layer
    }
  }

  // Fetch events from Firestore
  Future<List<Map<String, dynamic>>> getEvents() async {
    try {
      QuerySnapshot snapshot = await _db.collection('events').get();
      List<Map<String, dynamic>> events = snapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
      return events;
    } catch (e) {
      print("Failed to fetch events: $e");
      rethrow; // Rethrow to handle in the UI layer
    }
  }

//   Future<List<Map<String, dynamic>>>  getEvents() async {
//   try {
//     // Get today's date as a Timestamp
//     Timestamp today = Timestamp.fromDate(DateTime.now());

//     // Fetch events where the date is after today
//     QuerySnapshot snapshot = await _db.collection('events')
//         .where('date', isGreaterThanOrEqualTo: today)
//         .orderBy('date')
//         .get();

//     List<Map<String, dynamic>> events = snapshot.docs.map((doc) {
//       return doc.data() as Map<String, dynamic>;
//     }).toList();
//     return events;
//   } catch (e) {
//     print("Failed to fetch events: $e");
//     throw e; // Rethrow to handle in the UI layer
//   }
// }

}

Future<List<Map<String, dynamic>>> getAllUsers() async {
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    // Convert documents to a list of maps
    List<Map<String, dynamic>> users = querySnapshot.docs.map((doc) {
      return {
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      };
    }).toList();

    return users;
  } catch (e) {
    print('Error fetching users: $e');
    return [];
  }
}
