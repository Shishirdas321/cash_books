import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UpdateBusinessScreen extends StatefulWidget {
  const UpdateBusinessScreen({
    super.key,
    required this.businessId,
    required this.initialName,
    required this.status,
  });

  final int businessId;      // Business ID for URL path
  final String initialName;  // Current name to prefill
  final int status;          // Current status from business object

  static const String name = '/update-business';

  @override
  State<UpdateBusinessScreen> createState() => _UpdateBusinessScreenState();
}

class _UpdateBusinessScreenState extends State<UpdateBusinessScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _updateBusinessNameTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _updateBusinessNameTEController.text = widget.initialName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.93),
      appBar: AppBar(
        title: Text('Update Business', style: AppTextStyles.appbar()),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: AppColors.themeColor,
        elevation: 6,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              TextFormField(
                controller: _updateBusinessNameTEController,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  hintText: 'Business Name',
                  prefixIcon: Icon(Icons.business_center_outlined),
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter your business name';
                  }
                  return null;
                },
              ),
              const Expanded(child: SizedBox()),
              Padding(
                padding: EdgeInsets.only(bottom: 18.h, left: 8.w, right: 8.w, top: 18.h),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.find<HomeController>().updateBusiness(
                          id: widget.businessId,
                          name: _updateBusinessNameTEController.text.trim(),
                          status: widget.status,
                        );
                      }
                    },
                    child: const Text('UPDATE'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _updateBusinessNameTEController.dispose();
    super.dispose();
  }
}
