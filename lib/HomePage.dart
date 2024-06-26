// carousel slider
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ridobiko/OtherPage.dart';
import 'package:ridobiko/Shop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void closeAppUsingSystemPop() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
  int _selectedIndex = 0;

  List<Widget> function = [
    ShopPage(),
    Otherpage(text:'Search'),
    Otherpage(text: 'Iteam'),
    Otherpage(text: 'Profile')

  ];
  @override
  Widget build(BuildContext context) {
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
                  print(_selectedIndex);
                },
              ),
            ),
          )),
      body: function[_selectedIndex],
    );
  }
}
