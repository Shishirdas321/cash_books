// // // import 'dart:convert';
// // // import 'dart:io';
// // //
// // // import 'package:cash_books/datasource/local/session.dart';
// // // import 'package:cash_books/datasource/remote/models/api_response.dart';
// // // import 'package:cash_books/features/home/model/AllBusinessResponse.dart';
// // // import 'package:cash_books/features/home/model/CreateNewBusinessResponse.dart';
// // // import 'package:cash_books/features/home/repository/home_repo.dart';
// // // import 'package:cash_books/features/home/repository/get_business_repo.dart';
// // // import 'package:cash_books/features/home/ui/screens/home_screen.dart';
// // // import 'package:cash_books/settings/LogoutallResponse.dart';
// // // import 'package:dio/dio.dart';
// // // import 'package:get/get.dart' as g;
// // //
// // // import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
// // // import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// // //
// // //
// // //
// // //
// // // import '../../../core/widgets/custom_snackbar.dart';
// // //
// // // import '../../../datasource/remote/dio/dio_client.dart';
// // // import '../../common/ui/screens/main_bottom_nav_bar_screen.dart';
// // //
// // //
// // //
// // // class AllBusinessController extends GetxController implements GetxService {
// // //   final GetBusinessRepo getBusinessRepo;
// // //
// // //   AllBusinessController({
// // //     required this.getBusinessRepo,
// // //   });
// // //
// // //
// // //
// // //   List<AllBusinessController> _businessList = [];
// // //   String errorMsg="";
// // //
// // //   bool _isLoading = false;
// // //   List<AllBusinessController> get businessList => _businessList;
// // //
// // //
// // //
// // //   bool get isLoading => _isLoading;
// // //   bool  isLoadingbtn = false;
// // //   set isLoading(bool value) {
// // //     _isLoading = value;
// // //   }
// // //
// // //
// // //
// // //   Future<void> allBusiness()async{
// // //     isLoading = true;
// // //     update();
// // //
// // //     Response response = await getBusinessRepo.allBusiness();
// // //     if(response.statusCode == 200 ){
// // //       List<AllBusinessController> list = [];
// // //       for(Map<String,dynamic> data in response.data!['data']){
// // //         list.add(AllBusinessResponse.fromJson(data) );
// // //       }
// // //       AllBusinessResponse allBusinessResponse =  AllBusinessResponse.fromJson(response.data);
// // //       String msg = response.data["message"];
// // //       showCustomSnackBar('$msg',isError: false,isPosition: true);
// // //       //g.Get.off(HomeScreen());
// // //     }else{
// // //       isLoading = false;
// // //       update();
// // //     }
// // //   }
// // //
// // //
// // //
// // //
// // //
// // //
// // // }
// //
// //
// // //2
// // //
// // // import 'package:get/get.dart';
// // // import 'package:dio/dio.dart' as dio;
// // // import '../../../core/widgets/custom_snackbar.dart';
// // // import '../../home/model/AllBusinessResponse.dart';
// // // import '../../home/repository/get_business_repo.dart';
// // //
// // // class AllBusinessController extends GetxController implements GetxService {
// // //   final GetBusinessRepo getBusinessRepo;
// // //
// // //   AllBusinessController({
// // //     required this.getBusinessRepo,
// // //   });
// // //
// // //   List<Business> _businessList = [];
// // //   List<Business> get businessList => _businessList;
// // //
// // //   bool _isLoading = false;
// // //   bool get isLoading => _isLoading;
// // //
// // //   String errorMsg = "";
// // //   int currentPage = 1;
// // //   int lastPage = 1;
// // //
// // //   set isLoading(bool value) {
// // //     _isLoading = value;
// // //     update();
// // //   }
// // //
// // //   Future<void> allBusiness({int page = 1}) async {
// // //     if (page == 1) {
// // //       _businessList.clear();
// // //     }
// // //
// // //     isLoading = true;
// // //
// // //     try {
// // //       dio.Response response = await getBusinessRepo.allBusiness(page: page);
// // //
// // //       if (response.statusCode == 200) {
// // //         AllBusinessResponse allBusinessResponse = AllBusinessResponse.fromJson(response.data);
// // //
// // //         if (allBusinessResponse.data != null) {
// // //           _businessList.addAll(allBusinessResponse.data!.businesses ?? []);
// // //
// // //           currentPage = allBusinessResponse.data!.currentPage ?? page;
// // //           lastPage = allBusinessResponse.data!.lastPage ?? page;
// // //
// // //           showCustomSnackBar(allBusinessResponse.message ?? "Success", isError: false, isPosition: true);
// // //         }
// // //       } else {
// // //         errorMsg = "Failed to load data: ${response.statusCode}";
// // //         showCustomSnackBar(errorMsg, isError: true);
// // //       }
// // //     } catch (e) {
// // //       errorMsg = "Exception: $e";
// // //       showCustomSnackBar(errorMsg, isError: true);
// // //     } finally {
// // //       isLoading = false;
// // //     }
// // //   }
// // //
// // //   Future<void> loadNextPage() async {
// // //     if (currentPage < lastPage && !isLoading) {
// // //       await allBusiness(page: currentPage + 1);
// // //     }
// // //   }
// // // }
// //
// //
// // //3
// //
//import 'package:cash_books/features/home/model/BookResponse.dart';
import 'package:cash_books/features/home/model/DeleteBusinessResponse.dart';
import 'package:cash_books/features/home/model/RenameBusinessResponse.dart';
import 'package:cash_books/features/home/ui/screens/add_new_business_screen.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_snackbar.dart';



