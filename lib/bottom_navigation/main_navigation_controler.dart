import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavigationController extends GetxController {
  final String title = "Main bottom navigation";

  final List<String> pageKeys = ["Page1", "Page2", "Page3"];

  final Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
  };

  var selectedIndex = 0.obs;
  var currentPage = "Page1".obs;

  void selectTab(int index){
    currentPage.value = pageKeys[index];
    selectedIndex.value = index;
  }
}
