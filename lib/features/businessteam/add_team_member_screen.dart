import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_two.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/choose_role_screen.dart';
import 'package:cash_books/features/home/ui/widgets/team_diagram.dart';
import 'package:flutter/material.dart';

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
      body: Stack(
        children: [
          const Positioned.fill(child: ScreenBackgroundTwo()),
          Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               //const SizedBox(height: 20),
                TextFormField(
                  controller: _emailTEController,
                  textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                        fillColor: AppColors.themeColor,
                        hintText: 'Email Address',hintStyle: TextStyle(color: Colors.white70),
                      prefixIcon: Icon(Icons.email_outlined,color: Colors.white70,)
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
      ],
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
  }
}
