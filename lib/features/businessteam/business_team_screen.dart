import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/add_team_member_screen.dart';
import 'package:cash_books/features/home/ui/widgets/team_diagram.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text('Business Team'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.help_outline,
              color: AppColors.themeColor,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 24),
          const Text(
            "Add members & assign roles",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          // const SizedBox(height: 4),
          const Text(
            "Give access to limited features & books",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 40),
          const TeamDiagram(),
          const SizedBox(height: 30),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
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
