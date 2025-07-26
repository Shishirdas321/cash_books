import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_one.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/widgets/select_book_card.dart';
import 'package:flutter/material.dart';

class MemberAddToSelectBook extends StatefulWidget {
  const MemberAddToSelectBook({super.key});

  static const String name = '/member-add-to-select-book';

  @override
  State<MemberAddToSelectBook> createState() => _MemberAddToSelectBookState();
}

class _MemberAddToSelectBookState extends State<MemberAddToSelectBook> {

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Stack(
        children: [
          const Positioned.fill(child: ScreenBackgroundOne()),
          Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return  SelectBookCard(
                            selectedIndex: selectedIndex,
                            index: index,
                            onSelected: (i){
                              selectedIndex = i;
                              setState(() {});
                            },
                          );
                        },
                      ),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
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
    ],
      ),
    );
  }
}
