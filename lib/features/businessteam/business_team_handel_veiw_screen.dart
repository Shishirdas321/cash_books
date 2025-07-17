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
      appBar: AppBar(
        title: const Text('Business Team'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help_outline),
          ),
        ],
      ),
      body: Padding(
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
                        return _buildMemberInfo();
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
    );
  }

  Card _buildMemberInfo() {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          radius: 20,
          child: Icon(Icons.person_outline),
        ),
        title: const Text('you'),
        subtitle: const Text('shishir7237@gmail.com',style: TextStyle(fontSize: 12,),),
        trailing: TextButton(
          onPressed: () {},
          child:  InkWell(
            onTap: (){Navigator.pushNamed(context, StaffInfoScreen.name);},
            child: Card(
              color: Colors.cyan.shade200,
              borderOnForeground: true,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child:Text("Owner >",style: TextStyle(color: Colors.black87,),) ,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