import 'package:cash_books/datasource/local/session.dart';
import 'package:cash_books/datasource/remote/models/api_response.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_core/src/get_main.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

//import '../model/AllBusinessResponse.dart';
import '../model/AllBusinessResponse.dart';
import '../model/BookResponse.dart';
import '../model/CreateNewBusinessResponse.dart';
import '../repository/home_repo.dart';
import '../ui/screens/home_screen.dart';

import 'package:cash_books/features/home/model/AllBusinessResponse.dart' as business_model;
import 'package:cash_books/features/home/model/BookResponse.dart' as book_model;







class HomeController extends GetxController implements GetxService {
  final HomeRepo homeRepo;

  HomeController({ required this.homeRepo });

  List<business_model.Business> _businessList = [];
  List<business_model.Business> get businessList => _businessList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingbtn = false;
  bool get isLoadingbtn => _isLoadingbtn;

  String errorMsg = "";

  int currentPage = 1;
  int lastPage = 1;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  set isLoadingbtn(bool value) {
    _isLoadingbtn = value;
    update();
  }

  //business selector
  int selectedBusinessIndex = 0;

  void selectBusiness(int index) {
    selectedBusinessIndex = index; // select new index
    update();
  }


  // @override
 //  void onInit() {
 //    super.onInit();
 //    allBusiness(page: 1);
 //
 //
 //  }

  Future<void> allBusiness({int page = 1}) async {
    if (page == 1) {
      _businessList.clear();
      errorMsg = "";  // clear previous error message
    }

    isLoadingbtn = true;

    ApiResponse apiResponse = await homeRepo.allBusiness(page: page);

    if (apiResponse.response != null && (apiResponse.response!.statusCode == 200)) {
      try {
        AllBusinessResponse allBusinessResponse = AllBusinessResponse.fromJson(apiResponse.response!.data);
        if (allBusinessResponse.data != null) {
          _businessList.addAll(allBusinessResponse.data!.businesses ?? []);
          currentPage = allBusinessResponse.data!.currentPage ?? page;
          lastPage = allBusinessResponse.data!.lastPage ?? page;

          showCustomSnackBar(allBusinessResponse.message ?? "Success", isError: false, isPosition: true);
        }
      } catch (e) {
        showCustomSnackBar(apiResponse.error.toString(), isError: true);
      }
    } else {
      errorMsg = apiResponse.error ?? "Unknown error occurred";
      showCustomSnackBar(errorMsg, isError: true);
    }

    isLoadingbtn = false;
  }

  Future<void> loadNextPage() async {
    if (currentPage < lastPage && !isLoadingbtn) {
      await allBusiness(page: currentPage + 1);
    }
  }


  List<book_model.Book> _bookList = [];
  List<book_model.Book> get bookList => _bookList;

  int bookCurrentPage = 1;
  int bookLastPage = 1;
  bool _isLoadingBooks = false;
  bool get isLoadingBooks => _isLoadingBooks;

  set isLoadingBooks(bool value) {
    _isLoadingBooks = value;
    update();
  }

  Future<void> allBook({ int page = 1, required int businessId}) async {
    if (page == 1) {
      _bookList.clear();
    }

    isLoadingBooks = true;

    ApiResponse apiResponse = await homeRepo.allBook( page: page, id: businessId);

    if (apiResponse.response != null && (apiResponse.response!.statusCode == 200)) {
      try {
        AllBookResponse bookResponse = AllBookResponse.fromJson(apiResponse.response!.data);
        if (bookResponse.data != null) {
          _bookList.addAll(bookResponse.data!.books ?? []);
          bookCurrentPage = bookResponse.data!.currentPage ?? page;
          bookLastPage = bookResponse.data!.lastPage ?? page;
        }
      } catch (e) {
        showCustomSnackBar("Book parse error: $e", isError: true);
      }
    } else {
      showCustomSnackBar(apiResponse.error ?? "Book API error", isError: true);
    }

    isLoadingBooks = false;
  }

