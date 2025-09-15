

import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/book/controllers/book_controller.dart';
import 'package:cash_books/features/book/model/TransactionHistoryResponse.dart';
import 'package:cash_books/features/book/ui/screens/add_cash_in_entry_screen.dart';
import 'package:cash_books/features/book/ui/screens/add_cash_out_entry_screen.dart';
import 'package:cash_books/features/book/ui/screens/transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../book/model/SpecificBookDetailsRespons.dart';
import '../../../home/model/BookResponse.dart';

class BusinessBookScreen extends StatefulWidget {
  final Book book;
  const BusinessBookScreen({super.key, required this.book});

  static const String name = '/business-book';

  @override
  State<BusinessBookScreen> createState() => _BusinessBookScreenState();
}

class _BusinessBookScreenState extends State<BusinessBookScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Initial data load AFTER build finishes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadInitialData();
    });

    // Setup scroll listener for pagination
    _setupScrollListener();
  }


  void _loadInitialData() {
    final controller = Get.find<BookController>();
    controller.transactionHistory(bookId: widget.book.id!);
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      // Check if user has scrolled to bottom
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {

        final controller = Get.find<BookController>();
        // Load next page if not already loading and has more pages
        if (!controller.isLoadingbtn &&
            controller.historyCurrentPage < controller.historyLastPage) {
          controller.loadHistoryNextPage();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.93),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: AppColors.themeColor,
        title: Text('Business Book', style: AppTextStyles.appbar()),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person_add,
                color: Colors.white70,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white70,
              )),
        ],
      ),
      body: Column(
        children: [
          // Fixed header section
          _buildBalanceCard(),

          // Scrollable transaction list
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await Get.find<BookController>().transactionHistory(bookId: widget.book.id!);
              },
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: _buildPrivacyNotice(),
                  ),
                  SliverToBoxAdapter(
                    child: _buildTransactionHistorySection(),
                  ),
                ],
              ),
            ),
          ),

          // Fixed bottom section
          _showCashInCashOut(),
        ],
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      margin: EdgeInsets.all(16.w),
      child: Card(
        elevation: 6,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Net Balance',
                style: AppTextStyles.bodyMedium(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              FittedBox(
                child: Text(
                  '${widget.book.balance ?? '0.00'}',
                  style: AppTextStyles.bodyMedium(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Total In (+)',
                      style: AppTextStyles.bodyMediumPopins(
                          color: AppColors.themeColor,
                          fontSize: 14.sp),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      '${widget.book.totalCashIn ?? '0.00'}',
                      style: AppTextStyles.bodyMediumPopins(color: Colors.green),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Total Out (-)',
                      style: AppTextStyles.bodyMediumPopins(
                          color: AppColors.themeColor,
                          fontSize: 14.sp),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      ' ${widget.book.totalCashOut ?? '0.00'}',
                      style: AppTextStyles.bodyMediumPopins(color: Colors.red),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('VIEW REPORTS'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrivacyNotice() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.green.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.lock, color: Colors.green, size: 20.w),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              'Only members of this book can see these entries',
              style: AppTextStyles.titleSmall(
                fontSize: 13.sp,
                color: Colors.green[800],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionHistorySection() {
    return GetBuilder<BookController>(
      builder: (controller) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Section Header
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transaction History',
                      style: AppTextStyles.bodyMedium(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.themeColor,
                      ),
                    ),
                    if (controller.transactionList.isNotEmpty)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: AppColors.themeColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          '${controller.transactionList.length}',
                          style: AppTextStyles.titleSmall(
                            fontSize: 12.sp,
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Content based on state
              if (controller.errorMsg.isNotEmpty && controller.transactionList.isEmpty)
                _buildErrorState(controller)
              else if (controller.transactionList.isEmpty && !controller.isLoadingbtn)
                _buildEmptyState()
              else
                _buildTransactionList(controller),
            ],
          ),
        );
      },
    );
  }

  Widget _buildErrorState(BookController controller) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, color: Colors.red, size: 48.w),
            SizedBox(height: 16.h),
            Text(
              'Something went wrong!',
              style: AppTextStyles.bodyMedium(
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              controller.errorMsg,
              style: AppTextStyles.titleSmall(color: Colors.red[700]),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () => _loadInitialData(),
              child: Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(40.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.receipt_long_outlined, color: Colors.grey, size: 64.w),
            SizedBox(height: 16.h),
            Text(
              'No transactions yet',
              style: AppTextStyles.bodyMedium(
                color: Colors.grey[600],
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Start by adding your first\ncash in or cash out entry',
              style: AppTextStyles.titleSmall(
                color: Colors.grey[500],
                fontSize: 13.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionList(BookController controller) {
    return Column(
      children: [
        // Transaction List
        ListView.separated(
          itemCount: controller.transactionList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 8.h),
          itemBuilder: (context, index) {
            final item = controller.transactionList[index];
            return _buildTransactionCard(item);
          },
        ),

        // Loading indicator for pagination
        if (controller.isLoadingbtn) ...[
          SizedBox(height: 16.h),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LinearProgressIndicator(
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.themeColor),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Loading more transactions...',
                    style: AppTextStyles.titleSmall(
                      color: Colors.grey[600],
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],

        // End of list indicator
        if (!controller.isLoadingbtn &&
            controller.historyCurrentPage >= controller.historyLastPage &&
            controller.transactionList.isNotEmpty) ...[
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey[300],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'End of transactions',
                    style: AppTextStyles.titleSmall(
                      color: Colors.grey[500],
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
        ],

        // Bottom spacing
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _buildTransactionCard(TransactionItem item) {
    final isIncome = item.type == 1;
    return Card(
      elevation: 2,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            TransactionDetails.name,
            arguments: {
              'book': widget.book,
              'selectedId': item.id,
              'bookId': item.bookId,
            },
          );
        },

        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        title: Text(
          ' ${item.category?.name ?? 'Unknown'}',
          style: AppTextStyles.bodyMediumPopins(color: AppColors.themeColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            Text(
              item.optDate != null
                  ? (() {
                final date = DateTime.tryParse(item.optDate!);
                if (date != null) {
                  final day = date.day.toString().padLeft(2, '0');
                  final month = date.month.toString().padLeft(2, '0');
                  final year = date.year.toString();
                  return "$day/$month/$year";
                } else {
                  return "N/A";
                }
              })()
                  : 'N/A',
              style: AppTextStyles.subtitleSmall(color: Colors.black87),
            ),

            // Text(
            //   ' ${item.optDate ?? 'N/A'}',
            //   style: AppTextStyles.subtitleSmall(color: Colors.black87),
            // ),
            // if (item.remarks != null && item.remarks!.isNotEmpty) ...[
            //   SizedBox(height: 2.h),
            //   Text(
            //     ' ${item.remarks}',
            //     style: AppTextStyles.subtitleSmall(
            //       color: Colors.grey[600],
            //       fontSize: 12.sp,
            //     ),
            //     maxLines: 1,
            //     overflow: TextOverflow.ellipsis,
            //   ),
            // ],
          ],
        ),
        trailing: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: isIncome ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  isIncome ? 'Cash In' : 'Cash Out',
                  style: AppTextStyles.titleSmall(
                    color: isIncome ? Colors.green : Colors.red,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  '${item.amount ?? '0.00'}',
                  style: AppTextStyles.subtitleSmall(
                    color: isIncome ? Colors.green : Colors.red,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _showCashInCashOut() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Record Income',
                  style: AppTextStyles.bodyMediumWhite(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Record Expense',
                  style: AppTextStyles.bodyMediumWhite(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AddCashInEntryScreen.name,
                        arguments: widget.book,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    icon: Icon(Icons.add, size: 18.w),
                    label: Text(
                      'CASH IN',
                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AddCashOutEntryScreen.name,
                        arguments: widget.book,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    icon: Icon(Icons.remove, size: 18.w),
                    label: Text(
                      'CASH OUT',
                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}