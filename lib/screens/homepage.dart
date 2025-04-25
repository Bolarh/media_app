import 'package:flutter/material.dart';
import 'package:kp2/model/events_model.dart';
import 'package:kp2/model/user_model.dart';
import 'package:kp2/widgets/below_top_info.dart';
import 'package:kp2/widgets/my_shifts.dart';
import 'package:kp2/widgets/top_info_section.dart';

class MainScreen extends StatefulWidget {
  final UserInfor userData;
    final List<Event> events;
   const MainScreen({super.key, required this.userData, required this.events});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    print("Homepage received userData: ${widget.userData.fullname}");
    print("Homepage received userData: ${widget.events[0].description}");
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            MyInfo(userData: widget.userData, events: widget.events,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.035, vertical: h * 0.013),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Buttons(),

                  SizedBox(height: h*0.025),
                  MyShifts(),

                  SizedBox(height: h*0.025),

                  Text("Coming up this week...")
              
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}