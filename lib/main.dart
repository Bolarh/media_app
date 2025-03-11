import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kp2/screens/mainscreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: const FirebaseOptions(
      apiKey: "",
      appId: "1:777246099575:android:33f43c7127ea9326929e72",
      messagingSenderId: "777246099575",
      projectId: "kp2-media",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Mainscreen(),
    );
  }
}
