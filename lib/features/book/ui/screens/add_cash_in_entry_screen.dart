
import 'dart:ui';

import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/book/controllers/book_controller.dart';
import 'package:cash_books/features/book/model/AllCategoriesResponse.dart';
import 'package:cash_books/features/book/model/AllContactPerson.dart';
//import 'package:cash_books/features/book/model/AllCategoriesResponse.dart';
//import 'package:cash_books/features/book/model/AllContactPerson.dart';
import 'package:cash_books/features/book/model/AllPaymentMethodResponse.dart';
import 'package:cash_books/features/book/ui/widgets/coustom_texfromfild.dart';
import 'package:cash_books/features/book/ui/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../home/model/BookResponse.dart';
import '../widgets/coustom_dropdown.dart';

class AddCashInEntryScreen extends StatefulWidget {
  final Book book;
  const AddCashInEntryScreen({super.key, required this.book});

  static const String name = '/add-cash-in';

  @override
  State<AddCashInEntryScreen> createState() => _AddCashInEntryScreenState();
}

class _AddCashInEntryScreenState extends State<AddCashInEntryScreen> {
  late int bookId;


  @override
  void initState() {
    super.initState();
      bookId = widget.book.id!;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<BookController>().allCategory(bookId: bookId);
      Get.find<BookController>().allContactPerson(bookId: bookId);
      Get.find<BookController>().allPaymentMethod(businessId: widget.book.businessId!);
    });
  }


  String? contact;
  String? category;
  String? payment;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //new
  String get date {
    return "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
  }

  String get time {
    final hour = selectedTime.hour.toString().padLeft(2, '0');
    final minute = selectedTime.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }
  //add...
  ContactPerson? selectedContact;
  Category? selectedCategory;
  PaymentMethod? selectedPayment;
