import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/add_team_member_screen.dart';
import 'package:cash_books/settings/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.93),
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title:  Text(
          'Settings',
          style: AppTextStyles.appbar(),
        ),
      ),
      body: Padding(
            padding:  EdgeInsets.all(8.0.w),
            child: Column(
              children: [
                 SizedBox(height: 20.h),
                const Divider(),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, AddTeamMemberScreen.name);
                  },
                  leading:  CircleAvatar(
                      radius: 25.r,
                      child: const Icon(
                        Icons.group_outlined,
                        color: AppColors.themeColor,
                      )),
                  title: const Text(
                    'Business Team',
                    style: TextStyle(fontFamily: 'popins', color: Colors.black87),
                  ),
                  subtitle:  Text(
                    'Add,remove or change role',
                    style: TextStyle(fontSize: 12.sp, color: Colors.black87),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, ProfileScreen.name);
                  },
                  leading:  CircleAvatar(
                      radius: 25.r,
                      child: const Icon(
                        Icons.person_outline,
                        color: AppColors.themeColor,
                      )),
                  title: const Text(
                    'Your profile',
                    style: TextStyle(fontFamily: 'popins', color: Colors.black87),
                  ),
                  subtitle:  Text(
                    'Name and Email',
                    style: TextStyle(fontSize: 12.sp, color: Colors.black45),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    _showLogoutAlertDialog(context);
                  },
                  leading:  CircleAvatar(
                      radius: 25.r,
                      child: const Icon(
                        Icons.logout,
                        color: Colors.red,
                      )),
                  title: const Text(
                    'LogOut',
                    style: TextStyle(fontFamily: 'popins', color: Colors.black87),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                const Divider()
              ],
            ),
          )
    );
  }

  Future<dynamic> _showLogoutAlertDialog(context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:  Text(
          'Are you sure you want to Logout?',
          style: AppTextStyles.bodyMedium(color: Colors.black87),
        ),
        actions: [
          Card(
            color: Colors.green.shade100,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Card(
            color: Colors.red.shade100,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'LogOut',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
