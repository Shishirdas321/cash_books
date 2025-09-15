/*import 'package:cash_books/core/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_card.dart';
import 'package:cash_books/features/book/controllers/book_controller.dart';

/// Custom Bottom Sheet Widget with Scroll-Only Pagination
class CustomBottomSheet extends StatefulWidget {
  final String title;
  final List<String> items;
  final List<String?>? subtitles;
  final void Function(String) onDelete;
  final void Function(String) onEdit;
  final VoidCallback? onAddNew;
  final double height;
  final CashInSettingType type;

  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.items,
    required this.onDelete,
    required this.onEdit,
    required this.type,
    this.onAddNew,
    this.height = 500,
    this.subtitles,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Trigger load more when user scrolls near the bottom (200px before end)
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMoreIfNeeded();
    }
  }

  void _loadMoreIfNeeded() {
    final controller = Get.find<BookController>();

    // Prevent multiple simultaneous requests
    if (controller.isLoadingbtn) return;

    // Check if more data is available and load accordingly
    switch (widget.type) {
      case CashInSettingType.contact:
        if (controller.contactCurrentPage < controller.contactLastPage) {
          controller.loadContactNextPage();
        }
        break;
      case CashInSettingType.category:
        if (controller.currentPage < controller.lastPage) {
          controller.loadNextPage();
        }
        break;
      case CashInSettingType.payment:
        if (controller.paymentCurrentPage < controller.paymentLastPage) {
          controller.loadPaymentNextPage();
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: GetBuilder<BookController>(
        builder: (controller) {
          // Get dynamic data based on type
          List<String> dynamicItems = [];
          List<String?>? dynamicSubtitles = [];
          bool hasMoreData = false;

          switch (widget.type) {
            case CashInSettingType.contact:
              dynamicItems = controller.contactPerList.map((e) => e.name!).toList();
              dynamicSubtitles = controller.contactPerList.map((e) => e.mobileNo!).toList();
              hasMoreData = controller.contactCurrentPage < controller.contactLastPage;
              break;
            case CashInSettingType.category:
              dynamicItems = controller.categoryList.map((e) => e.name!).toList();
              dynamicSubtitles = null;
              hasMoreData = controller.currentPage < controller.lastPage;
              break;
            case CashInSettingType.payment:
              dynamicItems = controller.paymentMethodList.map((e) => e.name!).toList();
              dynamicSubtitles = null;
              hasMoreData = controller.paymentCurrentPage < controller.paymentLastPage;
              break;
          }

          return Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
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

              // Scrollable content with pagination
              Expanded(
                child: dynamicItems.isEmpty && !controller.isLoadingbtn
                    ? const Center(
                  child: Text(
                    'No items found',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                )
                    : CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    // Grid items
                    SliverPadding(
                      padding: const EdgeInsets.all(14),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            return CustomCard(
                              title: dynamicItems[index],
                              subtitle: (dynamicSubtitles != null &&
                                  index < dynamicSubtitles.length)
                                  ? (dynamicSubtitles[index]?.isEmpty ?? true
                                  ? "No phone"
                                  : dynamicSubtitles[index])
                                  : null,
                              onDelete: () => widget.onDelete(dynamicItems[index]),
                              onEdit: () => widget.onEdit(dynamicItems[index]),
                            );
                          },
                          childCount: dynamicItems.length,
                        ),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 1.5,
                        ),
                      ),
                    ),

                    // Loading indicator at bottom
                    if (controller.isLoadingbtn)
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Loading more...',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    // End of data indicator
                    if (!controller.isLoadingbtn && !hasMoreData && dynamicItems.isNotEmpty)
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Center(
                            child: Text(
                              'No more items',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Add new button
              if (widget.onAddNew != null)
                SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 6, 16, 12),
                    child: ElevatedButton(
                      onPressed: widget.onAddNew,
                      child: const Text('+ Add New'),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
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
  required CashInSettingType type,
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
        subtitles: subtitles,
        type: type,
      );
    },
  );
}*/
//final 1
/*import 'package:cash_books/core/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_card.dart';
import 'package:cash_books/features/book/controllers/book_controller.dart';

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
    return SizedBox(
      height: height,
      child: GetBuilder<BookController>(
        builder: (controller) {
          // Dynamic data based on controller state
          List<String> dynamicItems = [];
          List<String?>? dynamicSubtitles = [];

          if (title == 'Contact Name') {
            dynamicItems = controller.contactPerList.map((e) => e.name!).toList();
            dynamicSubtitles = controller.contactPerList.map((e) => e.mobileNo!).toList();
          } else if (title == 'Category') {
            dynamicItems = controller.categoryList.map((e) => e.name!).toList();
            dynamicSubtitles = null;
          } else if (title == 'Payment method') {
            dynamicItems = controller.paymentMethodList.map((e) => e.name!).toList();
            dynamicSubtitles = null;
          }

          return Column(
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
                  itemCount: dynamicItems.length,
                  itemBuilder: (ctx, index) {
                    final item = dynamicItems[index];
                    final subtitle = (dynamicSubtitles != null && index < dynamicSubtitles.length)
                        ? dynamicSubtitles[index]
                        : null;

                    return CustomCard(
                      title: dynamicItems[index],
                      subtitle: (dynamicSubtitles != null && index < dynamicSubtitles.length)
                          ? (dynamicSubtitles[index]!.isEmpty ? "No phone" : dynamicSubtitles[index])
                          : null,
                      onDelete: () => onDelete(dynamicItems[index]),
                      onEdit: () => onEdit(dynamicItems[index]),
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
          );
        },
      ),
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
  required CashInSettingType type,
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
        subtitles: subtitles,
      );
    },
  );
}*/

