
import 'package:cash_books/features/book/model/AllCategoriesResponse.dart';
import 'package:cash_books/features/book/model/AllContactPerson.dart';
import 'package:cash_books/features/book/model/AllPaymentMethodResponse.dart';
import 'package:cash_books/features/book/model/BookCategoryResponse.dart';
import 'package:cash_books/features/book/model/CashInResponse.dart';
import 'package:cash_books/features/book/model/CreateContactPersonResponse.dart';
import 'package:cash_books/features/book/model/CreatePaymentMethodResponse.dart';
import 'package:cash_books/features/book/model/DeleteCategoryResponse.dart';
import 'package:cash_books/features/book/model/DeleteContactPersonResponse.dart';
import 'package:cash_books/features/book/model/DeletePaymentMethodResponse.dart';
import 'package:cash_books/features/book/model/SpecificBookDetailsRespons.dart';
import 'package:cash_books/features/book/model/SpecificTransactionDetailsResponse.dart';
import 'package:cash_books/features/book/model/TransactionHistoryResponse.dart';
import 'package:cash_books/features/book/model/UpdateCategoryResponse.dart';
import 'package:cash_books/features/book/model/UpdateContactPersonResponse.dart';
import 'package:cash_books/features/book/model/UpdatePaymentMethodResponse.dart';
import 'package:cash_books/features/book/repository/book_repo.dart';
import 'package:cash_books/features/book/ui/screens/add_cash_in_entry_screen.dart';
import 'package:cash_books/features/book/ui/screens/business_book_screen.dart';
import 'package:cash_books/features/home/ui/screens/add_new_business_screen.dart';
import 'package:get/get.dart';
import '../../../core/fonts/app_text_style.dart';
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


import 'package:cash_books/features/home/model/BookResponse.dart' as book_model;

class BookController extends GetxController implements GetxService {
  final BookRepo bookRepo;

  BookController({required this.bookRepo});

  List<Category> _catecoryList = [];
  List<Category> get categoryList => _catecoryList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingbtn = false;
  bool get isLoadingbtn => _isLoadingbtn;

  String errorMsg = "";
  int contactCurrentPage = 1;
  int contactLastPage = 1;

  int paymentCurrentPage = 1;
  int paymentLastPage = 1;

  int historyCurrentPage = 1;
  int historyLastPage = 1;


  int currentPage = 1;
  int lastPage = 1;


  get specificBookDetailsResponse => specificBookDetailsResponse;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  set isLoadingbtn(bool value) {
    _isLoadingbtn = value;
    update();
  }
  //specific book

