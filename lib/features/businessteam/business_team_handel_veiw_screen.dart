import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/staff_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessTeamHandelViewScreen extends StatefulWidget {
  const BusinessTeamHandelViewScreen({super.key});

  static const String name = '/team-handel-view';

  @override
  State<BusinessTeamHandelViewScreen> createState() =>
      _BusinessTeamHandelViewScreenState();
}

class _BusinessTeamHandelViewScreenState
    extends State<BusinessTeamHandelViewScreen> {
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
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: AppColors.themeColor,
        title:  Text(
          'Business Team',
          style: AppTextStyles.appbar(),
        ),
      ),
      body: Padding(
          padding:  EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return _buildMemberInfo(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
               SizedBox(height: 8.h),
              InkWell(
                onTap: () {},
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 8.h),
                    const Text(
                      "View roles & permission in detail",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
               SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                  onPressed: () {}, child:   Row(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.person_outline),
                      SizedBox(width: 5.w),
                      const Text('ADD TEAM MEMBER'),
                    ],
                  )),
               SizedBox(height: 20.h),
              ElevatedButton(
                  onPressed: () {}, child:   Row(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.book),
                      SizedBox(width: 5.w),
                      const Text('ADD TO BOOK'),
                    ],
                  )),
            ],
          ),
        ),
    );
  }

  Card _buildMemberInfo(BuildContext context) {
    return Card(
      elevation: 6,
      child: ListTile(
        leading:  CircleAvatar(
          radius: 20.r,
          child: const Icon(Icons.person_outline),
        ),
        title:  Text('You',style: AppTextStyles.titleSmall(),),
        subtitle:  Text(
          'shishir727@gmail.com',
          style: AppTextStyles.subtitleSmall(),
        ),
        trailing: TextButton(
          onPressed: () {},
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, StaffInfoScreen.name);
            },
            child:  Card(
              elevation: 6,
              color: AppColors.themeColor,
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Owner",
                      style: TextStyle(color: Colors.white,fontFamily: 'popins'),
                    ),
                   // SizedBox(width: 4),
                    Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 14.sp),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
