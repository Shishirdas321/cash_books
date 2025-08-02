import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_two.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  static const String name = '/help';

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.93),
      appBar: AppBar(
        elevation: 6,
        backgroundColor: AppColors.themeColor,
        title:  Text(
          'Help & Support',
          style: AppTextStyles.appbar(),
        ),
      ),
      body: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                Divider(),
                ListTile(
                  title: Text('Need support?',style: TextStyle(fontFamily: 'popins'),),
                  subtitle: Text('Email',style: TextStyle(fontFamily: 'popins'),),
                  trailing: Text('shishird076@gmail.com',style: TextStyle(fontFamily: 'popins',fontSize: 13),),
                ),
                Divider(),
                ListTile(
                  title: Text("Contact & WhatsApp",style: TextStyle(fontFamily: 'popins'),),
                  trailing: Text('01867660754',style: TextStyle(fontFamily: 'popins',fontSize: 13),),
                ),
                Divider()
              ],
            ),
          )
    );
  }
}
