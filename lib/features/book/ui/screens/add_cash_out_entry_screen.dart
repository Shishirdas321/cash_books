import 'package:cash_books/core/enums/enums.dart';
import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/core/widgets/custom_snackbar.dart';
import 'package:cash_books/features/book/model/AllCategoriesResponse.dart';
import 'package:cash_books/features/book/model/AllContactPerson.dart';
import 'package:cash_books/features/book/model/AllPaymentMethodResponse.dart';
import 'package:cash_books/features/book/ui/widgets/coustom_texfromfild.dart';

import 'package:cash_books/features/book/ui/widgets/custom_bottom_sheet.dart';
import 'package:cash_books/features/book/ui/widgets/custom_card.dart';
import 'package:cash_books/features/home/model/BookResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/book_controller.dart';
import '../widgets/coustom_dropdown.dart';

class AddCashOutEntryScreen extends StatefulWidget {
  final Book book;
  const AddCashOutEntryScreen({super.key,  required this.book});

  static const String name = '/add-cash-out';

  @override
  State<AddCashOutEntryScreen> createState() => _AddCashOutEntryScreenState();
}

class _AddCashOutEntryScreenState extends State<AddCashOutEntryScreen> {
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
 static DateTime selectedDate = DateTime.now();
 static TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.93),
      //resizeToAvoidBottomInset: false,
     // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
         leading: const BackButton(color: Colors.white,),
        title:  Text(
          'Add Cash Out Entry',
          style: AppTextStyles.appbar(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings,color: Colors.white70,),
            onPressed: () {
              // settings action
            },
          )
        ],
      ),
      body: 
          SafeArea(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                padding:  EdgeInsets.only(left: 16.w,right: 16.w,bottom: 20.h,top: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     SizedBox(height: 15.h),
                    // Date and Time Row
                    _buildDateAndTime(context),
                     SizedBox(height: 30.h),
                    // Amount Field
                    Column(
                      children: [
                        // Amount Field
                        TextFormField(textInputAction: TextInputAction.done,
                          controller: _amountController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.money),
                            hintText: 'Only number of amount',
                            border: OutlineInputBorder(),
                          ),
                          validator: (String? value){
                            if(value?.trim().isEmpty ?? true){
                              return 'Enter your amount number';
                            }
                           return null;
                          },
                        ),*/
                         SizedBox(height: 10.h),
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
                                            title: "Contact Name",
                                            type: CashInSettingType.contact,
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
                                              BookController.showConfirmationDialog(showTextField: true,textFieldHint: 'Contact name',textFieldHint2: 'Contact number',showSecondTextField: true,
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
                                                  },cancelText: 'Cancel',cancelColor: Colors.grey,confirmText: 'Update',confirmColor: Colors.green,title: 'Update your contact name', onCancel: () { Navigator.pop(context); },
                                                  onConfirm: (String? text,String? text1) {  controller.updateContactPerson(bookId: bookId, categoryId: selectedContact.id, name: text!.trim(), phone: text1!.trim());});
                                            },
                                            onAddNew: (){
                                              BookController.showConfirmationDialog(onCancel: (){}, onConfirm: (value,value1){
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
                                            },
                                        );
                                      },
                                      icon: Icon(Icons.settings,
                                          color: Colors.grey[700], size: 18),
                                    ),
                                    items:  controller.contactPerList.map((e)=>e.name!).toList(),
                                    subItems: Map.fromEntries(
                                        controller.contactPerList
                                            .where((e) => e.mobileNo != null)
                                            .map((e) => MapEntry(e.name!, [e.mobileNo!]))
                                    ),
                                    value: contact,
                                    //onChanged: (val) => setState(() => contact = val),
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
                                    label: "Category",
                                    actionIcon: IconButton(
                                      onPressed: () {
                                      showCustomBottomSheet(
                                          type: CashInSettingType.category,
                                          context: context,
                                          title: 'Category',
                                          items: controller.categoryList.map((e) =>e.name!).toList(),
                                          onDelete: (selectedName){
                                            BookController.showConfirmationDialog(onCancel: (){Navigator.pop(context);},
                                                onConfirm: (_,__){final selectedCategory = controller.categoryList.firstWhere((e) => e.name == selectedName);
                                                controller.deleteCategory(bookId, selectedCategory.id!);},
                                                title: 'Are you sure you want to delete this Category ?',confirmText: 'Delete',
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
                                                },cancelText: 'Cancel',cancelColor: Colors.grey,confirmText: 'Update',confirmColor: Colors.green,title: 'Update your category', onCancel: () { Navigator.pop(context); },
                                                onConfirm: (String? text1,String? text2) {  controller.updateCategory(bookId: bookId, categoryId: selectedCategory.id!, name: text1!.trim(), status: 1,); });
                                          },
                                          onAddNew: (){
                                            BookController.showConfirmationDialog(onCancel: (){},
                                                onConfirm: (value,value2){ controller.createBookCategory(name: value!.trim(), bookId: bookId,);},
                                                showTextField: true,textFieldHint: 'New category',cancelText: 'Cancel',
                                                cancelColor: Colors.grey,confirmText: 'Add',title: 'Add your new category',confirmColor:Colors.green,validator: (String? value) {
                                                  if (value?.trim().isEmpty ?? true) {
                                                    return 'Enter your new category';
                                                  }
                                                  return null;
                                                });
                                          }, subtitles: null);
                                    },
                                      icon: Icon(Icons.settings,
                                          color: Colors.grey[700], size: 18),
                                    ),
                                    items: controller.categoryList.map((e) =>e.name!).toList(),
                                    value: category,
                                   // onChanged: (val) => setState(() => category = val),
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
                              label: "Payment method",
                              actionIcon: IconButton(
                                onPressed: () {
                                  showCustomBottomSheet(context: context,
                                      title: "Payment method",
                                      type: CashInSettingType.payment,
                                      items: controller.paymentMethodList.map((e)=>e.name!).toList(),
                                      onDelete: (selectedName){
                                      BookController.showConfirmationDialog(onCancel: (){Navigator.pop(context);},
                                          onConfirm: (_,__){  final selectedPaymentMethod = controller.paymentMethodList.firstWhere((e) => e.name == selectedName);
                                          controller.deletePaymentMethod(widget.book.businessId!, selectedPaymentMethod.id!);},
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
                                        onConfirm: (String? text,String? text1) {
                                          controller.updatePaymentMethod(businessId: widget.book.businessId!, paymentMethodId: selectedPayment.id!, name: text!.trim());
                                        });
                                      },
                                      onAddNew: (){
                                    BookController.showConfirmationDialog(onCancel: (){Navigator.pop(context);}, onConfirm: (value,__){controller.createPaymentMethod(name: value!.trim(), businessId: widget.book.businessId!);},showTextField: true,textFieldHint: 'New payment method',cancelText: 'Cancel',
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
                              //onChanged: (val) => setState(() => payment = val),
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
                          controller: _noteController,
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
                      ],
                    ),
                    SizedBox(height: 40.h),
                    // Save Button
                    SizedBox(
                      //width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (selectedPayment == null) {
                              showCustomSnackBar( "Please select a payment method", isError: true, isPosition: false);
                            //  Get.snackbar("Error", "Please select a payment method");
                              return;
                            }
                            // Remove commas and parse as double
                            String cleanedAmount = _amountController.text.replaceAll(',', '');
                            double amount = double.parse(cleanedAmount.trim());
                            Get.find<BookController>().createCashInAndOut(
                              date: date,
                              bookId: bookId,
                              time: time,
                              type: 2,
                              amount: amount.toInt(), // double → int
                              contactId: selectedContact?.id ,
                              categoryId: selectedCategory?.id,
                              paymentModeId: selectedPayment!.id!,
                              remarks: _noteController.text.trim(),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('SAVE'),
                      ),
                    )
                  ],
                ),
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
                padding:  EdgeInsets.all(8.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.calendar_today,color: AppColors.themeColor),
                     SizedBox(width: 10.w),
                    Text(
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                      style:  TextStyle(fontSize: 16.sp,color: AppColors.themeColor),
                    ),
                    const Icon(Icons.arrow_drop_down,color: AppColors.themeColor,),
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
                padding:  EdgeInsets.all(8.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.access_time,color: AppColors.themeColor,),
                     SizedBox(width: 10.w),
                    Text(
                      selectedTime.format(context),
                      style:  TextStyle(fontSize: 16.sp,color: AppColors.themeColor),
                    ),
                    const Icon(Icons.arrow_drop_down,color: AppColors.themeColor,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

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
  void dispose() {
    super.dispose();
    _amountController.dispose();
    _noteController.dispose();
  }
}
/*
import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_one.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/book/ui/screens/controllers/cash_out_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 // Update this import path accordingly

class AddCashOutEntryScreen extends StatefulWidget {
  const AddCashOutEntryScreen({super.key});

  static const String name = '/add-cash-out';

  @override
  State<AddCashOutEntryScreen> createState() => _AddCashOutEntryScreenState();
}

class _AddCashOutEntryScreenState extends State<AddCashOutEntryScreen> {
  final CashOutController controller = Get.find<CashOutController>();

  late TextEditingController _amountController;
  late TextEditingController _categoryController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(text: controller.amount.value);
    _categoryController = TextEditingController(text: controller.category.value);

    _amountController.addListener(() {
      controller.setAmount(_amountController.text);
    });

    _categoryController.addListener(() {
      controller.setCategory(_categoryController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        leading: const BackButton(color: Colors.white),
        title: Text(
          'Add Cash Out Entry',
          style: AppTextStyles.appbar(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white70),
            onPressed: () {
              // settings action
            },
          )
        ],
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: ScreenBackgroundOne()),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDateAndTime(context),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _amountController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.money),
                    hintText: 'Amount',
                    border: OutlineInputBorder(),
                    suffixText: 'Taka',
                    suffixStyle: TextStyle(color: AppColors.themeColor),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _categoryController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.category_outlined),
                    hintText: 'Category',
                    border: OutlineInputBorder(),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Save logic
                      print('Date: ${controller.selectedDate.value}');
                      print('Time: ${controller.selectedTime.value.format(context)}');
                      print('Amount: ${controller.amount.value}');
                      print('Category: ${controller.category.value}');
                    },
                    child: const Text('SAVE'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _buildDateAndTime(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => _selectDate(context),
            child: Obx(() {
              final d = controller.selectedDate.value;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.calendar_today, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    "${d.day}/${d.month}/${d.year}",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              );
            }),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: InkWell(
            onTap: () => _selectTime(context),
            child: Obx(() {
              final t = controller.selectedTime.value;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.access_time, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    t.format(context),
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      controller.setDate(picked);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: controller.selectedTime.value,
    );
    if (picked != null) {
      controller.setTime(picked);
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _categoryController.dispose();
    super.dispose();
  }
}

*/
