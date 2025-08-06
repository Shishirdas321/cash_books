import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/home/controllers/create_new_business_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddNewBusinessScreen extends StatefulWidget {
  const AddNewBusinessScreen({super.key});

  static const String name = '/add-new-business';

  @override
  State<AddNewBusinessScreen> createState() => _AddNewBusinessScreenState();
}

class _AddNewBusinessScreenState extends State<AddNewBusinessScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _businessNameTEController =
      TextEditingController();
  final CreateNewBusinessController createNewBusinessController = Get.find();

  @override
  Widget build(BuildContext context) {
    //final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.93),
      appBar: AppBar(
        title:  Text(
          'Add New Business',
          style: AppTextStyles.appbar(),
        ),
        leading: IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: AppColors.themeColor,
        elevation: 6,
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding:  EdgeInsets.all(16.w),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                TextFormField(
                  controller: _businessNameTEController,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(hintText: 'Business Name',prefixIcon: Icon(Icons.business_center_outlined)),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your business name';
                    }
                    return null;
                  },
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding:  EdgeInsets.only(
                      bottom: 18.h, left: 8.w, right: 8.w, top: 18.h),
                  child: SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(onPressed: () {
                        if(_formKey.currentState!.validate()){
                          createNewBusinessController.createNewBusiness(name: _businessNameTEController.text);
                        }
                      }, child: const Text('NEXT'))),
                )
              ],
            ),
          ),
        ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _businessNameTEController.dispose();
  }
}
