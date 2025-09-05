import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/book/controllers/book_controller.dart';
import 'package:cash_books/features/book/model/AllCategoriesResponse.dart';
import 'package:cash_books/features/book/model/AllContactPerson.dart';
import 'package:cash_books/features/book/model/AllPaymentMethodResponse.dart';
import 'package:cash_books/features/book/ui/widgets/coustom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TransactionDetails extends StatefulWidget {
  final int selectedId;
  final int bookId;
  const TransactionDetails({super.key, required this.selectedId, required this.bookId});

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

  String? contact;
  String? category;
  String? payment;
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
     // Get.find<BookController>().allPaymentMethod(businessId: widget.book.businessId!);
    });
  }




  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookController>();
    return Scaffold(
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
            categoryController.text = (data.category?.name.toString() ?? '');
            paymentMethodController.text = (data.paymentMode?.name.toString() ?? '');
            noteController.text = data.remarks ?? '';
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
                              Row(
                                children: [
                                  Expanded(
                                    child: GetBuilder<BookController>(
                                      builder: (controller) {
                                        return PopupSearchableDropdownField(
                                            controller: categoryController,
                                            label: 'Category',
                                            items: controller.categoryList.map((e) =>e.name!).toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                selectedCategory = controller.categoryList.firstWhere((e) => e.name == val);
                                              });
                                            },
                                          value: category,
                                        );
                                      }
                                    )),
                                  const SizedBox(width: 12),
                                  Expanded(
                                      child: GetBuilder<BookController>(
                                          builder: (controller) {
                                            return PopupSearchableDropdownField(
                                              controller: paymentMethodController,
                                              label: 'Payment method',
                                              items: controller.paymentMethodList.map((e) =>e.name!).toList(),
                                              onChanged: (val) {
                                                setState(() {
                                                  selectedPayment = controller.paymentMethodList.firstWhere((e) => e.name == val);
                                                });
                                              },
                                              value: payment,
                                            );
                                          }
                                      )),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                      child: GetBuilder<BookController>(
                                          builder: (controller) {
                                            return PopupSearchableDropdownField(
                                              label: 'Contact Name',
                                              items: controller.contactPerList.map((e) =>e.name!).toList(),
                                              //subItems: controller.contactPerList.map((e)=>e.mobileNo!).toList(),
                                              onChanged: (val) {
                                                setState(() {
                                                  selectedContact = controller.contactPerList.firstWhere((e) => e.name == val);
                                                });
                                              },
                                              value: category,
                                              subItems: Map.fromEntries(
                                                  controller.contactPerList
                                                      .where((e) => e.mobileNo != null)
                                                      .map((e) => MapEntry(e.name!, [e.mobileNo!]))
                                              ),
                                            );
                                          }
                                      )),
                                ],
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
                // Delete transaction logic here
                _deleteTransaction();
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
}