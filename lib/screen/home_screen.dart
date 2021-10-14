import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shop_app/screen/pages/add_video_page.dart';
import 'package:shop_app/screen/pages/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/screen/pages/left_page.dart';
import 'package:shop_app/screen/pages/right_page.dart';

class HomeScreen extends StatefulWidget {
  // int shopindex = 0;
  // void changeindex(int index) {
  //   setState(() {
  //     shopindex = index;
  //   });
  // }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 1;

  PageController _pageController = PageController(
    initialPage: 1,
  );
  List<Widget> _pages = [
    LeftPage(),
      // shopindex: shopindex, changeindex: changeindex),
    HomePage(),
      // shopindex: shopindex, changeindex: changeindex),
    RightPage(),
      // shopindex: shopindex, changeindex: changeindex)
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AddVideoPage()));
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterFloat,
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              currentIndex: _pageIndex,
              onTap: (value) {
                _pageIndex = value;
                _pageController.animateToPage(value,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.linear);
                setState(() {});
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.mail), title: Text("Messages")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text("Home")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), title: Text("Profile")),
              ],
            ),
            body: PageView(
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  _pageIndex = page;
                });
              },
              children: _pages,
            ));
      },
    );
  }
}
