import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/home/controllers/home_controller.dart';
import 'package:cash_books/features/home/ui/screens/add_new_business_screen.dart';
import 'package:cash_books/features/businessteam/business_team_screen.dart';
import 'package:cash_books/features/home/ui/screens/update_business_screen.dart';
import 'package:cash_books/features/home/ui/widgets/book_card.dart';
import 'package:cash_books/features/home/ui/widgets/business_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get.dart' as g;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _createBookTEController = TextEditingController();
  final ScrollController _scrollController = ScrollController(); // [1] ScrollController added
  bool _isScrollingDown = false;// [2] Track scroll direction
  //final AllBusinessController allBusinessController = Get.find();



  // @override
  // void initState() {
  //   super.initState();
  //
  //
  //   // if(Get.find<HomeController>().businessList.isEmpty){
  //   //   g.Get.offAll(AddNewBusinessScreen());
  //   // }
  //
  //
  //
  //   _scrollController.addListener(() {
  //     if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
  //       if (!_isScrollingDown) {
  //         setState(() {
  //           _isScrollingDown = true;
  //         });
  //       }
  //     } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
  //       if (_isScrollingDown) {
  //         setState(() {
  //           _isScrollingDown = false;
  //         });
  //       }
  //     }
  //   });
  // }
  @override
  void initState() {
    super.initState();

    final controller = Get.find<HomeController>();

    // all business lode
    controller.allBusiness().then((_) {
      // if businessList not empty
      if (controller.businessList.isNotEmpty) {
        // selected business ID
        int selectedBusinessId = controller.businessList[controller.selectedBusinessIndex].id!;

        // selected id dya allBusiness call
        controller.allBook(businessId: selectedBusinessId, page: 1);
      } else {
        // business jodi empty hoi
        g.Get.offAll(AddNewBusinessScreen());
      }
    });

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
                  Get.find<HomeController>().allBusiness();

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
          GetBuilder<HomeController>(
            builder: (controller) {
              return ListView(
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
                  itemCount: controller.bookList.length,
                  itemBuilder: (context, index) {
                    final book = controller.bookList[index];
                    return  BookCard(book: book,);
                  },
                ),
                 SizedBox(height: 50.h),
              ],
                      );
            }
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
              height: 350.h,
              width: double.maxFinite,
              child: Form(
                key: _formKey,
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
                      controller: _createBookTEController,
                      decoration: const InputDecoration(
                          hintText: 'Enter Book name',
                          prefixIcon: Icon(
                            Icons.email_outlined,
                           // color: Colors.grey,
                          )),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Enter your book name';
                        }
                        return null;
                      },
                    ),
                     SizedBox(height: 60.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ElevatedButton(
                            onPressed: () {
                              if(_formKey.currentState!.validate()){
                                final controller = Get.find<HomeController>();
                                int selectedBusinessId = controller.businessList[controller.selectedBusinessIndex].id!;
                                controller.createNewBook(name: _createBookTEController.text.trim(), balance: 0.00, id: selectedBusinessId);
                                Navigator.pop(context);
                              }

                            },
                            child: const Text('Add NEW BOOK'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return GetBuilder<HomeController>(
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, color: AppColors.themeColor),
                      ),
                      Text(
                        'Select Business',
                        style: AppTextStyles.bodyMediumWhite(color: AppColors.themeColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.businessList.length,
                      itemBuilder: (context, index) {
                        final business = controller.businessList[index];
                        return BusinessListTile(
                          title: business.name ?? '',
                          subtitle: business.createdAt ?? '',
                          isSelected: controller.selectedBusinessIndex == index,
                          onTap: () {
                            // Select the business
                            controller.selectBusiness(index);

                            // Fetch books for this selected business
                            controller.allBook(
                              businessId: business.id!,
                              page: 1,
                            );

                            Navigator.pop(context); // Close modal
                          },
                          onDelete: () {
                            _showDeleteAlertDialog(context, business.id!);
                          },
                          onEdit: () {
                            Get.off(() => UpdateBusinessScreen(
                              businessId: business.id!,
                              initialName: business.name ?? '',
                              status: business.status ?? 0,
                            ));
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Get.off(AddNewBusinessScreen());
                      },
                      icon: const Icon(Icons.add),
                      label: Text(
                        "Add New Business",
                        style: AppTextStyles.bodyMediumPopins(),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.themeColor,
                        minimumSize: Size.fromHeight(48.h),
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




  // void _showBusinessSelector(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
  //     ),
  //     builder: (context) {
  //       return GetBuilder<AllBusinessController>(
  //         builder: (controller) {
  //           return Padding(
  //             padding: EdgeInsets.all(16.w),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Row(
  //                   children: [
  //                     IconButton(
  //                       onPressed: () => Navigator.pop(context),
  //                       icon: const Icon(Icons.close, color: AppColors.themeColor),
  //                     ),
  //                     Text(
  //                       'Select Business',
  //                       style: AppTextStyles.bodyMediumWhite(color: AppColors.themeColor),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(height: 10.h),
  //
  //                 controller.isLoading
  //                     ? const Center(child: CircularProgressIndicator())
  //                     : controller.businessList.isEmpty
  //                     ? const Text("No businesses found")
  //                     : SizedBox(
  //                   height: 300.h, // fixed height for scrollable list
  //                   child: ListView.builder(
  //                     itemCount: controller.businessList.length,
  //                     itemBuilder: (context, index) {
  //                       final business = controller.businessList[index];
  //                       return ListTile(
  //                         title: Text(business.name ?? 'No Name'),
  //                         subtitle: Text(business.createdAt ?? 'No Phone'),
  //                         onTap: () {
  //                           // You can handle tap here
  //                         },
  //                       );
  //                     },
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  Future<void> _showDeleteAlertDialog(BuildContext context,int businessId) {
    return showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          'Are you sure you want Delete Business?',
          style: AppTextStyles.bodyMedium(color: Colors.black87),
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _dialogButton(
                label: 'Cancel',
                color: Colors.green,
                background: Colors.green.shade100,
                onPressed: () => Navigator.pop(context),
              ),
               _dialogButton(
                    label: 'Delete',
                    color: Colors.red,
                    background: Colors.red.shade100,
                    onPressed: () {

                      Get.find<HomeController>().deleteBusiness(businessId );

                    },


              ),
            ],
          ),
        ],
        elevation: 6,
      ),
    );
  }

  Widget _dialogButton({
    required String label,
    required Color color,
    required Color background,
    required VoidCallback onPressed,
    bool expand = false,
  }) {
    final btn = TextButton(
      style: TextButton.styleFrom(
        backgroundColor: background,
        foregroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );

    return expand ? SizedBox(width: double.infinity, child: btn) : btn;
  }



  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