//new add


  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.93),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: AppColors.themeColor,
        title: Text('Add Cash In Entry', style: AppTextStyles.appbar()),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView( //  Scroll fix
            padding:
            EdgeInsets.only(top: 30.h, bottom: 20.h, left: 16.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15.h),

                // Date & Time
                _buildDateAndTime(context),
                SizedBox(height: 30.h),

                // Amount Field
                TextFormField(textInputAction: TextInputAction.done,
                  controller: _amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
                    ThousandsFormatter(),
                  ],
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.money),
                    hintText: 'Enter amount',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your amount';
                    }
                    return null;
                  },
                ),

                /* TextFormField(
                  controller: _amountController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[\d.,]')),
                  ],
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.money),
                    hintText: 'Only number of amount',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your amount number';
                    }
                    return null;
                  },
                ),*/
                SizedBox(height: 16.h),

                // Contact & Category
                Row(
                  children: [
                    Expanded(
                      child: GetBuilder<BookController>(
                        builder: (controller) {
                          return PopupSearchableDropdownField(
                            label: "Contact Name",
                            actionIcon: IconButton(
                              onPressed: () {
                                showCustomBottomSheet(context: context,
                                    title: 'Contact Name',
                                    items: controller.contactPerList.map((e) =>e.name!).toList(),
                                    subtitles: controller.contactPerList.map((e)=>e.mobileNo!).toList(),
                                    onDelete: (selectedName){
                                      BookController.showConfirmationDialog(onCancel: (){Navigator.pop(context);},
                                          onConfirm: (_,__){final selectedContact = controller.contactPerList.firstWhere((e) =>e.name == selectedName);
                                        controller.deleteContactPerson(bookId, selectedContact.id);},
                                          title: 'Are you sure you want to delete this contact name ?',confirmText: 'Delete',
                                          confirmColor: Colors.red,cancelText: 'Cancel',cancelColor: Colors.green);
                                    },
                                    onEdit: (selectedName){
                                      final selectedContact = controller.contactPerList.firstWhere((e) => e.name == selectedName);
                                      BookController.showConfirmationDialog(showTextField: true,textFieldHint: 'Contact name',showSecondTextField: true,textFieldHint2: 'Contact number',
                                          initialValue: selectedContact.name,
                                          initialValue2: selectedContact.mobileNo,
                                          validator2: (String? val){
                                        if(val?.trim().isEmpty ?? true){
                                          return 'Enter your contact number';
                                        }
                                        return null;
                                          },
                                          validator: (String? value) {
                                            if (value?.trim().isEmpty ?? true) {
                                              return 'Enter your new contact name';
                                            }
                                            return null;
                                          },cancelText: 'Cancel',cancelColor: Colors.grey,confirmText: 'Update',confirmColor: Colors.green,title: 'Update your Contact name', onCancel: () { Navigator.pop(context); },
                                          onConfirm: (String? text,String? text1) { controller.updateContactPerson(bookId: bookId, categoryId: selectedContact.id, name: text!.trim(), phone: text1!.trim()); });
                                    },
                                    onAddNew: (){
                                      BookController.showConfirmationDialog(onCancel: (){Navigator.pop(context);}, onConfirm: (value,value1){
                                        controller.createContactPerson(name: value!.trim(), bookId: bookId, number: value1!.trim());
                                      },showTextField: true,textFieldHint: 'New contact name',cancelText: 'Cancel',showSecondTextField: true,
                                          textFieldHint2 : 'Contact number',
                                          validator2: (String? val){
                                            if(val?.trim().isEmpty ?? true){
                                              return 'Enter your contact number';
                                            }
                                            return null;
                                          },
                                          cancelColor: Colors.grey,confirmText: 'Add',title: 'Add your new contact name',confirmColor:Colors.green,validator: (String? value) {
                                            if (value?.trim().isEmpty ?? true) {
                                              return 'Enter your new contact name';
                                            }
                                            return null;
                                          });
                                    }
                                );
                              },
                              icon: Icon(Icons.settings,
                                  color: Colors.grey[700], size: 18),
                            ),
                            items: controller.contactPerList.map((e)=>e.name!).toList(),
                            subItems: Map.fromEntries(
                                controller.contactPerList
                                    .where((e) => e.mobileNo != null)
                                    .map((e) => MapEntry(e.name!, [e.mobileNo!]))
                            ),
                            value: contact,
                           // onChanged: (val) => setState(() => contact = val),
                              onChanged: (val) {
                                setState(() {
                                  selectedContact = controller.contactPerList.firstWhere((e) => e.name == val);
                                });
                              }

                          );
                        }
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: GetBuilder<BookController>(
                        builder: (controller) {
                          return PopupSearchableDropdownField(
                            label: "Category",textStyle: AppTextStyles.subtitleSmall(color: Colors.grey),
                            actionIcon: IconButton(
                              onPressed: () {
                                showCustomBottomSheet(context: context,
                                    title: 'Category',
                                    items: controller.categoryList.map((e) =>e.name!).toList(),
                                    onDelete: (selectedName){
                                      BookController.showConfirmationDialog(onCancel: (){Navigator.pop(context);},
                                          onConfirm: (_,__){ final selectedCategory = controller.categoryList.firstWhere((e) => e.name == selectedName);
                                      controller.deleteCategory(bookId, selectedCategory.id!);},
                                          title: 'Are you sure you want to delete this category ?',confirmText: 'Delete',
                                          confirmColor: Colors.red,cancelText: 'Cancel',cancelColor: Colors.green);
                                    },
                                    onEdit: (selectedName){
                                      final selectedCategory = controller.categoryList.firstWhere((e) => e.name == selectedName);
                                      BookController.showConfirmationDialog(showTextField: true,textFieldHint: 'Category',
                                          initialValue: selectedCategory.name,
                                          validator: (String? value) {
                                            if (value?.trim().isEmpty ?? true) {
                                              return 'Enter your new category';
                                            }
                                            return null;
                                          },cancelText: 'Cancel',cancelColor: Colors.grey,confirmText: 'Update',confirmColor: Colors.green,title: 'Update your category', onCancel: () { Navigator.pop(context); }, onConfirm: (String? text1,String? text2) {
                                        controller.updateCategory(bookId: bookId, categoryId: selectedCategory.id!, name: text1!.trim(), status: 1,);
                                          });
                                    },
                                    onAddNew: (){
                                      BookController.showConfirmationDialog(onCancel: (){Navigator.pop(context);}, onConfirm: (value,value2){
                                        controller.createBookCategory(name: value!.trim(), bookId: bookId,);
                                      },showTextField: true,textFieldHint: 'New category',cancelText: 'Cancel',
                                          cancelColor: Colors.grey,confirmText: 'Add',title: 'Add your new category',confirmColor:Colors.green,validator: (String? value) {
                                            if (value?.trim().isEmpty ?? true) {
                                              return 'Enter your new category';
                                            }
                                            return null;
                                          });
                                    }, subtitles: null
                                );
                              },
                              icon: Icon(Icons.settings,
                                  color: Colors.grey[700], size: 18),
                            ),
                            items: controller.categoryList.map((e) =>e.name!).toList(),
                            value: category,
                          //  onChanged: (val) => setState(() => category = val),
                              onChanged: (val) {
                                setState(() {
                                  selectedCategory = controller.categoryList.firstWhere((e) => e.name == val);
                                });
                              }

                          );
                        }
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),

                // Payment Method
                GetBuilder<BookController>(
                  builder: (controller) {
                    return PopupSearchableDropdownField(
                      label: "Payment method",textStyle: AppTextStyles.subtitleSmall(color: Colors.grey),
                      actionIcon: IconButton(
                        onPressed: () {
                          showCustomBottomSheet(context: context,
                              title: 'Payment method',
                              items: controller.paymentMethodList.map((e)=>e.name!).toList(),
                            onDelete: (selectedName){
                              BookController.showConfirmationDialog(onCancel: (){Navigator.pop(context);}, onConfirm: (_,__){
                                final selectedPaymentMethod = controller.paymentMethodList.firstWhere((e) => e.name == selectedName);
                                controller.deletePaymentMethod(widget.book.businessId!, selectedPaymentMethod.id!);
                              },
                                  title: 'Are you sure you want to delete this payment method ?',confirmText: 'Delete',
                                  confirmColor: Colors.red,cancelText: 'Cancel',cancelColor: Colors.green);
                            },
                            onEdit: (selectedName){
                              final selectedPayment = controller.paymentMethodList.firstWhere((e)=>e.name == selectedName);
                              BookController.showConfirmationDialog(showTextField: true,textFieldHint: 'Payment method'
                                  ,validator: (String? value) {
                                    if (value?.trim().isEmpty ?? true) {
                                      return 'Enter your new method';
                                    }
                                    return null;
                                  },cancelText: 'Cancel',initialValue:selectedPayment.name,cancelColor: Colors.grey,confirmText: 'Update',confirmColor: Colors.green,title: 'Update your Payment method', onCancel: () { Navigator.pop(context); },
                                  onConfirm: (String? text,_) {
                                  controller.updatePaymentMethod(businessId: widget.book.businessId!, paymentMethodId: selectedPayment.id!, name: text!.trim());
                              });
                            },
                              onAddNew: (){
                                BookController.showConfirmationDialog(onCancel: (){Navigator.pop(context);}, onConfirm: (value,__){controller.createPaymentMethod(name: value!.trim(), businessId: widget.book.businessId!);},
                                    showTextField: true,textFieldHint: 'New payment method',cancelText: 'Cancel',
                                    cancelColor: Colors.grey,confirmText: 'Add',title: 'Add your new method',confirmColor:Colors.green,validator: (String? value) {
                                      if (value?.trim().isEmpty ?? true) {
                                        return 'Enter your new method';
                                      }
                                      return null;
                                    });
                              }, subtitles: null
                          );
                        },
                        icon: Icon(Icons.settings,
                            color: Colors.grey[700], size: 18),
                      ),
                      items: controller.paymentMethodList.map((e)=>e.name!).toList(),
                      value: payment,
                     // onChanged: (val) => setState(() => payment = val),
                        onChanged: (val) {
                          setState(() {
                            selectedPayment = controller.paymentMethodList.firstWhere((e) => e.name == val);
                          });
                        }

                    );
                  }
                ),
                SizedBox(height: 20.h),

                // Remark/Notes
                Text(
                  'Remark/Notes',
                  style: AppTextStyles.titleSmall(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 6.h),
                TextFormField(
                  controller: _remarkController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.bookmark_outlined),
                    hintText: 'Remark/Notes',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your notes';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40.h),

                // Save Button
                SizedBox(
                  //width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (selectedPayment == null) {
                            Get.snackbar("Error", "Please select a payment method");
                            return;
                          }
                          // Remove commas and parse as double
                          String cleanedAmount = _amountController.text.replaceAll(',', '');
                          double amount = double.parse(cleanedAmount.trim());
                          Get.find<BookController>().createCashInAndOut(
                            date: date,
                            bookId: bookId,
                            time: time,
                            type: 1,
                            amount: amount.toInt(), // double → int
                            contactId: selectedContact?.id ,
                            categoryId: selectedCategory?.id,
                            paymentModeId: selectedPayment!.id!,
                            remarks: _remarkController.text.trim(),
                          );
Navigator.pop(context);
                        }
                      },

                      child: const Text('SAVE'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }





  Row _buildDateAndTime(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 6,
            child: InkWell(
              onTap: _selectDate,
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.calendar_today, color: AppColors.themeColor),
                    SizedBox(width: 10.w),
                    Text(
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                      style: TextStyle(fontSize: 16.sp, color: AppColors.themeColor),
                    ),
                    const Icon(Icons.arrow_drop_down, color: AppColors.themeColor),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Card(
            elevation: 6,
            child: InkWell(
              onTap: _selectTime,
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.access_time, color: AppColors.themeColor),
                    SizedBox(width: 10.w),
                    Text(
                      selectedTime.format(context),
                      style:
                      TextStyle(fontSize: 16.sp, color: AppColors.themeColor),
                    ),
                    const Icon(Icons.arrow_drop_down, color: AppColors.themeColor),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }









  @override
  void dispose() {
    _amountController.dispose();
    _remarkController.dispose();
    super.dispose();
  }
}
