
import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_two.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/member_add_to_select_book.dart';
import 'package:flutter/material.dart';

class MemberAddToBookView extends StatelessWidget {
  const MemberAddToBookView({super.key});

  static const String name = '/add-to-book-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Stack(
        children: [
          const Positioned.fill(child: ScreenBackgroundTwo()),
          Padding(
          padding: const EdgeInsets.only(bottom: 25, left: 8, right: 8, top: 8),
          child: Column(
            children: [
              const SizedBox(height: 20),
               Center(
                child: Column(
                  children: [
                    Text(
                      'Roles of staff members in books',
                        style: AppTextStyles.bodyMedium(),
                      ),
                    const SizedBox(height: 4),
                    Text(
                      'Give them limited access to books of your choice',
                      style: AppTextStyles.titleSmall(color: Colors.blueGrey)
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children:  [
                     ListTile(
                      leading: const CircleAvatar(
                       radius: 25,
                        child: Icon(Icons.person_outline,color: AppColors.themeColor),
                      ),
                        title: Text(
                          'Admin',
                          style: AppTextStyles.bodyMedium(fontSize: 18),
                        ),
                        subtitle: Text(
                        "Full access to entries & book settings",
                        style: AppTextStyles.titleSmall(fontSize: 12,color: Colors.blueGrey),
                      ),
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        radius: 25,
                        child: Icon(Icons.person_outline,color: AppColors.themeColor),
                      ),
                        title: Text(
                          'Data Operator',
                          style: AppTextStyles.bodyMedium(fontSize: 18),
                        ),
                        subtitle: Text(
                        "Only add entry access",
                        style: AppTextStyles.titleSmall(fontSize: 12,color: Colors.blueGrey),
                      ),
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        radius: 25,
                        child: Icon(Icons.person_outline,color: AppColors.themeColor),
                      ),
                        title: Text(
                          'Viewer',
                          style: AppTextStyles.bodyMedium(fontSize: 18),
                        ),
                        subtitle: Text(
                        "Only view entry & reports access",
                        style: AppTextStyles.titleSmall(fontSize: 12,color: Colors.blueGrey),
                      ),
                    )
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Next step:",style: AppTextStyles.titleSmall(fontSize: 12,color: Colors.black),),
                    Text('Select books',style: AppTextStyles.bodyMediumPopins(),)
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
    ],
      ),
    );
  }
}
