

import 'package:cash_books/features/book/controllers/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_card.dart';

/// Custom Bottom Sheet Widget
class CustomBottomSheet extends StatelessWidget {
  final String title;
  final List<String> items;
  final List<String?>? subtitles;
  final void Function(String) onDelete;
  final void Function(String) onEdit;
  final VoidCallback? onAddNew;
  final double height; // fixed height

  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.items,
    required this.onDelete,
    required this.onEdit,
    this.onAddNew,
    this.height = 500,
    this.subtitles,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookController>(
      builder: (controller) {
        return SizedBox(
          height: height,
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.black54),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              // Grid of cards
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(14),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: items.length,
                  itemBuilder: (ctx, index) {
                    final item = items[index];
                    final subtitle = (subtitles != null && index < subtitles!.length)
                        ? subtitles![index]
                        : null;

                    return CustomCard(
                      title: items[index],
                      subtitle: (subtitles != null && index < subtitles!.length)
                          ? (subtitles![index]!.isEmpty ? "No phone" : subtitles![index])
                          : null,
                      onDelete: () => onDelete(items[index]),
                      onEdit: () => onEdit(items[index]),
                    );

                  },
                ),
              ),

              // Add new button
              if (onAddNew != null)
                SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 6, 16, 12),
                    child: ElevatedButton(
                      onPressed: onAddNew,
                      child: const Text('+ Add New'),
                    ),
                  ),
                ),
            ],
          ),
        );
      }
    );
  }
}

/// Helper function to show the bottom sheet
Future<void> showCustomBottomSheet({
  required BuildContext context,
  required String title,
  required List<String> items,
  required void Function(String) onDelete,
  required void Function(String) onEdit,
  VoidCallback? onAddNew,
  double height = 500,
  List<String?>? subtitles,
}) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white,
    builder: (ctx) {
      return CustomBottomSheet(
        title: title,
        items: items,
        onDelete: onDelete,
        onEdit: onEdit,
        onAddNew: onAddNew,
        height: height,
        subtitles: subtitles, // ✅ FIXED
      );
    },
  );
}
