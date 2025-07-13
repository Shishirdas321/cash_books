import 'package:flutter/material.dart';

class AddTeamMemberScreen extends StatefulWidget {
  const AddTeamMemberScreen({super.key});

  static const String name = '/add-team-member';

  @override
  State<AddTeamMemberScreen> createState() => _AddTeamMemberScreenState();
}

class _AddTeamMemberScreenState extends State<AddTeamMemberScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _addNewMemberTEController =
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const SizedBox(height: 20),
              TextFormField(
                controller: _addNewMemberTEController,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(labelText: 'Business Name'),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter your business name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 100),
              ElevatedButton(onPressed: () {}, child: const Text('NEXT'))
            ],
          ),
        ),
      ),
    );
  }
}
