import 'package:flutter/material.dart';
import 'package:getx_demo/bottom_navigation/screens/page_b.dart';
import 'package:getx_demo/bottom_navigation/screens/page_c.dart';

import 'screens/page_a.dart';



class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {

    Widget child = PageA();
    if(tabItem == "Page1")
      child = PageA();
    else if(tabItem == "Page2")
      child = PageB();
    else if(tabItem == "Page3")
      child = PageC();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            builder: (context) => child
        );
      },
    );
  }
}