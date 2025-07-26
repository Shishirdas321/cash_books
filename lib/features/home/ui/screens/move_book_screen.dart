
import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_two.dart';
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
    'Partex',
    'Acme',
    'MI'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        title:   Text('Select Business',style: AppTextStyles.appbar(),),
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: ScreenBackgroundTwo()),
          Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
               Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Select a business to move 'Business Book' book",
                  style: AppTextStyles.bodyMediumPopins(color: AppColors.themeColor),
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
              Padding(
                  padding: const EdgeInsets.only(
                      bottom: 18, left: 8, right: 8, top: 18),
                  child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: selectedBusiness == null ? null : () {
                      // NEXT button action
                    },
                    child: const Text('NEXT'),
                  ),
                ),
              ),
            ],
          ),
        ),
    ],
      ),
    );
  }

  /// ✅ Extracted Method: Builds a single business selection tile
  Widget buildBusinessTile(String business, bool isSelected) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(color: Colors.white,
        border: Border.all(
        color: isSelected ? AppColors.themeColor : Colors.grey.shade300,
        width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
    ),
    child: ListTile(
    title: Text(
    business,style: AppTextStyles.bodyMediumWhite(color: AppColors.themeColor),
    overflow: TextOverflow.ellipsis,
    ),
    subtitle:  Text('Your Role: Owner',style: AppTextStyles.subtitleSmall(color: AppColors.themeColor),),
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