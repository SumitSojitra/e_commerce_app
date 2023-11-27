import 'package:extra_project/views/Assets/colors.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:extra_project/views/screen/homePage.dart';
import 'package:extra_project/views/screen/page2.dart';
import 'package:extra_project/views/screen/page3.dart';
import 'package:extra_project/views/screen/page4.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  late PageController pageController;
  int selectedIndex = 0;

  List<Widget> allPages = [
    HomePage(),
    Page2(),
    Page3(),
    Page4(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: selectedIndex, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (val) {
          setState(() {
            selectedIndex = val;
          });
        },
        children: allPages,
      ),
      bottomNavigationBar: Container(
        height: 54,
        color: Colors.teal,
        child: FlashyTabBar(
          animationCurve: Curves.linear,
          selectedIndex: selectedIndex,
          onItemSelected: (val) {
            setState(() {
              selectedIndex = val;
              pageController.animateToPage(selectedIndex,
                  duration: Duration(milliseconds: 10), curve: Curves.linear);
            });
          },
          showElevation: false,
          backgroundColor: AppColors.bg,
          items: [
            FlashyTabBarItem(
              icon: Icon(IconlyLight.home),
              title: Text(
                'Home',
                style: GoogleFonts.montserrat(),
              ),
            ),
            FlashyTabBarItem(
              activeColor: Colors.red,
              icon: Icon(IconlyLight.heart),
              title: Text(
                'Favaroit',
                style: GoogleFonts.montserrat(),
              ),
            ),
            FlashyTabBarItem(
              icon: Icon(IconlyLight.search),
              title: Text(
                'Search',
                style: GoogleFonts.montserrat(),
              ),
            ),
            FlashyTabBarItem(
              icon: Icon(IconlyLight.setting),
              title: Text(
                'Profile',
                style: GoogleFonts.montserrat(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
