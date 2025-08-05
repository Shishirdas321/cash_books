import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/choose_role_screen.dart';
import 'package:cash_books/features/home/ui/widgets/team_diagram.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTeamMemberScreen extends StatefulWidget {
  const AddTeamMemberScreen({super.key});

  static const String name = '/add-team-member';

  @override
  State<AddTeamMemberScreen> createState() => _AddTeamMemberScreenState();
}

class _AddTeamMemberScreenState extends State<AddTeamMemberScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTEController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.93),
      //resizeToAvoidBottomInset: false,
      //extendBodyBehindAppBar: true,
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
        title:  Text('Add Team Member',style: AppTextStyles.appbar(),),
      ),
      body:
          Form(
          key: _formKey,
          child: Padding(
            padding:  EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               //const SizedBox(height: 20),
                TextFormField(
                  controller: _emailTEController,
                  textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Email Address',hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.email_outlined,color: Colors.grey,)
                    ),
                    validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your business name';
                    }
                    return null;
                  },
                ),
                const TeamDiagram(),
                //const SizedBox(height: 50),
                ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, ChooseRoleScreen.name);
                }, child: const Text('NEXT'),
                ),
              ],
            ),
          ),
        ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
  }
}
