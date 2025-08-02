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
  // int _selectedIndex = 0;  // removed (not reactive) ❌

  // --- updated: Observable index ব্যবহার করা হয়েছে, যাতে Obx দিয়ে সরাসরি listen করা যায়
  var selectedIndex = 0.obs; // added

  // int get selectedIndex => _selectedIndex;  // removed, কারণ আমরা এখন RxInt ব্যবহার করছি

  // --- updated: এখন set করার জন্য শুধু value change করতে হবে
  void changeIndex(int index) {
    selectedIndex.value = index; // updated
    // update(); // removed, Obx থাকলে লাগবে না
  }
}
