import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_demo/bottom_navigation/main_navigation_controler.dart';
import 'package:getx_demo/bottom_navigation/tab_navigator.dart';

class MainBottomNavigation extends GetView<MainBottomNavigationController> {
  const MainBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded)),
          title: Text(
            controller.title,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        body: SafeArea(
            child: Stack(
              children: [
                _buildOffstageNavigator("Page1"),
                _buildOffstageNavigator("Page2"),
                _buildOffstageNavigator("Page3"),
              ],
            )
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Page A"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications), label: "Page B"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_sharp), label: "Page C"),
              ],
              currentIndex: controller.selectedIndex.value,
              onTap: (index) => {
                controller.selectTab(index)
              },
            )),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Obx(() => Offstage(
      offstage: controller.currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: controller.navigatorKeys[tabItem] ?? (GlobalKey<NavigatorState>()) ,
        tabItem: tabItem,
      ),
    ));
  }
}
