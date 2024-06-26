// carousel slider
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void closeAppUsingSystemPop() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  final List<Map<String, String>> IconData = [
    {"imagepath": "asset/clothes_15018617.png", "name": "Men"},
    {"imagepath": "asset/clothes_1301298.png", "name": "Women"},
    {"imagepath": "asset/leggings_3711646.png", "name": "Clothing"},
    {"imagepath": "asset/shopping-bag_5810680.png", "name": "Posters"},
    {"imagepath": "asset/hat_5258948.png", "name": "Music"},
  ];
  final List<Map<String, String>> imagepath = [
    {"capital": "asset/Group 8937.png"},
    {"capital": "asset/Group 8939.png"},
    {"capital": "asset/Group 8932 (1).png"},
  ];
  final List<Map<String, String>> imagepathrow = [
    {"capital": "asset/Rectangle 4.png"},
    {"capital": "asset/Rectangle 5.png"},
  ];
  List imageList = [
    {"id": 1, "image_path": 'asset/Group 8938.png'},
    {"id": 2, "image_path": 'asset/poster2.png'},
    {"id": 3, "image_path": 'asset/poster1.png'}
  ];
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
            )),
        body: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: IconData.map((countryInfo) {
                      final String? imagepath = countryInfo['imagepath'];
                      final String? name = countryInfo['name'];
                      return Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(140, 189, 220, 222),
                                borderRadius: BorderRadius.circular(50)),
                            child: TextButton(
                              onPressed: () {},
                              child: Image.asset(imagepath!),
                            ),
                          ),
                          Text(
                            name!,
                            style:
                                TextStyle(color: Color.fromARGB(106, 0, 0, 0)),
                          )
                        ],
                      );
                    }).toList(),
                    //     child:
                  ),
                ),
                Expanded(
                    child: ListView(padding: EdgeInsets.all(10), children: [
                  Column(children: [
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            print(currentIndex);
                          },
                          child: CarouselSlider(
                            items: imageList
                                .map(
                                  (item) => Image.asset(
                                    item['image_path'],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                )
                                .toList(),
                            carouselController: carouselController,
                            options: CarouselOptions(
                              scrollPhysics: const BouncingScrollPhysics(),
                              autoPlay: true,
                              aspectRatio: 2,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: imageList.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () =>
                                    carouselController.animateToPage(entry.key),
                                child: Container(
                                  width: currentIndex == entry.key ? 20 : 20,
                                  height: 3.0,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 3.0,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: currentIndex == entry.key
                                          ? const Color.fromARGB(255, 0, 0, 0)
                                          : Color.fromARGB(255, 110, 110, 110)),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: Column(
                    children: imagepath.map((countryInfo) {
                      final String? capital = countryInfo['capital'];
                      return Column(
                        children: [
                          InkWell(
                              child: Image.asset(
                            capital!,
                            width: screenWidth,
                          )),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    }).toList(),
                  )),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: imagepathrow.map((countryInfo) {
                      final String? capital = countryInfo['capital'];

                      return Column(
                        children: [
                          Image.asset(
                            capital!,
                            width: screenWidth * 0.45,
                            height: 200,
                          ),
                        ],
                      );
                    }).toList(),
                  )),
                ]))
              ],
            )));
  }
}
