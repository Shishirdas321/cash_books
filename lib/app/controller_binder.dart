import 'package:cash_books/features/auth/controller/auth_controller.dart';
import 'package:cash_books/features/auth/repository/auth_repo.dart';
import 'package:cash_books/features/common/controllers/main_bottom_nav_bar_controller.dart';
import 'package:cash_books/features/home/controllers/all_business_controller.dart';
import 'package:cash_books/features/home/controllers/create_new_business_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/utils/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/dio/utils/logging_interceptor.dart';


class ControllerBinder extends Bindings{
  @override
  Future<void> dependencies() async {


    final sharedPreferences = await SharedPreferences.getInstance();
    Get.put(() => sharedPreferences);

    Get.put(Dio());
    Get.put(LoggingInterceptor());

    // getIt.registerLazySingleton(() => Connectivity());
    // getIt.registerLazySingleton(() => PermissionService());

    // Core




    Get.put(DioClient(AppConstants.BASE_URL,Get.find(),sharedPreferences:Get.find(), loggingInterceptor: Get.find(),));
    Get.put(MainBottomNavBarController());
     Get.put(AuthRepo(dioClient: Get.find(), sharedPreferences: Get.find()));
     Get.put( AuthController(  authRepo: Get.find()));
     Get.put(CreateNewBusinessController(createBusinessRepo: Get.find()));
     Get.put(AllBusinessController(getBusinessRepo: Get.find()));
  }
}

