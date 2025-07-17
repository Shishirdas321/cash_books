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
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text('Add Team Member'),
      ),
      body: Form(
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
                decoration: const InputDecoration(labelText: 'Email Address'),
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
              }, child: const Text('NEXT'))
            ],
          ),
        ),
      ),
    );
  }
}
