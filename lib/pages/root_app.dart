import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:budget_tracker/pages/daily_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  get primary => Color.fromRGBO(4, 93, 86, 10);
  get secondary => Color.fromRGBO(83, 205, 132, 10);

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {setTabs(4)},
        child: Icon(
          Icons.add,
          size: 25,
        ),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // main body
  getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        DailyPage(),
        Center(
          child: Text("Stats Page"),
        ),
        Center(
          child: Text("Wallet Page"),
        ),
        Center(
          child: Text("Profile Page"),
        ),
        Center(
          child: Text("Create budget Page"),
        ),
      ],
    );
  }

  // footer Animated Bottom navigation bar
  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.calendar,
      Ionicons.stats_chart,
      Ionicons.wallet,
      Ionicons.person,
    ];

    return AnimatedBottomNavigationBar(
        icons: iconItems,
        activeColor: primary,
        inactiveColor: secondary,
        activeIndex: pageIndex,
        gapLocation: GapLocation.center,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        iconSize: 25,
        onTap: (index) {
          setTabs(index);
        });
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
