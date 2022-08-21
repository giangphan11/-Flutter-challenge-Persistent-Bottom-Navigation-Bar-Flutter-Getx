import 'package:get/get_state_manager/get_state_manager.dart';

class FirstController extends GetxController{
  int _firstValue = 0;

  int get firstValue => _firstValue;

  void updateFirstValue(){
    _firstValue += 5;
    update();
  }

}