import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/widgets/select_book_card.dart';
import 'package:cash_books/features/home/controllers/home_controller.dart';
import 'package:cash_books/features/home/model/BookResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MemberAddToSelectBook extends StatefulWidget {
  final int businessId;
  final int userId;
  const MemberAddToSelectBook({super.key, required this.businessId, required this.userId});

  static const String name = '/member-add-to-select-book';

  @override
  State<MemberAddToSelectBook> createState() => _MemberAddToSelectBookState();
}

class _MemberAddToSelectBookState extends State<MemberAddToSelectBook> {

  int? selectedIndex;
  final HomeController homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeController.allBook(businessId: widget.businessId, page: 1);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.93),
      //resizeToAvoidBottomInset: false,
      // extendBodyBehindAppBar: true,
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
        elevation: 6,
        title:  Text(
          'Add to book',
          style: AppTextStyles.appbar(),
        ),
      ),
      body: Padding(
          padding:  EdgeInsets.only(bottom: 16.h),
          child: Column(
            children: [
              GetBuilder<HomeController>(
                builder: (controller) {

                  final books = controller.bookList;
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: books.length,
                            itemBuilder: (context, index) {
                              final book = books[index];
                              return  SelectBookCard(
                                selectedIndex: selectedIndex,
                                index: index,
                                onSelected: (i){
                                  selectedIndex = i;
                                  setState(() {});
                                }, book: book,
                              );
                            },
                          ),

                        ],
                      ),
                    ),
                  );
                }
              ),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: const Text('Add TO BOOK'),
                    ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
