import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/add_team_member_screen.dart';
import 'package:cash_books/features/book/ui/screens/business_book_screen.dart';
import 'package:cash_books/features/home/ui/screens/move_book_screen.dart';
import 'package:flutter/material.dart';

class BookCard extends StatefulWidget {
  const BookCard({super.key});

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
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               Text(
                '20000',
                style: AppTextStyles.titleSmall(fontSize: 12),
              ),
              //const SizedBox(width: 10),
              _showEditBook(context),
            ],
          ),
          leading: const CircleAvatar(
              radius: 20, child: Icon(Icons.book, color: AppColors.themeColor)),
          title:  Text('Business Book',style: AppTextStyles.titleSmall(),),
          subtitle:  Text('created on jul 01 2025',style: AppTextStyles.subtitleSmall(),),
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
          style: AppTextStyles.bodyMedium(),
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
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
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
