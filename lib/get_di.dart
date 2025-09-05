
import 'package:cash_books/features/book/repository/book_repo.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/utils/app_constants.dart';
import 'datasource/local/session.dart';
import 'datasource/remote/dio/dio_client.dart';
import 'datasource/remote/dio/utils/logging_interceptor.dart';
import 'features/auth/controller/auth_controller.dart';
import 'features/auth/repository/auth_repo.dart';

import 'features/book/controllers/book_controller.dart';

import 'features/home/controllers/home_controller.dart';
import 'features/home/repository/home_repo.dart';
import 'features/navbar/controllers/main_bottom_nav_bar_controller.dart';



Future<void> init() async {



  final sharedPreferences = await SharedPreferences.getInstance();
  final dio = await Dio();
  await Session.init(sharedPreferences);
  Get.put(() => sharedPreferences);

  //Get.put(Dio());
  Get.put(LoggingInterceptor());

  Get.put(DioClient(AppConstants.BASE_URL,dio,sharedPreferences:sharedPreferences, loggingInterceptor: Get.find(),));

 ///repository
  Get.put(AuthRepo(dioClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.put(HomeRepo(dioClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.put(BookRepo(dioClient: Get.find(), sharedPreferences: sharedPreferences));


 ///Controller
  Get.put(MainBottomNavBarController());

  Get.put( AuthController(  authRepo: Get.find()));
  Get.put( HomeController(  homeRepo: Get.find()));
  Get.put(BookController(bookRepo: Get.find()));



}
