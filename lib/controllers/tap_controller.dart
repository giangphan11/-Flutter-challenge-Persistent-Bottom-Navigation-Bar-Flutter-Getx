import 'package:get/get_state_manager/get_state_manager.dart';

class TapController extends GetxController{
  int _x = 0;

  int get x => _x;

  void tangX(){
    _x ++;
    update();
  }

  void giamX(){
    _x --;
    update();
  }
}