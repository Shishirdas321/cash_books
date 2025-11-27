/*
import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/book/controllers/book_controller.dart';
import 'package:cash_books/features/book/model/AllCategoriesResponse.dart';
import 'package:cash_books/features/book/model/AllContactPerson.dart';
import 'package:cash_books/features/book/model/AllPaymentMethodResponse.dart';
import 'package:cash_books/features/book/ui/screens/business_book_screen.dart';
import 'package:cash_books/features/book/ui/widgets/coustom_dropdown.dart';
import 'package:cash_books/features/home/model/BookResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TransactionDetails extends StatefulWidget {
  final int selectedId;
  final int bookId;
  final Book book;

  const TransactionDetails({super.key, required this.selectedId, required this.bookId, required this.book, });

  static const String name = '/transaction-details';

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController transactionTypeController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController paymentMethodController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  String? selectedContactName;
  String? selectedCategoryName;
  String? selectedPaymentName;
  ContactPerson? selectedContact;
  Category? selectedCategory;
  PaymentMethod? selectedPayment;

  @override
  void initState() {
    super.initState();

    // API call
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<BookController>().specificTransaction(
        selectedId: widget.selectedId,
        bookId: widget.bookId,
      );
      Get.find<BookController>().allCategory(bookId: widget.bookId);
      Get.find<BookController>().allContactPerson(bookId: widget.bookId);
      Get.find<BookController>().allPaymentMethod(businessId: widget.book.businessId!);
    });
  }




  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookController>();
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child:
     Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        leading: const BackButton(color: Colors.white),
        title: Text(
          'Transaction Details',
          style: AppTextStyles.appbar(),
        ),
      ),
      body: GetBuilder<BookController>(
        builder: (context) {
          if (controller.transactionDetails?.data != null) {
            final data = controller.transactionDetails!.data!;
            // ধরো data.optDate = '2025-09-04'
            if (data.optDate != null && data.optDate!.isNotEmpty) {
              DateTime parsedDate = DateTime.parse(data.optDate!);
              String formattedDate = '${parsedDate.day.toString().padLeft(2, '0')}/'
                  '${parsedDate.month.toString().padLeft(2, '0')}/'
                  '${parsedDate.year}';
              dateController.text = formattedDate; // 04/09/2025
            } else {
              dateController.text = '';
            }

// Time formatting
            if (data.optTime != null && data.optTime!.isNotEmpty) {
              List<String> parts = data.optTime!.split(':'); // ['14','30','00']
              int hour = int.parse(parts[0]);
              int minute = int.parse(parts[1]);
              String period = hour >= 12 ? 'PM' : 'AM';
              int hour12 = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
              String formattedTime = '${hour12.toString().padLeft(2,'0')}:'
                  '${minute.toString().padLeft(2,'0')} $period';
              timeController.text = formattedTime; // 02:30 PM
            } else {
              timeController.text = '';
            }
            amountController.text = data.amount?.toString() ?? '';
            transactionTypeController.text =
            (data.type == 1) ? 'Cash In' : (data.type == 2) ? 'Cash Out' : '';
           // categoryController.text = (data.category?.name.toString() ?? '');
           // paymentMethodController.text = (data.paymentMode?.name.toString() ?? '');
            noteController.text = data.remarks ?? '';
            selectedContactName = data.contact?.name;
            selectedCategoryName = data.category?.name;
            selectedPaymentName = data.paymentMode?.name;
          }


          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Text(' Update & Delete your transaction.',
                        style: AppTextStyles.bodyMedium(
                            color: Colors.black87, fontSize: 18.sp),),
                      SizedBox(height: 20.h),
                      // Transaction Information Card
                      Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Transaction Information',
                                  style: AppTextStyles.bodyMedium(
                                      color: Colors.black87, fontSize: 16.sp)
                              ),
                              const SizedBox(height: 20),

                              // Row 1: Date and Time
                              Row(
                                children: [
                                  Expanded(
                                    child: _buildTextFormField(
                                      label: 'Date',
                                      controller: dateController,
                                      readOnly: true,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: _buildTextFormField(
                                      label: 'Time',
                                      controller: timeController,
                                      readOnly: true,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),

                              // Row 2: Amount and Transaction Type
                              Row(
                                children: [
                                  Expanded(
                                    child: _buildTextFormField(
                                      label: 'Amount',
                                      controller: amountController,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: _buildTextFormField(
                                      label: 'Transaction Type',
                                      controller: transactionTypeController,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),

                              // Row 3: Category and Payment Method
                              GetBuilder<BookController>(
                                builder: (controller) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: PopupSearchableDropdownField(
                                                    controller: categoryController,
                                                    label: 'Category',
                                                    items: controller.categoryList.map((e) =>e.name!).toList(),
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedCategory = controller.categoryList.firstWhere((e) => e.name == val);
                                                      });
                                                    },
                                                  value:  selectedCategoryName,
                                                )
                                             ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                              child:PopupSearchableDropdownField(
                                                      controller: paymentMethodController,
                                                      label: 'Payment method',
                                                      items: controller.paymentMethodList.map((e) =>e.name!).toList(),
                                                      onChanged: (val) {
                                                        setState(() {
                                                          selectedPayment = controller.paymentMethodList.firstWhere((e) => e.name == val);
                                                        });
                                                      },
                                                      value: selectedPaymentName,
                                                    )
                                             ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          Expanded(
                                              child:  PopupSearchableDropdownField(
                                                      label: 'Contact Name',
                                                      items: controller.contactPerList.map((e) =>e.name!).toList(),
                                                      //subItems: controller.contactPerList.map((e)=>e.mobileNo!).toList(),
                                                      onChanged: (val) {
                                                        setState(() {
                                                          selectedContact = controller.contactPerList.firstWhere((e) => e.name == val);
                                                        });
                                                      },
                                                      value: selectedContactName,
                                                      subItems: Map.fromEntries(
                                                          controller.contactPerList
                                                              .where((e) => e.mobileNo != null)
                                                              .map((e) => MapEntry(e.name!, [e.mobileNo!]))
                                                      ),
                                                    )
                                              ),
                                        ],
                                      ),
                                    ],
                                  );
                                }
                              ),
                              const SizedBox(height: 16),
                              // Row 4: Note/Remark (Full Width)
                              _buildTextFormField(
                                label: 'Note/Remark',
                                controller: noteController,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Extra space for bottom buttons
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              // Fixed Bottom Buttons
              _showUpdateAndDelete(),
            ],
          );
        }
      ),
    )
    );
  }

  Widget _showUpdateAndDelete() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Delete transaction',
                  style: AppTextStyles.bodyMediumWhite(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Update transaction',
                  style: AppTextStyles.bodyMediumWhite(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _showDeleteConfirmation();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    icon: Icon(Icons.delete_outline, size: 18.w),
                    label: Text(
                      'Delete',
                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    icon: Icon(Icons.update, size: 18.w),
                    label: Text(
                      'Update',
                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    required TextEditingController controller,
    bool readOnly = false,
    int maxLines = 1,
    String? prefixText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.subtitleSmall(color: Colors.grey)
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            prefixText: prefixText,
            prefixStyle: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.black54, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange, size: 24),
              const SizedBox(width: 8),
              const Text('Confirm Delete'),
            ],
          ),
          content: const Text(
            'Are you sure you want to delete this transaction? This action cannot be undone.',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Get.find<BookController>().deleteTransactionDetails(widget.bookId,widget.selectedId);
                //Get.off(() => BusinessBookScreen(book: widget.book));
                // Dialog এর onPressed এ:
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => BusinessBookScreen(book: widget.book),
                  ),
                      (route) => route.isFirst,
                );
                // Delete transaction logic here
                //_deleteTransaction();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _deleteTransaction() {
    // Show success message and navigate back
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Transaction deleted successfully'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
    Navigator.of(context).pop(); // Go back to previous screen
  }

  @override
  void dispose() {
    dateController.dispose();
    timeController.dispose();
    amountController.dispose();
    transactionTypeController.dispose();
    categoryController.dispose();
    paymentMethodController.dispose();
    noteController.dispose();
    super.dispose();
  }
}*/