  Future<void> loadNextBookPage(int businessId) async {
    if (bookCurrentPage < bookLastPage && !isLoadingBooks) {
      await allBook(businessId: businessId, page: bookCurrentPage + 1);
    }
  }



  Future<void> createNewBusiness({
    required String name
  })async{
    isLoading = true;
    update();

    ApiResponse apiResponse = await homeRepo.createNewBusiness(name: name);
    if ((apiResponse.response?.statusCode??-1) == 200||(apiResponse.response?.statusCode??-1)==201) {

      BusinessResponse createNewBusinessResponse = BusinessResponse.fromJson(apiResponse.response?.data);
      String msg = createNewBusinessResponse.message?? "";
      showCustomSnackBar('$msg',isError: false,isPosition: true);

      g.Get.off(HomeScreen());
    }else{
      // showCustomSnackBar(.error.toString(),);
      _isLoading = false;
      update();
    }
    isLoading = false;
    update();
  }

  //delete business

  Future<void> deleteBusiness( int id,)async{
    isLoading = true;
    update();

    ApiResponse apiResponse = await homeRepo.deleteBusiness(id);
    if ((apiResponse.response?.statusCode??-1) == 200) {

      DeleteBusinessResponse deleteBusinessResponse = DeleteBusinessResponse.fromJson(apiResponse.response?.data);
      businessList.removeWhere((business) => business.id == id);

      update();
      String msg = deleteBusinessResponse.message?? "";
      showCustomSnackBar('$msg',isError: false,isPosition: true);

      g.Get.off(HomeScreen());
    }else{
      // showCustomSnackBar(.error.toString(),);
      _isLoading = false;
      update();
    }
    isLoading = false;
    update();
  }


  //Update Business
  Future<void> updateBusiness({
    required int id,
    required String name,
    required int status,
  }) async {
    isLoading = true;
    update();

    ApiResponse apiResponse = await homeRepo.updateBusiness(
        id: id,
        name: name,
        status: status
    );

    if ((apiResponse.response?.statusCode ?? -1) == 200) {
      RenameBusinessResponse renameBusinessResponse =
      RenameBusinessResponse.fromJson(apiResponse.response?.data);

      String msg = renameBusinessResponse.message ?? "";
      showCustomSnackBar(msg, isError: false, isPosition: true);

      g.Get.off(HomeScreen());
    } else {
      isLoading = false;
      update();
    }

    isLoading = false;
    update();
  }


  //create new book

  // Future<void> createNewBook({
  //   required String name,
  //   required double balance,
  //   required int id
  // })async{
  //   isLoading = true;
  //   update();
  //
  //   ApiResponse apiResponse = await homeRepo.createNewBook(name: name,balance: balance, id: id);
  //   if ((apiResponse.response?.statusCode??-1) == 200||(apiResponse.response?.statusCode??-1)==201) {
  //
  //     BusinessResponse createNewBusinessResponse = BusinessResponse.fromJson(apiResponse.response?.data);
  //     String msg = createNewBusinessResponse.message?? "";
  //     showCustomSnackBar('$msg',isError: false,isPosition: true);
  //
  //   }else{
  //     // showCustomSnackBar(.error.toString(),);
  //     _isLoading = false;
  //     update();
  //   }
  //   isLoading = false;
  //   update();
  // }
  Future<void> createNewBook({
    required String name,
    required double balance,
    required int id,
  }) async {
    isLoading = true;
    update();

    ApiResponse apiResponse = await homeRepo.createNewBook(
      name: name,
      balance: balance,
      id: id,
    );

    if ((apiResponse.response?.statusCode ?? -1) == 200 ||
        (apiResponse.response?.statusCode ?? -1) == 201) {
      BusinessResponse createNewBookResponse =
      BusinessResponse.fromJson(apiResponse.response?.data);

      String msg = createNewBookResponse.message ?? "";
      showCustomSnackBar(msg, isError: false, isPosition: true);

      //  Safe check
      if (createNewBookResponse.data != null) {
        try {
          // if data single object
          final newBook = createNewBookResponse.data;



          // add to book list
          bookList.insert(0, newBook as Book);
          update();
        } catch (e) {
          // fallback: recall new list
          await allBook(businessId: id, page: 1);
        }
      } else {
        // fallback jodi data null hoi
        await allBook(businessId: id, page: 1);
      }
    } else {
      _isLoading = false;
      update();
    }

    isLoading = false;
    update();
  }






}






