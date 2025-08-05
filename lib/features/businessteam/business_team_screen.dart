import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/add_team_member_screen.dart';
import 'package:cash_books/features/home/ui/widgets/team_diagram.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessTeamScreen extends StatefulWidget {
  const BusinessTeamScreen({super.key});

  static const String name = '/business-team';

  @override
  State<BusinessTeamScreen> createState() => _BusinessTeamScreenState();
}

class _BusinessTeamScreenState extends State<BusinessTeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.93),
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
        elevation: 6,
        title:  Text(
          'Business Team',
          style: AppTextStyles.appbar(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.help_outline,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body:
          Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             SizedBox(height: 24.h),
             Text(
              "Add members & assign roles",
                style: AppTextStyles.bodyMedium(color: Colors.black54),
              ),
            // const SizedBox(height: 4),
             Text(
              "Give access to limited features & books",
              style: AppTextStyles.bodyMediumWhite(color: Colors.black54),
            ),
             SizedBox(height: 40.h),
            const TeamDiagram(),
             SizedBox(height: 30.h),
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
                  Text(
                    "View roles & permission in detail",
                    style: AppTextStyles.subtitleSmall(color: Colors.black54),
                  )
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(16.0.w),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddTeamMemberScreen.name);
                },
                child: const Text('Add Team Member'),
              ),
            ),
          ],
        ),
    );
  }
}
