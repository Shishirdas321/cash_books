import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/controllers/business_team_controller.dart';
import 'package:cash_books/features/businessteam/staff_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BusinessTeamHandelViewScreen extends StatefulWidget {
  final int businessId;
  const BusinessTeamHandelViewScreen({super.key, required this.businessId});

  static const String name = '/team-handel-view';

  @override
  State<BusinessTeamHandelViewScreen> createState() =>
      _BusinessTeamHandelViewScreenState();
}

class _BusinessTeamHandelViewScreenState
    extends State<BusinessTeamHandelViewScreen> {
  final BusinessTeamController businessTeamController =
  Get.find<BusinessTeamController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      businessTeamController.getTeamMember(businessId: widget.businessId);
    });
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
        title: Text(
          'Business Team',
          style: AppTextStyles.appbar(),
        ),
      ),
      body: GetBuilder<BusinessTeamController>(
        builder: (controller) {
          if (controller.isLoadingbtn) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.businessTeam.isEmpty) {
            return const Center(child: Text('No team members found.'));
          }

          return Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.businessTeam.length,
                    itemBuilder: (context, index) {
                      final member = controller.businessTeam[index];
                      return _buildMemberInfo(context, member);
                    },
                  ),
                ),
                SizedBox(height: 8.h),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.info_outline, color: Colors.grey),
                      SizedBox(width: 8.w),
                      const Text(
                        "View roles & permission in detail",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.person_outline),
                      SizedBox(width: 5.w),
                      const Text('ADD TEAM MEMBER'),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.book),
                      SizedBox(width: 5.w),
                      const Text('ADD TO BOOK'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Card _buildMemberInfo(BuildContext context, member) {
    final firstName = member.user?.firstName ?? 'Unknown';
    return Card(
      elevation: 6,
      child: ListTile(
        leading: CircleAvatar(
          radius: 20.r,
          child: const Icon(Icons.person_outline),
        ),
        title: Text(
          firstName,
          style: AppTextStyles.titleSmall(),
        ),
        subtitle: Text(
          member.user?.email ?? '',
          style: AppTextStyles.subtitleSmall(),
        ),
        trailing: InkWell(
          onTap: () {
            Navigator.pushNamed(context, StaffInfoScreen.name, arguments: {
              'member': member,
              'businessId': widget.businessId, // businessId pass
            },);
          },
          child: Card(
            elevation: 6,
            color: AppColors.themeColor,
            child: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    member.role ?? 'Member',
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'popins'),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.white, size: 14.sp),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
