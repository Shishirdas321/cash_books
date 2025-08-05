
import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/member_add_to_select_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberAddToBookView extends StatelessWidget {
  const MemberAddToBookView({super.key});

  static const String name = '/add-to-book-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.93),
      //resizeToAvoidBottomInset: false,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        elevation: 6,
        backgroundColor: AppColors.themeColor,
        title:  Text('Add Staff to book',style: AppTextStyles.appbar(),),
      ),
      body: Padding(
          padding:  EdgeInsets.only(bottom: 25.h, left: 8.w, right: 8.w, top: 8.h),
          child: Column(
            children: [
               SizedBox(height: 20.h),
               Center(
                child: Column(
                  children: [
                    Text(
                      'Roles of staff members in books',
                        style: AppTextStyles.bodyMedium(color: Colors.black87),
                      ),
                     SizedBox(height: 4.h),
                    Text(
                      'Give them limited access to books of your choice',
                      style: AppTextStyles.titleSmall(color: Colors.black45)
                    ),
                     SizedBox(height: 40.h),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children:  [
                     ListTile(
                      leading:  CircleAvatar(
                       radius: 25.r,
                        child: const Icon(Icons.person_outline,color: AppColors.themeColor),
                      ),
                        title: Text(
                          'Admin',
                          style: AppTextStyles.bodyMedium(fontSize: 18.sp,color: Colors.black87),
                        ),
                        subtitle: Text(
                        "Full access to entries & book settings",
                        style: AppTextStyles.titleSmall(fontSize: 12.sp,color: Colors.black45),
                      ),
                    ),
                    ListTile(
                      leading:  CircleAvatar(
                        radius: 25.r,
                        child: const Icon(Icons.person_outline,color: AppColors.themeColor),
                      ),
                        title: Text(
                          'Data Operator',
                          style: AppTextStyles.bodyMedium(fontSize: 18.sp,color: Colors.black87),
                        ),
                        subtitle: Text(
                        "Only add entry access",
                        style: AppTextStyles.titleSmall(fontSize: 12.sp,color: Colors.black45),
                      ),
                    ),
                    ListTile(
                      leading:  CircleAvatar(
                        radius: 25.r,
                        child: const Icon(Icons.person_outline,color: AppColors.themeColor),
                      ),
                        title: Text(
                          'Viewer',
                          style: AppTextStyles.bodyMedium(fontSize: 18.sp,color: Colors.black87),
                        ),
                        subtitle: Text(
                        "Only view entry & reports access",
                        style: AppTextStyles.titleSmall(fontSize: 12.sp,color: Colors.black45),
                      ),
                    )
                  ],
                ),
              ),
               Padding(
                padding:  EdgeInsets.all(8.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Next step:",style: AppTextStyles.titleSmall(fontSize: 12.sp,color: Colors.black),),
                    Text('Select books',style: AppTextStyles.bodyMediumPopins(color: Colors.black45),)
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MemberAddToSelectBook.name);
                  },
                  child: const Text("NEXT"),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
