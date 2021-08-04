// ignore: import_of_legacy_library_into_null_safe
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:budget_tracker/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  get primary => Color.fromRGBO(220, 20, 60, 10);

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(
          Icons.add,
          size: 25,
        ),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  getBody() {}

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
