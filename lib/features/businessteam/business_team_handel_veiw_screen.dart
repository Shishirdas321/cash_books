import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_two.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/staff_info_screen.dart';
import 'package:flutter/material.dart';

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
      body: Stack(
        children: [
          const Positioned.fill(child: ScreenBackgroundTwo()),
          Padding(
          padding: const EdgeInsets.all(16),
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
              const SizedBox(height: 8),
              InkWell(
                onTap: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: AppColors.themeColor,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "View roles & permission in detail",
                      style: TextStyle(color: AppColors.themeColor),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {}, child:  const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_outline),
                      SizedBox(width: 5),
                      Text('ADD TEAM MEMBER'),
                    ],
                  )),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {}, child:  const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.book),
                      SizedBox(width: 5),
                      Text('ADD TO BOOK'),
                    ],
                  )),
            ],
          ),
        ),
    ],
      ),
    );
  }

  Card _buildMemberInfo(BuildContext context) {
    return Card(
      elevation: 6,
      child: ListTile(
        leading: const CircleAvatar(
          radius: 20,
          child: Icon(Icons.person_outline),
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
            child: const Card(
              elevation: 6,
              color: AppColors.themeColor,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Owner",
                      style: TextStyle(color: Colors.white,fontFamily: 'popins'),
                    ),
                   // SizedBox(width: 4),
                    Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 14),
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
