import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/add_team_member_screen.dart';
import 'package:cash_books/features/book/ui/screens/business_book_screen.dart';
import 'package:cash_books/features/home/ui/screens/move_book_screen.dart';
import 'package:flutter/material.dart';

class SelectBookCard extends StatefulWidget {
  const SelectBookCard({super.key});

  @override
  State<SelectBookCard> createState() => _SelectBookCardState();
}

class _SelectBookCardState extends State<SelectBookCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _renameCashBookTEController =
      TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
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
                'Role:',
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              //const SizedBox(width: 10),
              _showBusinessBook(context),
            ],
          ),
          leading: Checkbox(
              activeColor: AppColors.themeColor,
              checkColor: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5))),
              value: isChecked,
              onChanged: (bool? value) {
                isChecked = value!;
                setState(() {});
              }),
          title: const Text('Business book'),
        ),
      ),
    );
  }

  PopupMenuButton<String> _showBusinessBook(context) {
    return PopupMenuButton<String>(
      child: const Row(
        children: [
          Text(
            'Data Operator',
            style: TextStyle(color: AppColors.themeColor, fontSize: 12),
          ),
          Icon(
            Icons.arrow_downward,
            color: AppColors.themeColor,
            size: 14,
          )
        ],
      ),
      onSelected: (value) {
        if (value == 'Admin') {
          _buildAdminBottomSheet(context);
        } else if (value == 'Data Operator') {
          _buildDataOperatorBottomSheet(context);
        } else if (value == 'Viewer') {
          _buildViewerBottomSheet(context);

        }
      },
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<String>(
          value: 'Admin',
          child: ListTile(
            leading: Icon(Icons.admin_panel_settings_outlined),
            title: Text('Admin'),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Data Operator',
          child: ListTile(
            leading: Icon(Icons.dataset_linked),
            title: Text('Data Operator'),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Viewer',
          child: ListTile(
            leading: Icon(Icons.remove_red_eye_outlined),
            title: Text('Viewer'),
          ),
        ),
      ],
    );
  }

  Future<dynamic> _buildAdminBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: AppColors.themeColor,
                      )),
                  const Text(
                    "Choose Role of name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),

              // User Info Row
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text('Book:'), Text(" Business Book")],
                ),
              ),

              const SizedBox(height: 10),
              const Divider(),

              // Permissions Section
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 12, bottom: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Admin Permissions",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              _infoTile(Icons.check_circle, "View entries and download reports",
                  Colors.green),
              _infoTile(Icons.check_circle, "Add Cash In or Cash Out entries",
                  Colors.green),
              _infoTile(
                  Icons.check_circle, "Edit and delete entries", Colors.green),
              _infoTile(Icons.check_circle, "Access to all Book Settings",
                  Colors.green),
              _infoTile(
                  Icons.check_circle,
                  "Move or copy entries from one book to other book",
                  Colors.green),
              _infoTile(Icons.check_circle,
                  "Access Book Active and Entry's Edit History", Colors.green),

              // Restrictions Section
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 12, bottom: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Restrictions",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              _infoTile(
                  Icons.cancel,
                  "Can’t Rename/Duplicate/Delete book/Delete All entries ",
                  Colors.red),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                  ),
                  onPressed: () {},
                  child: const Text("UPDATE"),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _buildDataOperatorBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.themeColor,
                        )),
                    const Text(
                      "Choose Role of name",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),

                // User Info Row
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text('Book:'), Text(" Business Book")],
                  ),
                ),

                const SizedBox(height: 10),
                const Divider(),

                // Permissions Section
                const Padding(
                  padding: EdgeInsets.only(left: 16, top: 12, bottom: 4),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Data Operator Permissions",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                _infoTile(Icons.check_circle, "View entries by everyone",
                    Colors.green),
                _infoTile(Icons.check_circle, "Add Cash In or Cash Out entries",
                    Colors.green),
                _infoTile(Icons.check_circle,
                    "View net balance & download PDF or Excel", Colors.green),
                const SizedBox(height: 5),
                const Divider(),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: Text(
                          'You can add additional restriction for data operator role from book settings',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                    ),
                    onPressed: () {},
                    child: const Text("UPDATE"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _buildViewerBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.themeColor,
                        )),
                    const Text(
                      "Choose Role of name",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),

                // User Info Row
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text('Book:'), Text(" Business Book")],
                  ),
                ),

                const SizedBox(height: 10),
                const Divider(),

                // Permissions Section
                const Padding(
                  padding: EdgeInsets.only(left: 16, top: 12, bottom: 4),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("View Permissions",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                _infoTile(Icons.check_circle, "View entries by everyone",
                    Colors.green),
                _infoTile(Icons.check_circle, "View net balance & download PDF or Excel",
                    Colors.green),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                    ),
                    onPressed: () {},
                    child: const Text("UPDATE"),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _infoTile(IconData icon, String text, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 12),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
