import 'package:flutter/material.dart';
import 'package:kp2/screens/admin_add_user_screen.dart';
import 'package:kp2/screens/homepage.dart';
import 'package:kp2/screens/profile_page.dart';
import 'package:kp2/screens/team_members.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}
 int _currentIndex = 0;
 

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
     double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  Scaffold(
       bottomNavigationBar:  NavigationBar(
              elevation: h * 0.06,
              labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
              animationDuration: const Duration(seconds: 1),
              backgroundColor: Colors.white,
              indicatorColor: Color.fromARGB(255, 247, 243, 249),
              height: h * 0.09,
              selectedIndex: _currentIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              destinations:  [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined, color: Colors.black38,size: h*0.05,),
                  label: "Home",
                ),
                NavigationDestination(
                  icon: Icon(Icons.groups_3_outlined, color: Colors.black38,size: h*0.05,),
                  label: "Team",
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_4_rounded, color: Colors.black38,size: h*0.05,),
                  label: "Add User",
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.person_3_outlined,
                    color: Colors.black38,size: h*0.05,
                  ),
                  label: "Profile", 
                  
                ),
              ],
            ),
            body: _buildBody(),
    );
  }
  Widget _buildBody() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        const MainScreen(),
        const TeamMembers(),
        AdminScreen(),
        const Profile(),
         
      ],
    );
  }
}