import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/core/widgets/custom_snackbar.dart';
import 'package:cash_books/features/book/controllers/book_controller.dart';
import 'package:cash_books/features/book/model/AllCategoriesResponse.dart';
import 'package:cash_books/features/book/model/AllContactPerson.dart';
import 'package:cash_books/features/book/model/AllPaymentMethodResponse.dart';
import 'package:cash_books/features/book/repository/book_repo.dart';
import 'package:cash_books/features/book/ui/screens/business_book_screen.dart';
import 'package:cash_books/features/book/ui/widgets/coustom_dropdown.dart';
import 'package:cash_books/features/home/model/BookResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TransactionDetails extends StatefulWidget {
  final int selectedId;
  final int bookId;
  final Book book;

  const TransactionDetails({
    super.key,
    required this.selectedId,
    required this.bookId,
    required this.book,
  });

  static const String name = '/transaction-details';

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController transactionTypeController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController paymentMethodController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  String? selectedContactName;
  String? selectedCategoryName;
  String? selectedPaymentName;
  String? selectedTransactionType; // Added for transaction type
  int? selectedTransactionTypeValue; //  Store the type value (1 or 2)
  ContactPerson? selectedContact;
  Category? selectedCategory;
  PaymentMethod? selectedPayment;

  //  Track korar jonoh current transaction ID
  int? _loadedTransactionId;

  @override
  void initState() {
    super.initState();

    //  Local state clear
    _clearLocalData();

    // API call
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = Get.find<BookController>();

      //  Controller data clear korun BEFORE new API call
      controller.transactionDetails = null;

      controller.specificTransaction(
        selectedId: widget.selectedId,
        bookId: widget.bookId,
      );
      controller.allCategory(bookId: widget.bookId);
      controller.allContactPerson(bookId: widget.bookId);
      controller.allPaymentMethod(businessId: widget.book.businessId!);
    });
  }

  //  sudu local state clear korar method
  void _clearLocalData() {
    dateController.clear();
    timeController.clear();
    amountController.clear();
    transactionTypeController.clear();
    categoryController.clear();
    paymentMethodController.clear();
    noteController.clear();

    selectedContactName = null;
    selectedCategoryName = null;
    selectedPaymentName = null;
    selectedTransactionType = null; //  Added
    selectedTransactionTypeValue = null; //  Added
    selectedContact = null;
    selectedCategory = null;
    selectedPayment = null;

    _loadedTransactionId = null;
  }

  //   ID dia match koro,
  void _loadTransactionData(BookController controller) {
    // jodi data na thake ba already ei transaction er data load hoi  gece
    if (controller.transactionDetails?.data == null) {
      return;
    }

    // jodi ei transaction load kora hoi gece tahole, skip korbe
    if (_loadedTransactionId == widget.selectedId) {
      return;
    }

    final data = controller.transactionDetails!.data!;

    print(" Loading transaction ID: ${widget.selectedId}");
    print(" Data: contact_id=${data.contactId}, category_id=${data.categoryId}, payment_id=${data.paymentModeId}");

    // Date formatting
    if (data.optDate != null && data.optDate!.isNotEmpty) {
      DateTime parsedDate = DateTime.parse(data.optDate!);
      String formattedDate = '${parsedDate.day.toString().padLeft(2, '0')}/'
          '${parsedDate.month.toString().padLeft(2, '0')}/'
          '${parsedDate.year}';
      dateController.text = formattedDate;
    }

    // Time formatting
    if (data.optTime != null && data.optTime!.isNotEmpty) {
      List<String> parts = data.optTime!.split(':');
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);
      String period = hour >= 12 ? 'PM' : 'AM';
      int hour12 = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
      String formattedTime = '${hour12.toString().padLeft(2, '0')}:'
          '${minute.toString().padLeft(2, '0')} $period';
      timeController.text = formattedTime;
    }

    amountController.text = data.amount?.toString() ?? '';

    //  Transaction Type dropdown values
    selectedTransactionTypeValue = data.type;
    selectedTransactionType = (data.type == 1) ? 'Cash In' : (data.type == 2) ? 'Cash Out' : null;

    noteController.text = data.remarks ?? '';

    //   ID diah match korbe

    // Contact matching by ID
    if (data.contactId != null && controller.contactPerList.isNotEmpty) {
      selectedContact = controller.contactPerList.firstWhereOrNull(
              (e) => e.id == data.contactId
      );
      selectedContactName = selectedContact?.name;
      print(" Contact matched: ID=${data.contactId}, Name=$selectedContactName");
    } else {
      selectedContact = null;
      selectedContactName = null;
      print(" Contact not matched: contactId=${data.contactId}, list size=${controller.contactPerList.length}");
    }

    // Category matching by ID
    if (data.categoryId != null && controller.categoryList.isNotEmpty) {
      selectedCategory = controller.categoryList.firstWhereOrNull(
              (e) => e.id == data.categoryId
      );
      selectedCategoryName = selectedCategory?.name;
      print(" Category matched: ID=${data.categoryId}, Name=$selectedCategoryName");
    } else {
      selectedCategory = null;
      selectedCategoryName = null;
      print(" Category not matched: categoryId=${data.categoryId}, list size=${controller.categoryList.length}");
    }

    // Payment Method matching by ID
    if (data.paymentModeId != null && controller.paymentMethodList.isNotEmpty) {
      selectedPayment = controller.paymentMethodList.firstWhereOrNull(
              (e) => e.id == data.paymentModeId
      );
      selectedPaymentName = selectedPayment?.name;
      print(" Payment matched: ID=${data.paymentModeId}, Name=$selectedPaymentName");
    } else {
      selectedPayment = null;
      selectedPaymentName = null;
      print("Payment not matched: paymentModeId=${data.paymentModeId}, list size=${controller.paymentMethodList.length}");
    }

    //  Mark korbe je ei transaction er data load hoei gece
    _loadedTransactionId = widget.selectedId;

    print(" Final values: Contact=$selectedContactName, Category=$selectedCategoryName, Payment=$selectedPaymentName");

    //  Schedule UI update AFTER build completes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookController>();

    return WillPopScope(
      onWillPop: () async {
        //  Back করার সময় controller এর data clear করুন
        controller.transactionDetails = null;
        _clearLocalData();
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.themeColor,
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              //  Back button এ controller data clear
              controller.transactionDetails = null;
              _clearLocalData();
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Transaction Details',
            style: AppTextStyles.appbar(),
          ),
        ),
        body: GetBuilder<BookController>(
          builder: (controller) {
            // Data load করুন
            _loadTransactionData(controller);

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        Text(
                          ' Update & Delete your transaction.',
                          style: AppTextStyles.bodyMedium(
                              color: Colors.black87, fontSize: 18.sp),
                        ),
                        SizedBox(height: 20.h),
                        // Transaction Information Card
                        Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Transaction Information',
                                    style: AppTextStyles.bodyMedium(
                                        color: Colors.black87, fontSize: 16.sp)),
                                const SizedBox(height: 20),

                                // Row 1: Date and Time
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildTextFormField(
                                        label: 'Date',
                                        controller: dateController,
                                        readOnly: true,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: _buildTextFormField(
                                        label: 'Time',
                                        controller: timeController,
                                        readOnly: true,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),

                                // Row 2: Amount and Transaction Type
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildTextFormField(
                                        label: 'Amount',
                                        controller: amountController,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Text(
                                          //   'Transaction Type',
                                          //   style: AppTextStyles.subtitleSmall(color: Colors.grey),
                                          // ),
                                         // const SizedBox(height: 6),
                                          PopupSearchableDropdownField(
                                            key: ValueKey('transaction_type_${selectedTransactionType}_${widget.selectedId}'),
                                            controller: transactionTypeController,
                                            label: 'Transaction Type',
                                            items: const ['Cash In', 'Cash Out'],
                                            onChanged: (val) {
                                              setState(() {
                                                selectedTransactionType = val;
                                                selectedTransactionTypeValue = val == 'Cash In' ? 1 : 2;
                                              });
                                            },
                                            value: selectedTransactionType,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),

                                // Row 3: Category and Payment Method
                                GetBuilder<BookController>(
                                    builder: (controller) {
                                      return Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: PopupSearchableDropdownField(
                                                    key: ValueKey('category_${selectedCategoryName}_${widget.selectedId}'),
                                                    controller: categoryController,
                                                    label: 'Category',
                                                    items: controller.categoryList
                                                        .map((e) => e.name!)
                                                        .toList(),
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedCategory = controller
                                                            .categoryList
                                                            .firstWhere(
                                                                (e) => e.name == val);
                                                        selectedCategoryName = val;
                                                      });
                                                    },
                                                    value: selectedCategoryName,
                                                  )),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                  child: PopupSearchableDropdownField(
                                                    key: ValueKey('payment_${selectedPaymentName}_${widget.selectedId}'),
                                                    controller: paymentMethodController,
                                                    label: 'Payment method',
                                                    items: controller.paymentMethodList
                                                        .map((e) => e.name!)
                                                        .toList(),
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedPayment = controller
                                                            .paymentMethodList
                                                            .firstWhere(
                                                                (e) => e.name == val);
                                                        selectedPaymentName = val;
                                                      });
                                                    },
                                                    value: selectedPaymentName,
                                                  )),
                                            ],
                                          ),
                                          const SizedBox(height: 16),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: PopupSearchableDropdownField(
                                                    key: ValueKey('contact_${selectedContactName}_${widget.selectedId}'),
                                                    label: 'Contact Name',
                                                    items: controller.contactPerList
                                                        .map((e) => e.name!)
                                                        .toList(),
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedContact = controller
                                                            .contactPerList
                                                            .firstWhere(
                                                                (e) => e.name == val);
                                                        selectedContactName = val;
                                                      });
                                                    },
                                                    value: selectedContactName,
                                                    subItems: Map.fromEntries(controller
                                                        .contactPerList
                                                        .where((e) => e.mobileNo != null)
                                                        .map((e) => MapEntry(
                                                        e.name!, [e.mobileNo!]))),
                                                  )),
                                            ],
                                          ),
                                        ],
                                      );
                                    }),
                                const SizedBox(height: 16),
                                // Row 4: Note/Remark (Full Width)
                                _buildTextFormField(
                                  label: 'Note/Remark',
                                  controller: noteController,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Extra space for bottom buttons
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),

                // Fixed Bottom Buttons
                _showUpdateAndDelete(controller),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _showUpdateAndDelete(BookController controller) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Delete transaction',
                  style: AppTextStyles.bodyMediumWhite(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Update transaction',
                  style: AppTextStyles.bodyMediumWhite(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _showDeleteConfirmation();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    icon: Icon(Icons.delete_outline, size: 18.w),
                    label: Text(
                      'Delete',
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      // Validation
                      if (amountController.text.trim().isEmpty) {
                        showCustomSnackBar(
                          "Please enter amount",
                          isError: true,
                          isPosition: false,
                        );
                        return;
                      }

                      if (selectedPayment == null) {
                        showCustomSnackBar(
                          "Please select a payment method",
                          isError: true,
                          isPosition: false,
                        );
                        return;
                      }

                      // Amount parse
                      String cleanedAmount = amountController.text.replaceAll(',', '');
                      double amount = double.tryParse(cleanedAmount.trim()) ?? 0;

                      if (amount <= 0) {
                        showCustomSnackBar(
                          "Please enter a valid amount",
                          isError: true,
                          isPosition: false,
                        );
                        return;
                      }

                      // Get transaction type from transactionDetails
                      final transactionType = controller.transactionDetails?.data?.type ?? 1;

                      // Get date and time from transactionDetails
                      final optDate = controller.transactionDetails?.data?.optDate ?? '';
                      final optTime = controller.transactionDetails?.data?.optTime ?? '';


                      // Update API call
                      await controller.updateTransaction(
                        bookId: widget.bookId,
                        selectedId: widget.selectedId,
                        amount: amount.toInt(),
                        remarks: noteController.text.trim(),
                        date: optDate,
                        time: optTime,
                        type: transactionType,
                        contactId: selectedContact?.id,
                        categoryId: selectedCategory?.id,
                        paymentModeId: selectedPayment!.id!,
                      );

// Clean up and navigate back
                      controller.transactionDetails = null;
                      controller.update();
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    icon: Icon(Icons.update, size: 18.w),
                    label: Text(
                      'Update',
                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    required TextEditingController controller,
    bool readOnly = false,
    int maxLines = 1,
    String? prefixText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.subtitleSmall(color: Colors.grey)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          readOnly: readOnly,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            prefixText: prefixText,
            prefixStyle: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.black54, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange, size: 24),
              const SizedBox(width: 8),
              const Text('Confirm Delete'),
            ],
          ),
          content: const Text(
            'Are you sure you want to delete this transaction? This action cannot be undone.',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();

                final controller = Get.find<BookController>();
                controller.deleteTransactionDetails(widget.bookId, widget.selectedId);

                //  Delete er pore controller data clear
                controller.transactionDetails = null;

                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => BusinessBookScreen(book: widget.book),
                  ),
                      (route) => route.isFirst,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    dateController.dispose();
    timeController.dispose();
    amountController.dispose();
    transactionTypeController.dispose();
    categoryController.dispose();
    paymentMethodController.dispose();
    noteController.dispose();
    super.dispose();
  }
}