  Future<void> specificBookDetails({required int businessId,required int bookId}) async {

    isLoadingbtn = true;

    ApiResponse apiResponse = await bookRepo.specificBookDetails(businessId: businessId, bookId: bookId);

    if (apiResponse.response != null && (apiResponse.response!.statusCode == 200)) {
      try {
        SpecificBookDetailsRespons specificBookDetailsRespons = SpecificBookDetailsRespons.fromJson(apiResponse.response!.data);
        if (specificBookDetailsRespons.data != null) {
          showCustomSnackBar(specificBookDetailsRespons.message ?? "Success", isError: false, isPosition: true);
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
  //for get book category
  int? _currentBookId;
  Future<void> allCategory({int page = 1,required int bookId}) async {
    _currentBookId = bookId;
    if (page == 1) {
      _catecoryList.clear();
      errorMsg = "";  // clear previous error message
    }

    isLoadingbtn = true;

    ApiResponse apiResponse = await bookRepo.allCategory(page: page, bookId: bookId);

    if (apiResponse.response != null && (apiResponse.response!.statusCode == 200)) {
      try {
        AllCategoriesResponse allCategoriesResponse = AllCategoriesResponse.fromJson(apiResponse.response!.data);
        if (allCategoriesResponse.data != null) {
          _catecoryList.addAll(allCategoriesResponse.data!.categories ?? []);
          currentPage = allCategoriesResponse.data!.currentPage ?? page;
          lastPage = allCategoriesResponse.data!.lastPage ?? page;

          showCustomSnackBar(allCategoriesResponse.message ?? "Success", isError: false, isPosition: true);
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
      await allCategory(page: currentPage + 1, bookId: _currentBookId!);
    }
  }
//get contact person
  List<ContactPerson> _contactPerList = [];
  List<ContactPerson> get contactPerList => _contactPerList;
  Future<void> allContactPerson({int page = 1,required int bookId}) async {
    if (page == 1) {
      _contactPerList.clear();
      errorMsg = "";  // clear previous error message
    }

    isLoadingbtn = true;

    ApiResponse apiResponse = await bookRepo.allContactPerson(page: page, bookId: bookId);

    if (apiResponse.response != null && (apiResponse.response!.statusCode == 200)) {
      try {
        ContactPersonResponse contactPersonResponse = ContactPersonResponse.fromJson(apiResponse.response!.data);
        if (contactPersonResponse.data != null) {
          _contactPerList.addAll(contactPersonResponse.data!.data ?? []);
          contactCurrentPage = contactPersonResponse.data!.currentPage ?? page;
          contactLastPage = contactPersonResponse.data!.lastPage ?? page;

          showCustomSnackBar(contactPersonResponse.message ?? "Success", isError: false, isPosition: true);
        }
      } catch (e) {
        showCustomSnackBar(apiResponse.error.toString(), isError: true);
      }
    } else {
      errorMsg = apiResponse.error ?? "Unknown error occurred";
      showCustomSnackBar(errorMsg, isError: true);
    }

    isLoadingbtn = false;
    update();
  }

  Future<void> loadContactNextPage() async {
    if (contactCurrentPage < contactLastPage && !isLoadingbtn) {
      await allContactPerson(page: contactCurrentPage + 1, bookId: _currentBookId!);
    }
  }

  //for create book category
  Future<void> createBookCategory({
    required String name,
    required int bookId,
  }) async {
    isLoading = true;
    update();

    ApiResponse apiResponse = await bookRepo.createBookCategory(
      name: name,
      bookId: bookId,
    );

    if ((apiResponse.response?.statusCode ?? -1) == 200 ||
        (apiResponse.response?.statusCode ?? -1) == 201) {
      BookCategoryResponse categoryResponse =
      BookCategoryResponse.fromJson(apiResponse.response?.data);
      String msg = categoryResponse.message ?? "";
      showCustomSnackBar(msg, isError: false, isPosition: true);
      await allCategory(bookId: bookId);//new added
     // g.Get.to(AddCashInEntryScreen(bookId: bookId));

    } else {
      errorMsg = apiResponse.error.toString();
      showCustomSnackBar(errorMsg, isError: true);
    }

    isLoading = false;
    update();
  }

  //delete category
  Future<void> deleteCategory(int bookId, int categoryId) async {
    isLoading = true;
    update();

    ApiResponse apiResponse = await bookRepo.deleteCategory(bookId, categoryId);
    if ((apiResponse.response?.statusCode ?? -1) == 200) {
      DeleteCategoryResponse deleteCategoryResponse =
      DeleteCategoryResponse.fromJson(apiResponse.response?.data);

      String msg = deleteCategoryResponse.message ?? "";
      showCustomSnackBar(msg, isError: false, isPosition: true);


      await allCategory(bookId: bookId);

    } else {
      errorMsg = apiResponse.error.toString();
      showCustomSnackBar(errorMsg, isError: true);
    }

    isLoading = false;
    update();
  }


  /* Future<void> deleteCategory( int bookId,int categoryId)async{
    isLoading = true;
    update();

    ApiResponse apiResponse = await bookRepo.deleteCategory(bookId,categoryId);
    if ((apiResponse.response?.statusCode??-1) == 200) {

      DeleteCategoryResponse deleteCategoryResponse = DeleteCategoryResponse.fromJson(apiResponse.response?.data);
      categoryList.removeWhere((category) => category.id == categoryId);

      update();
      String msg = deleteCategoryResponse.message?? "";
      showCustomSnackBar('$msg',isError: false,isPosition: true);

    }else{
      // showCustomSnackBar(.error.toString(),);
      _isLoading = false;
      update();
    }
    isLoading = false;
    update();
  }*/
  //Update category
  Future<void> updateCategory({
    required int bookId,
    required int categoryId,
    required String name,
    required int status,
  }) async {
    isLoading = true;
    update();

    ApiResponse apiResponse = await bookRepo.updateCategory(
        bookId: bookId,
        categoryId: categoryId,
        name: name,
        status: status
    );

    if ((apiResponse.response?.statusCode ?? -1) == 200) {
      UpdateCategoryResponse updateCategoryResponse =
      UpdateCategoryResponse.fromJson(apiResponse.response?.data);

      String msg = updateCategoryResponse.message ?? "";
      showCustomSnackBar(msg, isError: false, isPosition: true);
      await allCategory(bookId: bookId);//new added

    } else {
      isLoading = false;
      update();
    }

    isLoading = false;
    update();
  }

  //for create contact Person
  Future<void> createContactPerson({
    required String name,
    required int bookId,
    required String number,
  }) async {
    isLoading = true;
    update();

    ApiResponse apiResponse = await bookRepo.createContactPerson(
      name: name,
      bookId: bookId, number: number,
    );

    if ((apiResponse.response?.statusCode ?? -1) == 200 ||
        (apiResponse.response?.statusCode ?? -1) == 201) {
      CreateContactPersonResponse createContactPersonResponse =
      CreateContactPersonResponse.fromJson(apiResponse.response?.data);
      String msg = createContactPersonResponse.message ?? "";
      showCustomSnackBar(msg, isError: false, isPosition: true);
      await allContactPerson(bookId: bookId);//new added
      // g.Get.to(AddCashInEntryScreen(bookId: bookId));

    } else {
      errorMsg = apiResponse.error.toString();
      showCustomSnackBar(errorMsg, isError: true);
    }

    isLoading = false;
    update();
  }

  //Update contact person
  Future<void> updateContactPerson({
    required int bookId,
    required int categoryId,
    required String name,
    required String phone,
  }) async {
    isLoading = true;
    update();

    ApiResponse apiResponse = await bookRepo.updateContactPerson(
        bookId: bookId,
        categoryId: categoryId,
        name: name, phone: phone,

    );

    if ((apiResponse.response?.statusCode ?? -1) == 200) {
      UpdateContactPersonResponse updateContactPersonResponse =
      UpdateContactPersonResponse.fromJson(apiResponse.response?.data);

      String msg = updateContactPersonResponse.message ?? "";
      showCustomSnackBar(msg, isError: false, isPosition: true);
      await allContactPerson(bookId: bookId);//new added

    } else {
      isLoading = false;
      update();
    }

    isLoading = false;
    update();
  }

  //delete contact person
  Future<void> deleteContactPerson(int bookId, int contactPerId) async {
    isLoading = true;
    update();

    ApiResponse apiResponse = await bookRepo.deleteContactPerson(bookId, contactPerId);
    if ((apiResponse.response?.statusCode ?? -1) == 200) {
      DeleteContactPersonResponse deleteContactPersonResponse =
      DeleteContactPersonResponse.fromJson(apiResponse.response?.data);

      String msg = deleteContactPersonResponse.message ?? "";
      showCustomSnackBar(msg, isError: false, isPosition: true);


      await allContactPerson(bookId: bookId);

    } else {
      errorMsg = apiResponse.error.toString();
      showCustomSnackBar(errorMsg, isError: true);
    }

    isLoading = false;
    update();
  }

  //get payment method
  List<PaymentMethod> _paymentMethodList = [];
  List<PaymentMethod> get paymentMethodList => _paymentMethodList;
  late int _currentBusinessId;
  Future<void> allPaymentMethod({int page = 1,required int businessId}) async {
    _currentBusinessId = businessId;
    if (page == 1) {
      _paymentMethodList.clear();
      errorMsg = "";  // clear previous error message
    }

    isLoadingbtn = true;

    ApiResponse apiResponse = await bookRepo.allPaymentMethod(page: page, businessId: businessId);

    if (apiResponse.response != null && (apiResponse.response!.statusCode == 200)) {
      try {
        AllPaymentMethodResponse allPaymentMethodResponse = AllPaymentMethodResponse.fromJson(apiResponse.response!.data);
        if (allPaymentMethodResponse.data != null) {
          _paymentMethodList.addAll(allPaymentMethodResponse.data!.data?? []);
          contactCurrentPage = allPaymentMethodResponse.data!.currentPage ?? page;
          contactLastPage = allPaymentMethodResponse.data!.lastPage ?? page;

          showCustomSnackBar(allPaymentMethodResponse.message ?? "Success", isError: false, isPosition: true);
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

  Future<void> loadPaymentNextPage() async {
    if (paymentCurrentPage < paymentLastPage && !isLoadingbtn) {
      await allPaymentMethod(page: paymentCurrentPage + 1, businessId: _currentBusinessId, );
    }
  }

  //for create payment method
  Future<void> createPaymentMethod({
    required String name,
    required int businessId,
  }) async {
    isLoading = true;
    update();

    ApiResponse apiResponse = await bookRepo.createPaymentMethod(
      name: name, businessId: businessId,

    );

    if ((apiResponse.response?.statusCode ?? -1) == 200 ||
        (apiResponse.response?.statusCode ?? -1) == 201) {
      CreatePaymentMethodResponse createPaymentMethodResponse =
      CreatePaymentMethodResponse.fromJson(apiResponse.response?.data);
      String msg = createPaymentMethodResponse.message ?? "";
      showCustomSnackBar(msg, isError: false, isPosition: true);
      await allPaymentMethod(businessId: businessId);//new added

    } else {
      errorMsg = apiResponse.error.toString();
      showCustomSnackBar(errorMsg, isError: true);
    }

    isLoading = false;
    update();
  }

  //Update payment method
  Future<void> updatePaymentMethod({
    required int businessId,
    required int paymentMethodId,
    required String name,
  }) async {
    isLoading = true;
    update();

    ApiResponse apiResponse = await bookRepo.updatePaymentMethod(
        businessId: businessId,
        paymentMethodId: paymentMethodId, name: name);

    if ((apiResponse.response?.statusCode ?? -1) == 200) {
      UpdatePaymentMethodResponse updatePaymentMethodResponse =
      UpdatePaymentMethodResponse.fromJson(apiResponse.response?.data);

      String msg = updatePaymentMethodResponse.message ?? "";
      showCustomSnackBar(msg, isError: false, isPosition: true);
      await allPaymentMethod(businessId: businessId);//new added

    } else {
      isLoading = false;
      update();
    }

    isLoading = false;
    update();
  }

  //delete payment method
  Future<void> deletePaymentMethod(int businessId, int paymentId) async {
    isLoading = true;
    update();

    ApiResponse apiResponse = await bookRepo.deletePaymentMethod(businessId,paymentId);
    if ((apiResponse.response?.statusCode ?? -1) == 200) {
      DeletePaymentMethodResponse deletePaymentMethodResponse =
      DeletePaymentMethodResponse.fromJson(apiResponse.response?.data);

      String msg = deletePaymentMethodResponse.message ?? "";
      showCustomSnackBar(msg, isError: false, isPosition: true);


      await allPaymentMethod(businessId: businessId);

    } else {
      errorMsg = apiResponse.error.toString();
      showCustomSnackBar(errorMsg, isError: true);
    }

    isLoading = false;
    update();
  }
  //create cash in
  Future<void> createCashInAndOut({
    required String date,
    required int bookId,
    required String time,
    required int type,
    required int amount,
     int ?contactId,
     int ?categoryId,
     required int paymentModeId,
    required String remarks,
  }) async {
    isLoading = true;
    update();

    ApiResponse apiResponse = await bookRepo.createCashInAndOut(
        date: date,
        time: time,
        type: type,
        amount: amount,
        contactId: contactId,
        categoryId: categoryId,
        paymentModeId: paymentModeId,
        remarks: remarks,
        bookId: bookId
    );
    if ((apiResponse.response?.statusCode ?? -1) == 200 ||
        (apiResponse.response?.statusCode ?? -1) == 201) {
      CashInResponse cashInResponse =
      CashInResponse.fromJson(apiResponse.response?.data);
      String msg = cashInResponse.message ?? "";
      showCustomSnackBar(msg, isError: false, isPosition: true);
      await specificBookDetails(businessId: _currentBusinessId, bookId: bookId);
      Get.back();
    } else {
      errorMsg = apiResponse.error.toString();
      showCustomSnackBar(errorMsg, isError: true);
    }

    isLoading = false;
    update();
  }

  //get transaction history
  List<TransactionItem> _transactionList = [];
  List<TransactionItem> get transactionList => _transactionList;
   int? _currentBooksId;
  // BookController এর মধ্যে এই method টা replace করুন:

  Future<void> loadHistoryNextPage() async {
    if (historyCurrentPage < historyLastPage && !isLoadingbtn) {
      await transactionHistory(page: historyCurrentPage + 1, bookId: _currentBooksId!);
    }
  }

// এবং transactionHistory method এ pagination variables গুলো সঠিকভাবে update করুন:

  Future<void> transactionHistory({int page = 1, required int bookId}) async {
    _currentBooksId = bookId;
    if (page == 1) {
      _transactionList.clear();
      errorMsg = "";  // clear previous error message
    }

    isLoadingbtn = true;

    ApiResponse apiResponse = await bookRepo.transactionHistory(page: page, bookId: bookId);

    if (apiResponse.response != null && (apiResponse.response!.statusCode == 200)) {
      try {
        TransactionHistoryResponse transactionHistoryResponse = TransactionHistoryResponse.fromJson(apiResponse.response!.data);
        if (transactionHistoryResponse.data != null) {
          _transactionList.addAll(transactionHistoryResponse.data!.transactions ?? []);

          // এখানে historyCurrentPage এবং historyLastPage use করুন
          historyCurrentPage = transactionHistoryResponse.data!.currentPage ?? page;
          historyLastPage = transactionHistoryResponse.data!.lastPage ?? page;

          // শুধুমাত্র first page load এর সময় success message দেখান
          if (page == 1) {
            showCustomSnackBar(transactionHistoryResponse.message ?? "Success", isError: false, isPosition: true);
          }
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

  //specific transaction details


  // এখানে API response store হবে
  SpecificTransactionDetailsResponse? transactionDetails;

  Future<void> specificTransaction({required int selectedId, required int bookId}) async {
  isLoadingbtn = true;
  update();

  ApiResponse apiResponse = await bookRepo.specificTransaction(
  selectedId: selectedId,
  bookId: bookId,
  );

  if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
  try {
  transactionDetails = SpecificTransactionDetailsResponse.fromJson(apiResponse.response!.data);
  showCustomSnackBar(transactionDetails?.message ?? "Success", isError: false, isPosition: true);
  } catch (e) {
  showCustomSnackBar(apiResponse.error.toString(), isError: true);
  }
  } else {
  errorMsg = apiResponse.error ?? "Unknown error occurred";
  showCustomSnackBar(errorMsg!, isError: true);
  }

  isLoadingbtn = false;
  update(); // UI refresh
  }




  static Future<void> showConfirmationDialog({
    String? initialValue,
    String? initialValue2,
    String title = '',
    String cancelText = 'Cancel',
    String confirmText = 'Delete',
    Color cancelColor = Colors.green,
    Color confirmColor = Colors.red,
    bool showTextField = false,
    bool showSecondTextField = false,
    String textFieldHint = '',
    String textFieldHint2 = '',
    String? Function(String?)? validator,
    String? Function(String?)? validator2,
    required void Function()? onCancel,
    required void Function(String? text1, String? text2)? onConfirm,
  }) {
    final controller1 = TextEditingController(text: initialValue);
    final controller2 = TextEditingController(text: initialValue2);
    final formKey = GlobalKey<FormState>();

    return Get.dialog(
      StatefulBuilder(
        builder: (context, setState) {
          final bottomInset = MediaQuery.of(context).viewInsets.bottom;
          return Padding(
            padding: EdgeInsets.only(bottom: bottomInset, left: 24, right: 24, top: 24),
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(title, style: AppTextStyles.bodyMedium(color: Colors.black87), textAlign: TextAlign.center),
                        const SizedBox(height: 12),

                        if (showTextField)
                          TextFormField(
                            controller: controller1,
                            decoration: InputDecoration(hintText: textFieldHint, border: const OutlineInputBorder()),
                            validator: validator ?? (val) => (val?.trim().isEmpty ?? true) ? 'This field cannot be empty' : null,
                          ),
                        if (showTextField) const SizedBox(height: 12),

                        if (showSecondTextField)
                          TextFormField(
                            controller: controller2,
                            decoration: InputDecoration(hintText: textFieldHint2, border: const OutlineInputBorder()),
                            validator: validator2 ?? (val) => (val?.trim().isEmpty ?? true) ? 'This field cannot be empty' : null,
                          ),
                        if (showSecondTextField) const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: onCancel, child: Text(cancelText, style: TextStyle(color: cancelColor, fontWeight: FontWeight.bold))),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  onConfirm?.call(
                                    showTextField ? controller1.text : null,
                                    showSecondTextField ? controller2.text : null,
                                  );
                                }
                              },
                              child: Text(confirmText, style: TextStyle(color: confirmColor, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      barrierDismissible: false,
    );
  }


}
