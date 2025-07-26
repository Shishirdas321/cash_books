import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BusinessListTile extends StatelessWidget {
  const BusinessListTile({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.title,
    required this.subtitle,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.business_outlined, color: AppColors.themeColor),
      title: Text(title,
          style: AppTextStyles.bodyMediumWhite(color: AppColors.themeColor)),
      subtitle: Text(subtitle,
          style: AppTextStyles.subtitleSmall(color: Colors.blueGrey)),
      trailing: isSelected
          ? const Icon(Icons.check_circle, color: AppColors.themeColor)
          : null,
      selected: isSelected,
      selectedTileColor: Colors.cyan.withOpacity(0.1),
      onTap: onTap,
    );
  }
}
