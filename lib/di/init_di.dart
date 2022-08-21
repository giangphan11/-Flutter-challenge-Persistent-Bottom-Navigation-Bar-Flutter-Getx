import 'package:get/get.dart';
import 'package:getx_demo/bottom_navigation/main_navigation_controler.dart';
import 'package:getx_demo/nav2/nav_new2.dart';

class InitDI extends Bindings{

  @override
  void dependencies() {
    Get.put(MainBottomNavigationController());
    Get.put(RootController());
    //Get.lazyPut(() => RootController(), fenix: true);
   // Get.lazyPut(() => PageAController());
   // Get.lazyPut(() => PageBController());
  }
}