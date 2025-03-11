import 'package:flutter/material.dart';
import 'package:kp2/widgets/below_top_info.dart';
import 'package:kp2/widgets/my_shifts.dart';
import 'package:kp2/widgets/top_info_section.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            MyInfo(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.035, vertical: h * 0.013),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Buttons(),

                  SizedBox(height: h*0.025),
                  MyShifts()
              
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}