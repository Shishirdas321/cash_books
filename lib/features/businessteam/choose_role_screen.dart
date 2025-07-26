import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_one.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/business_team_handel_veiw_screen.dart';
import 'package:flutter/material.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  static const String name = '/choose-role';

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  String selectedRole = 'Staff';

  @override
  Widget build(BuildContext context) {
    final bool isStaff = selectedRole == 'Staff';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        elevation: 6,
        backgroundColor: AppColors.themeColor,
        title:  Text(
          'Choose Role',
          style: AppTextStyles.appbar(),
        ),
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: ScreenBackgroundOne()),
          Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    " Choose their role in this business and add",
                    style: AppTextStyles.bodyMediumPopins(),
                  ),
                  const SizedBox(height: 16),
                   Row(
                    children: [
                      const CircleAvatar(
                        child: Icon(Icons.mark_email_read_outlined),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "dknnn22@gmail.com",
                            style: AppTextStyles.bodyMediumPopins(),
                          ),
                          Text(
                            "dknnn22@gmail.com",
                            style: AppTextStyles.appbar(color: Colors.white60,fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Card(
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        children: [
                           Text(
                            "Choose Role & Invite",
                            style:
                            AppTextStyles.bodyMedium(color: AppColors.themeColor,fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ChoiceChip(
                                      label:  Text("Partner",style: AppTextStyles.titleSmall(),),
                                      selected: selectedRole == 'Partner',
                                      onSelected: (_) {
                                        setState(() {
                                          selectedRole = 'Partner';
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: ChoiceChip(
                                      label:  Text("Staff",style: AppTextStyles.titleSmall(),),
                                      selected: selectedRole == 'Staff',
                                      onSelected: (_) {
                                        setState(() {
                                          selectedRole = 'Staff';
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                           Text(
                            "Permissions",
                            style:
                                AppTextStyles.bodyMediumPopins(color: AppColors.themeColor,fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          ..._buildPermissions(isStaff),
                          const SizedBox(height: 16),
                           Text(
                            "Restrictions",
                            style:
                            AppTextStyles.bodyMediumPopins(color: AppColors.themeColor,fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          ..._buildRestrictions(isStaff),
                        ],
                      ),
                    ),
                  ),

                   Padding(
                    padding: const EdgeInsets.only(top: 6,left: 8),
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline, color: Colors.grey),
                        Text(
                          'You can change this role letter',
                          style: AppTextStyles.subtitleSmall(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () {
                        // Handle add action here
                        Navigator.pushNamed(
                            context, BusinessTeamHandelViewScreen.name);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Team member added done'),
                          ),
                        );
                      },
                      child: Text("+ ADD AS ${selectedRole.toUpperCase()}"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    ],
      ),
    );
  }

  List<Widget> _buildPermissions(bool isStaff) {
    if (isStaff) {
      return  [
        ListTile(
          leading: const Icon(Icons.check_circle, color: Colors.green),
          title: Text("Limited access to selected books",style:  AppTextStyles.titleSmall(color: Colors.black54,fontWeight: FontWeight.w300),),
        ),
        ListTile(
          leading: const Icon(Icons.check_circle, color: Colors.green),
          title: Text(
            "Owner/Partner can assign Admin, Viewer or Data Operator role to staff in any book",
            style:  AppTextStyles.titleSmall(color: Colors.black54,fontWeight: FontWeight.w300),
          ),
        ),
      ];
    } else {
      return  [
        ListTile(
          leading: const Icon(Icons.check_circle, color: Colors.green),
          title: Text("Full access to all books of this business",
          style:  AppTextStyles.titleSmall(color: Colors.black54,fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.check_circle, color: Colors.green),
          title: Text("Full access to business settings",
          style:  AppTextStyles.titleSmall(color: Colors.black54,fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.check_circle, color: Colors.green),
          title: Text("Add/remove members in business",
          style:  AppTextStyles.titleSmall(color: Colors.black54,fontWeight: FontWeight.w300),
          ),
        ),
      ];
    }
  }

  List<Widget> _buildRestrictions(bool isStaff) {
    if (isStaff) {
      return  [
        ListTile(
          leading: const Icon(Icons.cancel, color: Colors.red),
          title: Text("No access to books they are not part of",
          style:  AppTextStyles.titleSmall(color: Colors.black54,fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.cancel, color: Colors.red),
          title: Text("No access to business settings",
          style:  AppTextStyles.titleSmall(color: Colors.black54,fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.cancel, color: Colors.red),
          title: Text("No option to delete books",
          style:  AppTextStyles.titleSmall(color: Colors.black54,fontWeight: FontWeight.w300),
          ),
        ),
      ];
    } else {
      return  [
        ListTile(
          leading: const Icon(Icons.cancel, color: Colors.red),
          title: Text("Can’t delete business",
          style:  AppTextStyles.titleSmall(color: Colors.black54,fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.cancel, color: Colors.red),
          title: Text("Can’t remove owner from business",style:
          AppTextStyles.titleSmall(color: Colors.black54,fontWeight: FontWeight.w300),),
        ),
      ];
    }
  }
}
