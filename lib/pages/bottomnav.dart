import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo1/pages/categories.dart';
import 'package:demo1/pages/home.dart';
import 'package:demo1/pages/search.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late MyHomePage home;
  late Search search;
  late Categories categories;
  late Widget currentWidget;

  @override
  void initState() {
    home = MyHomePage();
    search = Search();
    categories = Categories();
    pages = [home, search, categories];
    currentWidget = home;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: Colors.black,
          backgroundColor: Colors.white,
          height: 65,
          color: Color.fromARGB(255, 84, 87, 93),
          animationDuration: Duration(milliseconds: 500),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: const [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.category,
              color: Colors.white,
            )
          ]),
      body: pages[currentTabIndex],
    );
  }
}
