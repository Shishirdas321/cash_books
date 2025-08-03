/*
import 'package:get/get.dart';

class MainBottomNavBarController extends GetxController{
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeIndex(int index){
    _selectedIndex = index;
    update();
  }

}*/
import 'package:get/get.dart';

class MainBottomNavBarController extends GetxController {
  // int _selectedIndex = 0;  //

  // --- updated: Observable index
  var selectedIndex = 0.obs; // added

  // int get selectedIndex => _selectedIndex;  // removed,

  // --- updated:
  void changeIndex(int index) {
    selectedIndex.value = index; // updated
    // update(); // removed, Obx
  }
}
