
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MoveBookScreen extends StatefulWidget {
  const MoveBookScreen({super.key});

  static const String name = '/move-book';

  @override
  State<MoveBookScreen> createState() => _MoveBookScreenState();
}

class _MoveBookScreenState extends State<MoveBookScreen> {
  String? selectedBusiness;

  final List<String> businesses = [
    'Adjective',
    'Top-10',
    'Easy Fashion11111111111111111111111111111111111111111',
    'Aarong',
    'Sailor',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Select Business',style: TextStyle(fontFamily: 'appBarText',color: AppColors.themeColor),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Select a business to move 'Business Book' book",
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: businesses.length,
                itemBuilder: (context, index) {
                  final business = businesses[index];
                  final isSelected = selectedBusiness == business;
                  return buildBusinessTile(business, isSelected);
                },
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: selectedBusiness == null ? null : () {
                  // NEXT button action
                },
                child: const Text('NEXT'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ Extracted Method: Builds a single business selection tile
  Widget buildBusinessTile(String business, bool isSelected) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
        border: Border.all(
        color: isSelected ? Colors.blue : Colors.grey.shade300,
        width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
    ),
    child: ListTile(
    title: Text(
    business,
    overflow: TextOverflow.ellipsis,
    ),
    subtitle: const Text('Your Role: Owner'),
    trailing: isSelected
    ? const Icon(Icons.check_circle, color: AppColors.themeColor)
        : null,
    onTap: () {
    setState(() {
    selectedBusiness = business;
    });
    },
    ),
    );
  }
}