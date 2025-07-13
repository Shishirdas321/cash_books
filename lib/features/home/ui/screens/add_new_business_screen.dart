import 'package:flutter/material.dart';

class AddNewBusinessScreen extends StatefulWidget {
  const AddNewBusinessScreen({super.key});

  static const String name = '/add-new-business';

  @override
  State<AddNewBusinessScreen> createState() => _AddNewBusinessScreenState();
}

class _AddNewBusinessScreenState extends State<AddNewBusinessScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _businessNameTEController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Add Business Name',
                style: textTheme.titleLarge,
              ),
              TextFormField(
                controller: _businessNameTEController,
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
