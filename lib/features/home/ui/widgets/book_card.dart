import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/add_team_member_screen.dart';
import 'package:cash_books/features/book/ui/screens/business_book_screen.dart';
import 'package:cash_books/features/home/ui/screens/move_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../model/BookResponse.dart';

class BookCard extends StatefulWidget {
  final Book book; // Book model
  const BookCard({Key? key, required this.book}) : super(key: key);
  //const BookCard({super.key});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _renameCashBookTEController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, BusinessBookScreen.name);
      },
      child: Card(
        margin:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: ListTile(
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               Text(
                widget.book.balance ?? '0.00',
                style: AppTextStyles.titleSmall(fontSize: 12.sp),
              ),
              //const SizedBox(width: 10),
              _showEditBook(context),
            ],
          ),
          leading:  CircleAvatar(
              radius: 20.r, child: const Icon(Icons.book, color: AppColors.themeColor)),
          title:  Text(widget.book.name ?? 'Unknown Book',style: AppTextStyles.titleSmall(),),
          subtitle:  Text('Created on ${widget.book.createdAt != null ? widget.book.createdAt!.substring(0, 10) : '-'}',style: AppTextStyles.subtitleSmall(),),
        ),
      ),
    );
  }

  PopupMenuButton<String> _showEditBook(context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {
        if (value == 'rename') {
          _showRenameCashbook(context);
        } else if (value == 'add_members') {
          Navigator.pushNamed(context, AddTeamMemberScreen.name);
        } else if (value == 'move') {
          Navigator.pushNamed(context, MoveBookScreen.name);
        } else if (value == 'delete') {
          _showDeleteAlertDialog(context);
        }
      },
      itemBuilder: (BuildContext context) => [
         PopupMenuItem<String>(
          value: 'rename',
          child: ListTile(
            leading: const Icon(Icons.edit,color: AppColors.themeColor,),
            title: Text('Rename',style: AppTextStyles.titleSmall(),),
          ),
        ),
         PopupMenuItem<String>(
          value: 'add_members',
          child: ListTile(
            leading: const Icon(Icons.person_add,color: AppColors.themeColor,),
            title: Text('Add Members',style: AppTextStyles.titleSmall(),),
          ),
        ),
         PopupMenuItem<String>(
          value: 'move',
          child: ListTile(
            leading: const Icon(Icons.arrow_right_alt,color: Colors.red,),
            title: Text('Move Book',style: AppTextStyles.titleSmall(),),
          ),
        ),
         PopupMenuItem<String>(
          value: 'delete',
          child: ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: Text('Delete Book',style: AppTextStyles.titleSmall(),),
          ),
        ),
      ],
    );
  }

  Future<dynamic> _showDeleteAlertDialog(context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:  Text(
          'Are you sure you want to delete this book?',
          style: AppTextStyles.bodyMedium(color: Colors.black87),
        ),
        actions: [
          Card(
            color: Colors.green.shade100,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Card(
            color: Colors.red.shade100,
            child: TextButton(
              onPressed: () {
                Get.find<HomeController>().deleteBook(
                  businessId: widget.book.businessId ?? 0,
                  bookId: widget.book.id ?? 0,
                );
                Navigator.pop(context);
              },
              child: const Text(
                'Delete',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showRenameCashbook(BuildContext context) {
    _renameCashBookTEController.text = widget.book.name ?? '';
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              key: _formKey,
              child: Padding(
                padding:  EdgeInsets.all(8.0.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                          'Rename Cashbook',
                          style:
                          AppTextStyles.bodyMediumPopins(color: AppColors.themeColor),
                        )
                      ],
                    ),
                     SizedBox(height: 20.h),
                   TextFormField(
                     controller: _renameCashBookTEController,
                     textInputAction: TextInputAction.done,
                     decoration: const InputDecoration(hintText: 'Business Name',prefixIcon: Icon(Icons.drive_file_rename_outline_outlined,color: Colors.grey,)),
                     validator: (String? value) {
                       if (value?.trim().isEmpty ?? true) {
                         return 'Enter your business name';
                       }
                       return null;
                     },
                   ),
                     SizedBox(height: 15.h),
                    ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          Get.find<HomeController>().updateBook(
                            businessId: widget.book.businessId ?? 0,
                            bookId: widget.book.id ?? 0,
                            name: _renameCashBookTEController.text.trim(),
                          );
                            Navigator.pop(context);
                        }

                      },
                      child: const Text('SAVE'),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