// final 2
// import 'package:cash_books/core/enums/enums.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'custom_card.dart';
// import 'package:cash_books/features/book/controllers/book_controller.dart';
//
// /// Custom Bottom Sheet Widget with Scroll-Only Pagination
// class CustomBottomSheet extends StatefulWidget {
//   final String title;
//   final List<String> items;
//   final List<String?>? subtitles;
//   final void Function(String) onDelete;
//   final void Function(String) onEdit;
//   final VoidCallback? onAddNew;
//   final double height;
//   final CashInSettingType type;
//
//   const CustomBottomSheet({
//     super.key,
//     required this.title,
//     required this.items,
//     required this.onDelete,
//     required this.onEdit,
//     required this.type,
//     this.onAddNew,
//     this.height = 500,
//     this.subtitles,
//   });
//
//   @override
//   State<CustomBottomSheet> createState() => _CustomBottomSheetState();
// }
//
// class _CustomBottomSheetState extends State<CustomBottomSheet> {
//   final ScrollController _scrollController = ScrollController();
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//   }
//
//   @override
//   void dispose() {
//     _scrollController.removeListener(_onScroll);
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   void _onScroll() {
//     // Trigger load more when user scrolls near the bottom (200px before end)
//     if (_scrollController.position.pixels >=
//         _scrollController.position.maxScrollExtent - 200) {
//       _loadMoreIfNeeded();
//     }
//   }
//
//   void _loadMoreIfNeeded() {
//     final controller = Get.find<BookController>();
//
//     // Prevent multiple simultaneous requests
//     if (controller.isLoadingbtn) return;
//
//     // Check if more data is available and load accordingly
//     switch (widget.type) {
//       case CashInSettingType.contact:
//         if (controller.contactCurrentPage < controller.contactLastPage) {
//           controller.loadContactNextPage();
//         }
//         break;
//       case CashInSettingType.category:
//         if (controller.currentPage < controller.lastPage) {
//           controller.loadNextPage();
//         }
//         break;
//       case CashInSettingType.payment:
//         if (controller.paymentCurrentPage < controller.paymentLastPage) {
//           controller.loadPaymentNextPage();
//         }
//         break;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: widget.height,
//       child: GetBuilder<BookController>(
//         builder: (controller) {
//           // Get dynamic data based on type
//           List<String> dynamicItems = [];
//           List<String?>? dynamicSubtitles = [];
//           bool hasMoreData = false;
//
//           switch (widget.type) {
//             case CashInSettingType.contact:
//               dynamicItems = controller.contactPerList.map((e) => e.name!).toList();
//               dynamicSubtitles = controller.contactPerList.map((e) => e.mobileNo!).toList();
//               hasMoreData = controller.contactCurrentPage < controller.contactLastPage;
//               break;
//             case CashInSettingType.category:
//               dynamicItems = controller.categoryList.map((e) => e.name!).toList();
//               dynamicSubtitles = null;
//               hasMoreData = controller.currentPage < controller.lastPage;
//               break;
//             case CashInSettingType.payment:
//               dynamicItems = controller.paymentMethodList.map((e) => e.name!).toList();
//               dynamicSubtitles = null;
//               hasMoreData = controller.paymentCurrentPage < controller.paymentLastPage;
//               break;
//           }
//
//           return Column(
//             children: [
//               // Header
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         widget.title,
//                         style: const TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.close, color: Colors.black54),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ],
//                 ),
//               ),
//               const Divider(height: 1),
//
//               // Scrollable content with pagination
//               Expanded(
//                 child: dynamicItems.isEmpty && !controller.isLoadingbtn
//                     ? const Center(
//                   child: Text(
//                     'No items found',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 )
//                     : CustomScrollView(
//                   controller: _scrollController,
//                   slivers: [
//                     // Grid items
//                     SliverPadding(
//                       padding: const EdgeInsets.all(14),
//                       sliver: SliverGrid(
//                         delegate: SliverChildBuilderDelegate(
//                               (context, index) {
//                             return CustomCard(
//                               title: dynamicItems[index],
//                               subtitle: (dynamicSubtitles != null &&
//                                   index < dynamicSubtitles.length)
//                                   ? (dynamicSubtitles[index]?.isEmpty ?? true
//                                   ? "No phone"
//                                   : dynamicSubtitles[index])
//                                   : null,
//                               onDelete: () => widget.onDelete(dynamicItems[index]),
//                               onEdit: () => widget.onEdit(dynamicItems[index]),
//                             );
//                           },
//                           childCount: dynamicItems.length,
//                         ),
//                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           mainAxisSpacing: 12,
//                           crossAxisSpacing: 12,
//                           childAspectRatio: 1.5,
//                         ),
//                       ),
//                     ),
//
//                     // Loading indicator at bottom
//                     if (controller.isLoadingbtn)
//                       const SliverToBoxAdapter(
//                         child: Padding(
//                           padding: EdgeInsets.all(20),
//                           child: Center(
//                             child: Column(
//                               children: [
//                                 SizedBox(
//                                   width: 24,
//                                   height: 24,
//                                   child: CircularProgressIndicator(strokeWidth: 2),
//                                 ),
//                                 SizedBox(height: 8),
//                                 Text(
//                                   'Loading more...',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//
//                     // End of data indicator
//                     if (!controller.isLoadingbtn && !hasMoreData && dynamicItems.isNotEmpty)
//                       const SliverToBoxAdapter(
//                         child: Padding(
//                           padding: EdgeInsets.all(20),
//                           child: Center(
//                             child: Text(
//                               'No more items',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//
//               // Add new button
//               if (widget.onAddNew != null)
//                 SafeArea(
//                   top: false,
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(16, 6, 16, 12),
//                     child: ElevatedButton(
//                       onPressed: widget.onAddNew,
//                       child: const Text('+ Add New'),
//                     ),
//                   ),
//                 ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// /// Helper function to show the bottom sheet
// Future<void> showCustomBottomSheet({
//   required BuildContext context,
//   required String title,
//   required List<String> items,
//   required void Function(String) onDelete,
//   required void Function(String) onEdit,
//   VoidCallback? onAddNew,
//   double height = 500,
//   List<String?>? subtitles,
//   required CashInSettingType type,
// }) async {
//   await showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//     ),
//     backgroundColor: Colors.white,
//     builder: (ctx) {
//       return CustomBottomSheet(
//         title: title,
//         items: items,
//         onDelete: onDelete,
//         onEdit: onEdit,
//         onAddNew: onAddNew,
//         height: height,
//         subtitles: subtitles,
//         type: type,
//       );
//     },
//   );
// }

//final 3
import 'package:cash_books/core/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import 'custom_card.dart';
import 'package:cash_books/features/book/controllers/book_controller.dart';

/// Custom Bottom Sheet Widget with Scroll-Only Pagination
class CustomBottomSheet extends StatefulWidget {
  final String title;
  final List<String> items;
  final List<String?>? subtitles;
  final void Function(String) onDelete;
  final void Function(String) onEdit;
  final VoidCallback? onAddNew;
  final double height;
  final CashInSettingType type;

  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.items,
    required this.onDelete,
    required this.onEdit,
    required this.type,
    this.onAddNew,
    this.height = 500,
    this.subtitles,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Trigger load more when user scrolls near the bottom (200px before end)
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMoreIfNeeded();
    }
  }

  void _loadMoreIfNeeded() {
    final controller = Get.find<BookController>();

    // Prevent multiple simultaneous requests
    if (controller.isLoadingbtn) return;

    // Check if more data is available and load accordingly
    switch (widget.type) {
      case CashInSettingType.contact:
        if (controller.contactCurrentPage < controller.contactLastPage) {
          print('Loading more contacts: ${controller.contactCurrentPage}/${controller.contactLastPage}');
          controller.loadContactNextPage();
        }
        break;
      case CashInSettingType.category:
        if (controller.currentPage < controller.lastPage) {
          print('Loading more categories: ${controller.currentPage}/${controller.lastPage}');
          controller.loadNextPage();
        }
        break;
      case CashInSettingType.payment:
        if (controller.paymentCurrentPage < controller.paymentLastPage) {
          print('Loading more payments: ${controller.paymentCurrentPage}/${controller.paymentLastPage}');
          controller.loadPaymentNextPage();
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: GetBuilder<BookController>(
        builder: (controller) {
          // Get dynamic data based on type
          List<String> dynamicItems = [];
          List<String?>? dynamicSubtitles = [];
          bool hasMoreData = false;

          switch (widget.type) {
            case CashInSettingType.contact:
              dynamicItems = controller.contactPerList.map((e) => e.name!).toList();
              dynamicSubtitles = controller.contactPerList.map((e) => e.mobileNo!).toList();
              hasMoreData = controller.contactCurrentPage < controller.contactLastPage;
              break;
            case CashInSettingType.category:
              dynamicItems = controller.categoryList.map((e) => e.name!).toList();
              dynamicSubtitles = null;
              hasMoreData = controller.currentPage < controller.lastPage;
              break;
            case CashInSettingType.payment:
              dynamicItems = controller.paymentMethodList.map((e) => e.name!).toList();
              dynamicSubtitles = null;
              hasMoreData = controller.paymentCurrentPage < controller.paymentLastPage;
              break;
          }

          return Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
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

              // Scrollable content with pagination
              Expanded(
                child: dynamicItems.isEmpty && !controller.isLoadingbtn
                    ? const Center(
                  child: Text(
                    'No items found',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                )
                    : CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    // Grid items
                    SliverPadding(
                      padding: const EdgeInsets.all(14),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            return CustomCard(
                              title: dynamicItems[index],
                              subtitle: (dynamicSubtitles != null &&
                                  index < dynamicSubtitles.length)
                                  ? (dynamicSubtitles[index]?.isEmpty ?? true
                                  ? "No phone"
                                  : dynamicSubtitles[index])
                                  : null,
                              onDelete: () => widget.onDelete(dynamicItems[index]),
                              onEdit: () => widget.onEdit(dynamicItems[index]),
                            );
                          },
                          childCount: dynamicItems.length,
                        ),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 1.5,
                        ),
                      ),
                    ),

                    // Loading indicator at bottom
                    if (controller.isLoadingbtn)
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Center(
                            child: Column(
                              children: [
                                LinearProgressIndicator(
                                  // backgroundColor: Colors.grey[300],
                                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.themeColor),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Loading more...',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    // End of data indicator
                    if (!controller.isLoadingbtn && !hasMoreData && dynamicItems.isNotEmpty)
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Center(
                            child: Text(
                              'No more items',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Add new button
              if (widget.onAddNew != null)
                SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 6, 16, 12),
                    child: ElevatedButton(
                      onPressed: widget.onAddNew,
                      child: const Text('+ Add New'),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
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
  required CashInSettingType type,
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
        subtitles: subtitles,
        type: type,
      );
    },
  );
}
/*


import 'package:cash_books/core/enums/enums.dart';
import 'package:flutter/material.dart';
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
  List<String?>? subtitles, required CashInSettingType type,
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
        subtitles: subtitles, //  FIXED

      );
    },
  );
}
*/
