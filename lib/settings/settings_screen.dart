import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_one.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/add_team_member_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title:  Text(
          'Settings',
          style: AppTextStyles.appbar(),
        ),
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: ScreenBackgroundOne()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Divider(),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, AddTeamMemberScreen.name);
                  },
                  leading: const CircleAvatar(
                      radius: 25,
                      child: Icon(
                        Icons.group_outlined,
                        color: AppColors.themeColor,
                      )),
                  title: const Text(
                    'Business Team',
                    style: TextStyle(fontFamily: 'popins', color: Colors.white),
                  ),
                  subtitle: const Text(
                    'Add,remove or change role',
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  leading: const CircleAvatar(
                      radius: 25,
                      child: Icon(
                        Icons.person_outline,
                        color: AppColors.themeColor,
                      )),
                  title: const Text(
                    'Your profile',
                    style: TextStyle(fontFamily: 'popins', color: Colors.white),
                  ),
                  subtitle: const Text(
                    'Name and Email',
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    _showLogoutAlertDialog(context);
                  },
                  leading: const CircleAvatar(
                      radius: 25,
                      child: Icon(
                        Icons.logout,
                        color: Colors.red,
                      )),
                  title: const Text(
                    'LogOut',
                    style: TextStyle(fontFamily: 'popins', color: Colors.white),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                const Divider()
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> _showLogoutAlertDialog(context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:  Text(
          'Are you sure you want to Logout?',
          style: AppTextStyles.bodyMedium(),
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
