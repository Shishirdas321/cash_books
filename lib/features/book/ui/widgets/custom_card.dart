

import 'package:cash_books/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/fonts/app_text_style.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String? subtitle; // optional
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final TextStyle? textStyle;

  const CustomCard({
    super.key,
    required this.title,
    required this.onDelete,
    required this.onEdit,
    this.textStyle,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // === Top bar with edit & delete ===
          Container(
            decoration: const BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.edit,
                        size: 18, color: AppColors.themeColor),
                    padding: EdgeInsets.zero,
                    onPressed: onEdit,
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.delete,
                        size: 18, color: AppColors.themeColor),
                    padding: EdgeInsets.zero,
                    onPressed: onDelete,
                  ),
                ),
              ],
            ),
          ),

          // === Title & Subtitle ===
          Flexible(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        AppTextStyles.bodyMediumPopins(color: Colors.black87),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subtitle != null && subtitle!.trim().isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle!,
                      textAlign: TextAlign.center,
                      style: textStyle ??
                          AppTextStyles.bodyMediumPopins(color: Colors.grey,fontSize: 11.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
