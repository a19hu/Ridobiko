import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color.fromARGB(245, 255, 255, 255),
              statusBarIconBrightness: Brightness.dark,
            ),
            title: Image.asset(
              'asset/logos.png',
              height: 50,
            ),
            centerTitle: true,
            toolbarHeight: 100,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                child: GNav(
                  gap: 8,
                  activeColor: Color.fromARGB(255, 82, 171, 226),
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  // tabBackgroundColor: const Color.fromARGB(255, 111, 70, 70)!,
                  color: const Color.fromARGB(169, 0, 0, 0),
                  tabs: [
                    GButton(
                      icon: LineIcons.home,
                      text: 'Shop',
                    ),
                    GButton(
                      icon: LineIcons.search,
                      text: 'Search',
                    ),
                    GButton(
                      icon: LineIcons.shoppingBag,
                      text: 'Items',
                    ),
                    GButton(
                      icon: LineIcons.user,
                      text: 'Profile',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            )),);
  }
}