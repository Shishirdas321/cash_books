import 'package:cash_books/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BusinessListTile extends StatelessWidget {
  const BusinessListTile({super.key, required this.isSelected,});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(

      leading: const Icon(Icons.business_outlined,color: AppColors.themeColor,),
      title: const Text('Top Man'),
      subtitle: const Text('Your Role: Member'),
      trailing: isSelected ? const Icon(Icons.check_circle,color: AppColors.themeColor) : null,selectedTileColor: Colors.cyan,
      onTap: (){Navigator.pop(context);},
    );

  }
}
