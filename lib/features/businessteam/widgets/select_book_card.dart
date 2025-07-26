import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SelectBookCard extends StatefulWidget {
  final int index;
  final int? selectedIndex;
  final Function(int) onSelected;

  const SelectBookCard({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  State<SelectBookCard> createState() => _SelectBookCardState();
}

class _SelectBookCardState extends State<SelectBookCard> {
  String selectedRole = "Data Operator"; // আসল Role
  String tempRole = "Data Operator"; // BottomSheet এর টেম্পোরারি Role

  @override
  Widget build(BuildContext context) {
    bool isChecked = widget.selectedIndex == widget.index;

    return GestureDetector(
      onTap: () {},
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
                'Role:',
                style: AppTextStyles.titleSmall(fontSize: 10, color: Colors.black54),
              ),
              _showBusinessBook(context),
            ],
          ),
          leading: Checkbox(
              activeColor: AppColors.themeColor,
              checkColor: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              value: isChecked,
              onChanged: (bool? value) {
                widget.onSelected(widget.index);
              }),
          title: Text('Business book', style: AppTextStyles.titleSmall()),
        ),
      ),
    );
  }

  PopupMenuButton<String> _showBusinessBook(context) {
    return PopupMenuButton<String>(
      child: Row(
        children: [
          Text(
            selectedRole,
            style: AppTextStyles.titleSmall(fontSize: 12),
          ),
          const Icon(
            Icons.arrow_downward,
            color: AppColors.themeColor,
            size: 14,
          )
        ],
      ),
      onSelected: (value) {
        tempRole = value;
        if (value == 'Admin') {
          _buildAdminBottomSheet(context);
        } else if (value == 'Data Operator') {
          _buildDataOperatorBottomSheet(context);
        } else if (value == 'Viewer') {
          _buildViewerBottomSheet(context);
        }
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          value: 'Admin',
          child: ListTile(
            leading: const Icon(Icons.admin_panel_settings_outlined, color: AppColors.themeColor),
            title: Text('Admin', style: AppTextStyles.titleSmall()),
          ),
        ),
        PopupMenuItem<String>(
          value: 'Data Operator',
          child: ListTile(
            leading: const Icon(Icons.dataset_linked, color: AppColors.themeColor),
            title: Text('Data Operator', style: AppTextStyles.titleSmall()),
          ),
        ),
        PopupMenuItem<String>(
          value: 'Viewer',
          child: ListTile(
            leading: const Icon(Icons.remove_red_eye_outlined, color: AppColors.themeColor),
            title: Text('Viewer', style: AppTextStyles.titleSmall()),
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
                  Text(
                    "Choose Role of name",
                    style: AppTextStyles.titleSmall(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),

              // User Info Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text('Book:',style: AppTextStyles.titleSmall(color: Colors.black54),),
                    Text(" Business Book",style:AppTextStyles.titleSmall(),)],
                ),
              ),

              const SizedBox(height: 10),
              const Divider(),

              // Permissions Section
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 12, bottom: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Admin Permissions",
                      style: AppTextStyles.bodyMediumWhite(color: AppColors.themeColor,fontWeight: FontWeight.bold)),
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
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 12, bottom: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Restrictions",
                    style: AppTextStyles.bodyMediumWhite(color: AppColors.themeColor,fontWeight: FontWeight.bold),),
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
                  onPressed: () {
                    selectedRole = tempRole;
                    setState(() {});
                    Navigator.pop(context);
                  },
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
                    Text(
                        "Choose Role of name",
                        style:
                        AppTextStyles.titleSmall(fontSize: 18,fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),

                // User Info Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text('Book:',style: AppTextStyles.titleSmall(color: Colors.black54),), Text(" Business Book",style: AppTextStyles.titleSmall(),)],
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
                    onPressed: () {
                      selectedRole = tempRole;
                      setState(() {});
                      Navigator.pop(context);
                    },
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
                    Text(
                        "Choose Role of name",
                        style:
                        AppTextStyles.titleSmall(fontSize: 18,fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),

                // User Info Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text('Book:',style: AppTextStyles.titleSmall(color: Colors.black54),), Text(" Business Book",style: AppTextStyles.titleSmall(),)],
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
                    onPressed: () {
                      selectedRole = tempRole;
                      setState(() {});
                      Navigator.pop(context);
                    },
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
          Expanded(
            child: Text(text,
                style: AppTextStyles.titleSmall(color: Colors.black54, fontWeight: FontWeight.w300)),
          ),
        ],
      ),
    );
  }


}
