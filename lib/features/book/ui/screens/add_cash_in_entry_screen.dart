import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCashInEntryScreen extends StatefulWidget {
  const AddCashInEntryScreen({super.key});

  static const String name = '/add-cash-in';

  @override
  State<AddCashInEntryScreen> createState() => _AddCashInEntryScreenState();
}

class _AddCashInEntryScreenState extends State<AddCashInEntryScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();

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
      //resizeToAvoidBottomInset: false,
     // extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: AppColors.themeColor,
        // leading: BackButton(),
        title:  Text(
          'Add Cash In Entry',
          style: AppTextStyles.appbar(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings,color: Colors.white,),
            onPressed: () {
              // settings action
            },
          )
        ],
      ),
      body:
          Padding(
          padding:  EdgeInsets.only(top: 30.h,bottom: 20.h,left: 16.w,right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                SizedBox(height: 15.h),
              // Date and Time Row
              _buildDateAndTime(context),
                SizedBox(height: 30.h),
              // Amount Field
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
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
                    ),
                     SizedBox(height: 10.h),
                    TextFormField(
                      controller: _categoryController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.category_outlined),
                        hintText: 'Category',
                        border: OutlineInputBorder(),
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Enter a Category';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      Navigator.pop(context);
                    }
                    // Save logic
                  },
                  child: const Text('SAVE'),
                ),
              )
            ],
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
                    const Icon(Icons.calendar_today,color: AppColors.themeColor,),
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
         SizedBox(width: 20.w ),
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


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _amountController.dispose();
    _categoryController.dispose();
  }
}
