import 'package:cash_books/features/book/ui/screens/controllers/cash_out_controller.dart';
import 'package:cash_books/features/common/controllers/main_bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
    //Get.lazyPut<CashOutController>(() => CashOutController());
  }
}