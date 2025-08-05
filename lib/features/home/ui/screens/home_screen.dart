import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/home/ui/screens/add_new_business_screen.dart';
import 'package:cash_books/features/businessteam/business_team_screen.dart';
import 'package:cash_books/features/home/ui/widgets/book_card.dart';
import 'package:cash_books/features/home/ui/widgets/business_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController(); // [1] ScrollController added
  bool _isScrollingDown = false;// [2] Track scroll direction

  List<Map<String, String>> businesses = [
    {"title": "Top Man", "subtitle": "Your Role: Member"},
    {"title": "New Project", "subtitle": "Your Role: Owner"},
    {"title": "Home Expense", "subtitle": "Your Role: Admin"},
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!_isScrollingDown) {
          setState(() {
            _isScrollingDown = true;
          });
        }
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (_isScrollingDown) {
          setState(() {
            _isScrollingDown = false;
          });
        }
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: Row(
          children: [
            const Icon(Icons.business_outlined,color: Colors.white,),
             SizedBox(width: 8.w),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _showBusinessSelector(context);
                },
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top Man',
                      style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold,
                     color: Colors.white ),maxLines: 1,overflow: TextOverflow.ellipsis,

                    ),
                    Text(
                      'Tap to switch business',
                      style: TextStyle(fontSize: 12.sp,color: Colors.white54)
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, BusinessTeamScreen.name);
              },
              icon: const Icon(Icons.person_add_alt,color: Colors.white,),
            ),
          ],
        ),
      ),
      body:
          ListView(
          controller: _scrollController, // [3] Attach controller here
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 15.w, right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    'Your Books',
                    style: AppTextStyles.titleSmall(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.themeColor,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const BookCard();
              },
            ),
             SizedBox(height: 50.h),
          ],
        ),

      floatingActionButton: AnimatedSwitcher( // [4] Animated FAB
        duration: const Duration(milliseconds: 50),
        child: _isScrollingDown
            ? FloatingActionButton(
          key: const ValueKey('iconOnly'),
          onPressed: () {
            _showCustomBottomSheet(context);
          },

          backgroundColor: AppColors.themeColor,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        )
            : FloatingActionButton.extended(
          key: const ValueKey('iconWithText'),
          onPressed: () {
            _showCustomBottomSheet(context);
          },
          label: const Text('Add New Book'),
          icon: const Icon(Icons.add),
          backgroundColor: AppColors.themeColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }

  void _showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Container(
              padding:  EdgeInsets.all(16.w),
              height: 300.h,
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.themeColor,
                        ),
                      ),
                       Text(
                        'Add New Book',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                   Divider(
                    color: Colors.grey,
                    thickness: 2.0.h,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter Book name',
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                        )),
                  ),
                   SizedBox(height: 60.h),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add NEW BOOK'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showBusinessSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        int selectedIndex = 0; // default selection



        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding:  EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close, color: AppColors.themeColor)),
                      Text(
                        'Select Business',
                        style: AppTextStyles.bodyMediumWhite(
                            color: AppColors.themeColor),
                      ),
                    ],
                  ),
                   SizedBox(height: 10.h),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: businesses.length,
                      itemBuilder: (context, index) {
                        return BusinessListTile(
                          title: businesses[index]['title']!,
                          subtitle: businesses[index]['subtitle']!,
                          isSelected: selectedIndex == index,
                          onTap: () {
                            setState(() => selectedIndex = index);
                            //Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                   SizedBox(height: 12.h),
                  Padding(
                    padding:  EdgeInsets.only(bottom: 20.h,),
                    child: ElevatedButton.icon(
                      onPressed: () {Navigator.pushNamed(context, AddNewBusinessScreen.name);},
                      icon: const Icon(Icons.add),
                      label:  Text("Add New Business",style: AppTextStyles.bodyMediumPopins(),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.themeColor,
                        minimumSize:  Size.fromHeight(48.h),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
