import 'package:cash_books/core/theme/app_colors.dart';
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
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              '20000',
              style: TextStyle(color: AppColors.themeColor),
            ),
            //const SizedBox(width: 10),
            _showEditBook(context),
          ],
        ),
        leading: const CircleAvatar(
            radius: 20, child: Icon(Icons.book, color: AppColors.themeColor)),
        title: const Text('Title will be here'),
        subtitle: const Text('subtitle'),
      ),
    );
  }

  PopupMenuButton<String> _showEditBook(context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {
        if (value == 'rename') {
          _showRenameCashbook(context);
        } else if (value == 'duplicate') {
        } else if (value == 'add_members') {
        } else if (value == 'move') {
        } else if (value == 'delete') {
          _showDeleteAlertDialog(context);
        }
      },
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<String>(
          value: 'rename',
          child: ListTile(
            leading: Icon(Icons.edit),
            title: Text('Rename'),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'duplicate',
          child: ListTile(
            leading: Icon(Icons.copy),
            title: Text('Duplicate Book'),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'add_members',
          child: ListTile(
            leading: Icon(Icons.person_add),
            title: Text('Add Members'),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'move',
          child: ListTile(
            leading: Icon(Icons.arrow_right_alt),
            title: Text('Move Book'),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'delete',
          child: ListTile(
            leading: Icon(Icons.delete, color: Colors.red),
            title: Text('Delete Book'),
          ),
        ),
      ],
    );
  }

  Future<dynamic> _showDeleteAlertDialog(context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Are you sure you want to delete this book?',
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
                        const Text(
                          'Rename Cashbook',
                          style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                   TextFormField(
                     controller: _renameCashBookTEController,
                     textInputAction: TextInputAction.done,
                     decoration: const InputDecoration(labelText: 'Business Name'),
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
