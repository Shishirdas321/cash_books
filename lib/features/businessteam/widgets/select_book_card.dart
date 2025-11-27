/*
import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/home/model/BookResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/GetAllBookAccessListUserWishResponse.dart';


class SelectBookCard extends StatefulWidget {
  final int index;
  final int? selectedIndex;
  final Function(int) onSelected;
  final AllBooks book;

  const SelectBookCard({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.onSelected, required this.book,
  });

  @override
  State<SelectBookCard> createState() => _SelectBookCardState();
}

class _SelectBookCardState extends State<SelectBookCard> {
  String selectedRole = "editor"; // real Role
  String tempRole = "editor"; // BottomSheet temp Role

  @override
  Widget build(BuildContext context) {
    bool isChecked = widget.selectedIndex == widget.index;

    return GestureDetector(
      onTap: () {},
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
                'Role:',
                style: AppTextStyles.titleSmall(fontSize: 10.sp, color: Colors.black54),
              ),
              _showBusinessBook(context),
            ],
          ),
          leading: Checkbox(
              activeColor: AppColors.themeColor,
              checkColor: Colors.white,
              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.r),
                      bottomRight: Radius.circular(5.r))),
              value: isChecked,
              onChanged: (bool? value) {
                widget.onSelected(widget.index);
              }),
          title: Text(widget.book.name!, style: AppTextStyles.titleSmall()),
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
            style: AppTextStyles.titleSmall(fontSize: 12.sp),
          ),
           Icon(
            Icons.arrow_downward,
            color: AppColors.themeColor,
            size: 14.sp,
          )
        ],
      ),
      onSelected: (value) {
        tempRole = value;
        if (value == 'Admin') {
          _buildAdminBottomSheet(context);
        } else if (value == 'editor') {
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
          value: 'editor',
          child: ListTile(
            leading: const Icon(Icons.dataset_linked, color: AppColors.themeColor),
            title: Text('editor', style: AppTextStyles.titleSmall()),
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
               SizedBox(height: 16.h),
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
                    style: AppTextStyles.titleSmall(fontSize: 18.sp,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
               SizedBox(height: 10.h),
              const Divider(),

              // User Info Row
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text('Book:',style: AppTextStyles.titleSmall(color: Colors.black54),),
                    Text(" Business Book",style:AppTextStyles.titleSmall(),)],
                ),
              ),

               SizedBox(height: 10.h),
              const Divider(),

              // Permissions Section
              Padding(
                padding:  EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
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
                padding:  EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
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
               SizedBox(height: 16.h),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize:  Size.fromHeight(48.h),
                  ),
                  onPressed: () {
                    selectedRole = tempRole;
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: const Text("UPDATE"),
                ),
              ),
               SizedBox(height: 16.h),
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
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Padding(
          padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding:  EdgeInsets.all(8.0.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 SizedBox(height: 16.h),
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
                        AppTextStyles.titleSmall(fontSize: 18.sp,fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
                 SizedBox(height: 10.h),
                const Divider(),

                // User Info Row
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text('Book:',style: AppTextStyles.titleSmall(color: Colors.black54),), Text(" Business Book",style: AppTextStyles.titleSmall(),)],
                  ),
                ),

                 SizedBox(height: 10.h),
                const Divider(),

                // Permissions Section
                 Padding(
                  padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
                  child: const Align(
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
                 SizedBox(height: 5.h),
                const Divider(),
                 SizedBox(height: 5.h),
                 Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child:  Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: Text(
                          'You can add additional restriction for data operator role from book settings',
                          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.w),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize:  Size.fromHeight(48.h),
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
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Padding(
          padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding:  EdgeInsets.all(8.0.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 SizedBox(height: 16.h),
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
                        AppTextStyles.titleSmall(fontSize: 18.sp,fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
                 SizedBox(height: 10.h),
                const Divider(),

                // User Info Row
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text('Book:',style: AppTextStyles.titleSmall(color: Colors.black54),), Text(" Business Book",style: AppTextStyles.titleSmall(),)],
                  ),
                ),

                 SizedBox(height: 10.h),
                const Divider(),

                // Permissions Section
                 Padding(
                  padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("View Permissions",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                _infoTile(Icons.check_circle, "View entries by everyone",
                    Colors.green),
                _infoTile(Icons.check_circle, "View net balance & download PDF or Excel",
                    Colors.green),
                 SizedBox(height: 16.h),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.w),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize:  Size.fromHeight(48.h),
                    ),
                    onPressed: () {
                      selectedRole = tempRole;
                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: const Text("UPDATE"),
                  ),
                ),
                 SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _infoTile(IconData icon, String text, Color iconColor) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
           SizedBox(width: 12.w),
          Expanded(
            child: Text(text,
                style: AppTextStyles.titleSmall(color: Colors.black54, fontWeight: FontWeight.w300)),
          ),
        ],
      ),
    );
  }


}
*/

/*import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/model/GetAllBookAccessListUserWishResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectBookCard extends StatefulWidget {
  final AllBooks book;
  final int businessId;
  final int userId;

  const SelectBookCard({
    super.key,
    required this.book,
    required this.businessId,
    required this.userId,
  });

  @override
  State<SelectBookCard> createState() => _SelectBookCardState();
}

class _SelectBookCardState extends State<SelectBookCard> {
  String selectedRole = "editor";

  @override
  void initState() {
    super.initState();
    selectedRole = widget.book.role ?? 'editor';
  }

  // Check if book has access
  bool get hasAccess => widget.book.accessStatus == 1 || widget.book.role != null;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        leading: Checkbox(
          activeColor: AppColors.themeColor,
          checkColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.r),
              bottomRight: Radius.circular(5.r),
            ),
          ),
          value: hasAccess,
          onChanged: (bool? value) {
            if (!hasAccess) {
              // Book doesn't have access, show bottom sheet to select role and add
              _showAddToBookBottomSheet(context);
            } else {
              // If book has existing access, show message
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('This book already has access'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
        ),
        title: Text(
          widget.book.name ?? 'Unknown Book',
          style: AppTextStyles.titleSmall(),
        ),
        trailing: hasAccess
            ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Role:',
              style: AppTextStyles.titleSmall(
                fontSize: 10.sp,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 4.w),
            _buildRolePopupMenu(context),
          ],
        )
            : null,
      ),
    );
  }

  PopupMenuButton<String> _buildRolePopupMenu(BuildContext context) {
    return PopupMenuButton<String>(
      child: Row(
        children: [
          Text(
            selectedRole,
            style: AppTextStyles.titleSmall(fontSize: 12.sp),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: AppColors.themeColor,
            size: 18.sp,
          ),
        ],
      ),
      onSelected: (value) {
        selectedRole = value;
        if (value == 'admin') {
          _buildAdminBottomSheet(context);
        } else if (value == 'editor') {
          _buildEditorBottomSheet(context);
        } else if (value == 'viewer') {
          _buildViewerBottomSheet(context);
        }
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          value: 'admin',
          child: ListTile(
            leading: const Icon(
              Icons.admin_panel_settings_outlined,
              color: AppColors.themeColor,
            ),
            title: Text('Admin', style: AppTextStyles.titleSmall()),
          ),
        ),
        PopupMenuItem<String>(
          value: 'editor',
          child: ListTile(
            leading: const Icon(
              Icons.edit_outlined,
              color: AppColors.themeColor,
            ),
            title: Text('Editor', style: AppTextStyles.titleSmall()),
          ),
        ),
        PopupMenuItem<String>(
          value: 'viewer',
          child: ListTile(
            leading: const Icon(
              Icons.remove_red_eye_outlined,
              color: AppColors.themeColor,
            ),
            title: Text('Viewer', style: AppTextStyles.titleSmall()),
          ),
        ),
      ],
    );
  }

  // Show bottom sheet for adding book with role selection
  Future<void> _showAddToBookBottomSheet(BuildContext context) async {
    String tempRole = "editor"; // Default role

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, color: AppColors.themeColor),
                      ),
                      Text(
                        "Select Role",
                        style: AppTextStyles.titleSmall(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  const Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Text(
                          'Book:',
                          style: AppTextStyles.titleSmall(color: Colors.black54),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            widget.book.name ?? 'Unknown',
                            style: AppTextStyles.titleSmall(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const Divider(),

                  // Role options
                  RadioListTile<String>(
                    activeColor: AppColors.themeColor,
                    value: 'admin',
                    groupValue: tempRole,
                    onChanged: (val) {
                      setModalState(() {
                        tempRole = val!;
                      });
                    },
                    title: Row(
                      children: [
                        const Icon(Icons.admin_panel_settings_outlined, color: AppColors.themeColor),
                        SizedBox(width: 12.w),
                        Text('Admin', style: AppTextStyles.titleSmall()),
                      ],
                    ),
                  ),
                  RadioListTile<String>(
                    activeColor: AppColors.themeColor,
                    value: 'editor',
                    groupValue: tempRole,
                    onChanged: (val) {
                      setModalState(() {
                        tempRole = val!;
                      });
                    },
                    title: Row(
                      children: [
                        const Icon(Icons.edit_outlined, color: AppColors.themeColor),
                        SizedBox(width: 12.w),
                        Text('Editor', style: AppTextStyles.titleSmall()),
                      ],
                    ),
                  ),
                  RadioListTile<String>(
                    activeColor: AppColors.themeColor,
                    value: 'viewer',
                    groupValue: tempRole,
                    onChanged: (val) {
                      setModalState(() {
                        tempRole = val!;
                      });
                    },
                    title: Row(
                      children: [
                        const Icon(Icons.remove_red_eye_outlined, color: AppColors.themeColor),
                        SizedBox(width: 12.w),
                        Text('Viewer', style: AppTextStyles.titleSmall()),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(48.h),
                      ),
                      onPressed: () {
                        // TODO: Call your API method here to add book
                        // Example:
                        // Get.find<BusinessTeamController>().addUserToBook(
                        //   userId: widget.userId,
                        //   businessId: widget.businessId,
                        //   bookId: widget.book.id!,
                        //   role: tempRole,
                        // );

                        print('Adding book: {book_id: ${widget.book.id}, role: $tempRole}');

                        Navigator.pop(context);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Adding ${widget.book.name} with $tempRole role...'),
                          ),
                        );
                      },
                      child: const Text("ADD TO BOOK"),
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<dynamic> _buildAdminBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.h),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: AppColors.themeColor),
                  ),
                  Text(
                    "Choose Role",
                    style: AppTextStyles.titleSmall(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Text(
                      'Book:',
                      style: AppTextStyles.titleSmall(color: Colors.black54),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        widget.book.name ?? 'Unknown',
                        style: AppTextStyles.titleSmall(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Admin Permissions",
                    style: AppTextStyles.bodyMediumWhite(
                      color: AppColors.themeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _infoTile(Icons.check_circle, "View entries and download reports", Colors.green),
              _infoTile(Icons.check_circle, "Add Cash In or Cash Out entries", Colors.green),
              _infoTile(Icons.check_circle, "Edit and delete entries", Colors.green),
              _infoTile(Icons.check_circle, "Access to all Book Settings", Colors.green),
              _infoTile(Icons.check_circle, "Move or copy entries from one book to other book", Colors.green),
              _infoTile(Icons.check_circle, "Access Book Active and Entry's Edit History", Colors.green),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Restrictions",
                    style: AppTextStyles.bodyMediumWhite(
                      color: AppColors.themeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _infoTile(Icons.cancel, "Can't Rename/Duplicate/Delete book/Delete All entries", Colors.red),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(48.h),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedRole = selectedRole;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("UPDATE"),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _buildEditorBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.h),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: AppColors.themeColor),
                  ),
                  Text(
                    "Choose Role",
                    style: AppTextStyles.titleSmall(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Text('Book:', style: AppTextStyles.titleSmall(color: Colors.black54)),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        widget.book.name ?? 'Unknown',
                        style: AppTextStyles.titleSmall(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Editor Permissions",
                    style: AppTextStyles.bodyMediumWhite(
                      color: AppColors.themeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _infoTile(Icons.check_circle, "View entries by everyone", Colors.green),
              _infoTile(Icons.check_circle, "Add Cash In or Cash Out entries", Colors.green),
              _infoTile(Icons.check_circle, "View net balance & download PDF or Excel", Colors.green),
              SizedBox(height: 5.h),
              const Divider(),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: Colors.grey),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        'You can add additional restriction for editor role from book settings',
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(48.h),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedRole = selectedRole;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("UPDATE"),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _buildViewerBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.h),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: AppColors.themeColor),
                  ),
                  Text(
                    "Choose Role",
                    style: AppTextStyles.titleSmall(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Text('Book:', style: AppTextStyles.titleSmall(color: Colors.black54)),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        widget.book.name ?? 'Unknown',
                        style: AppTextStyles.titleSmall(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Viewer Permissions",
                    style: AppTextStyles.bodyMediumWhite(
                      color: AppColors.themeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _infoTile(Icons.check_circle, "View entries by everyone", Colors.green),
              _infoTile(Icons.check_circle, "View net balance & download PDF or Excel", Colors.green),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(48.h),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedRole = selectedRole;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("UPDATE"),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  Widget _infoTile(IconData icon, String text, Color iconColor) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.titleSmall(
                color: Colors.black54,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
/*

import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/model/GetAllBookAccessListUserWishResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/business_team_controller.dart';

class SelectBookCard extends StatefulWidget {
  final AllBooks book;
  final int businessId;
  final int userId;

  const SelectBookCard({
    super.key,
    required this.book,
    required this.businessId,
    required this.userId,
  });

  @override
  State<SelectBookCard> createState() => _SelectBookCardState();
}

class _SelectBookCardState extends State<SelectBookCard> {
  String selectedRole = "editor";

  @override
  void initState() {
    super.initState();
    selectedRole = widget.book.role ?? 'editor';
  }

  // Check if book has access
  bool get hasAccess => widget.book.accessStatus == 1 || widget.book.role != null;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        leading: Checkbox(
          activeColor: AppColors.themeColor,
          checkColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.r),
              bottomRight: Radius.circular(5.r),
            ),
          ),
          value: hasAccess,
          onChanged: (bool? value) {
            if (!hasAccess) {
              // Book doesn't have access, show bottom sheet to select role and add
              _showAddToBookBottomSheet(context);
            } else {
              // Book has existing access, show confirmation dialog to remove
              _showRemoveAccessDialog(context);
            }
          },
        ),
        title: Text(
          widget.book.name ?? 'Unknown Book',
          style: AppTextStyles.titleSmall(),
        ),
        trailing: hasAccess
            ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Role:',
              style: AppTextStyles.titleSmall(
                fontSize: 10.sp,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 4.w),
            _buildRolePopupMenu(context),
          ],
        )
            : null,
      ),
    );
  }

  // Show confirmation dialog for removing access
  Future<void> _showRemoveAccessDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          title: Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.orange,
                size: 28.sp,
              ),
              SizedBox(width: 8.w),
              Text(
                'Remove Access',
                style: AppTextStyles.titleSmall(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Text(
            'Are you sure you want to remove access from "${widget.book.name}"?',
            style: AppTextStyles.titleSmall(
              fontSize: 14.sp,
              color: Colors.black87,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: AppTextStyles.titleSmall(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () {
                // TODO: Call your API method here to remove book access
                // Example:
                // Get.find<BusinessTeamController>().removeUserFromBook(
                //   userId: widget.userId,
                //   businessId: widget.businessId,
                //   bookId: widget.book.id!,
                // );

                print('Removing access from book: ${widget.book.id}');

                Navigator.of(context).pop();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Removing access from ${widget.book.name}...'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              child: Text(
                'Remove',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  PopupMenuButton<String> _buildRolePopupMenu(BuildContext context) {
    return PopupMenuButton<String>(
      child: Row(
        children: [
          Text(
            selectedRole,
            style: AppTextStyles.titleSmall(fontSize: 12.sp),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: AppColors.themeColor,
            size: 18.sp,
          ),
        ],
      ),
      onSelected: (value) {
        selectedRole = value;
        if (value == 'admin') {
          _buildAdminBottomSheet(context);
        } else if (value == 'editor') {
          _buildEditorBottomSheet(context);
        } else if (value == 'viewer') {
          _buildViewerBottomSheet(context);
        }
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          value: 'admin',
          child: ListTile(
            leading: const Icon(
              Icons.admin_panel_settings_outlined,
              color: AppColors.themeColor,
            ),
            title: Text('Admin', style: AppTextStyles.titleSmall()),
          ),
        ),
        PopupMenuItem<String>(
          value: 'editor',
          child: ListTile(
            leading: const Icon(
              Icons.edit_outlined,
              color: AppColors.themeColor,
            ),
            title: Text('Editor', style: AppTextStyles.titleSmall()),
          ),
        ),
        PopupMenuItem<String>(
          value: 'viewer',
          child: ListTile(
            leading: const Icon(
              Icons.remove_red_eye_outlined,
              color: AppColors.themeColor,
            ),
            title: Text('Viewer', style: AppTextStyles.titleSmall()),
          ),
        ),
      ],
    );
  }

  // Show bottom sheet for adding book with role selection
  Future<void> _showAddToBookBottomSheet(BuildContext context) async {
    String tempRole = "editor"; // Default role

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, color: AppColors.themeColor),
                      ),
                      Text(
                        "Select Role",
                        style: AppTextStyles.titleSmall(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  const Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Text(
                          'Book:',
                          style: AppTextStyles.titleSmall(color: Colors.black54),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            widget.book.name ?? 'Unknown',
                            style: AppTextStyles.titleSmall(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const Divider(),

                  // Role options
                  RadioListTile<String>(
                    activeColor: AppColors.themeColor,
                    value: 'admin',
                    groupValue: tempRole,
                    onChanged: (val) {
                      setModalState(() {
                        tempRole = val!;
                      });
                    },
                    title: Row(
                      children: [
                        const Icon(Icons.admin_panel_settings_outlined, color: AppColors.themeColor),
                        SizedBox(width: 12.w),
                        Text('Admin', style: AppTextStyles.titleSmall()),
                      ],
                    ),
                  ),
                  RadioListTile<String>(
                    activeColor: AppColors.themeColor,
                    value: 'editor',
                    groupValue: tempRole,
                    onChanged: (val) {
                      setModalState(() {
                        tempRole = val!;
                      });
                    },
                    title: Row(
                      children: [
                        const Icon(Icons.edit_outlined, color: AppColors.themeColor),
                        SizedBox(width: 12.w),
                        Text('Editor', style: AppTextStyles.titleSmall()),
                      ],
                    ),
                  ),
                  RadioListTile<String>(
                    activeColor: AppColors.themeColor,
                    value: 'viewer',
                    groupValue: tempRole,
                    onChanged: (val) {
                      setModalState(() {
                        tempRole = val!;
                      });
                    },
                    title: Row(
                      children: [
                        const Icon(Icons.remove_red_eye_outlined, color: AppColors.themeColor),
                        SizedBox(width: 12.w),
                        Text('Viewer', style: AppTextStyles.titleSmall()),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(48.h),
                      ),
                      onPressed: () {
                        Get.find<BusinessTeamController>().addBookAccess(userId: widget.userId, businessId: widget.businessId, bookId: widget.book.id!, role: tempRole.toLowerCase());
                        // TODO: Call your API method here to add book
                        // Example:
                        // Get.find<BusinessTeamController>().addUserToBook(
                        //   userId: widget.userId,
                        //   businessId: widget.businessId,
                        //   bookId: widget.book.id!,
                        //   role: tempRole,
                        // );

                        print('Adding book: {book_id: ${widget.book.id}, role: $tempRole}');

                        Navigator.pop(context);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Adding ${widget.book.name} with $tempRole role...'),
                          ),
                        );
                      },
                      child: const Text("ADD TO BOOK"),
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<dynamic> _buildAdminBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.h),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: AppColors.themeColor),
                  ),
                  Text(
                    "Choose Role",
                    style: AppTextStyles.titleSmall(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Text(
                      'Book:',
                      style: AppTextStyles.titleSmall(color: Colors.black54),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        widget.book.name ?? 'Unknown',
                        style: AppTextStyles.titleSmall(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Admin Permissions",
                    style: AppTextStyles.bodyMediumWhite(
                      color: AppColors.themeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _infoTile(Icons.check_circle, "View entries and download reports", Colors.green),
              _infoTile(Icons.check_circle, "Add Cash In or Cash Out entries", Colors.green),
              _infoTile(Icons.check_circle, "Edit and delete entries", Colors.green),
              _infoTile(Icons.check_circle, "Access to all Book Settings", Colors.green),
              _infoTile(Icons.check_circle, "Move or copy entries from one book to other book", Colors.green),
              _infoTile(Icons.check_circle, "Access Book Active and Entry's Edit History", Colors.green),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Restrictions",
                    style: AppTextStyles.bodyMediumWhite(
                      color: AppColors.themeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _infoTile(Icons.cancel, "Can't Rename/Duplicate/Delete book/Delete All entries", Colors.red),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(48.h),
                  ),
                  onPressed: () {
                   Get.find<BusinessTeamController>().changeBookRole(userId: widget.userId, businessId: widget.businessId, role: selectedRole.toLowerCase(), bookId: widget.book.id!);

                  },
                  child: const Text("UPDATE"),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _buildEditorBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.h),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: AppColors.themeColor),
                  ),
                  Text(
                    "Choose Role",
                    style: AppTextStyles.titleSmall(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Text('Book:', style: AppTextStyles.titleSmall(color: Colors.black54)),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        widget.book.name ?? 'Unknown',
                        style: AppTextStyles.titleSmall(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Editor Permissions",
                    style: AppTextStyles.bodyMediumWhite(
                      color: AppColors.themeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _infoTile(Icons.check_circle, "View entries by everyone", Colors.green),
              _infoTile(Icons.check_circle, "Add Cash In or Cash Out entries", Colors.green),
              _infoTile(Icons.check_circle, "View net balance & download PDF or Excel", Colors.green),
              SizedBox(height: 5.h),
              const Divider(),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: Colors.grey),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        'You can add additional restriction for editor role from book settings',
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(48.h),
                  ),
                  onPressed: () {
                    Get.find<BusinessTeamController>().changeBookRole(userId: widget.userId, businessId: widget.businessId, role: selectedRole.toLowerCase(), bookId: widget.book.id!);
                  },
                  child: const Text("UPDATE"),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _buildViewerBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.h),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: AppColors.themeColor),
                  ),
                  Text(
                    "Choose Role",
                    style: AppTextStyles.titleSmall(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Text('Book:', style: AppTextStyles.titleSmall(color: Colors.black54)),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        widget.book.name ?? 'Unknown',
                        style: AppTextStyles.titleSmall(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Viewer Permissions",
                    style: AppTextStyles.bodyMediumWhite(
                      color: AppColors.themeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _infoTile(Icons.check_circle, "View entries by everyone", Colors.green),
              _infoTile(Icons.check_circle, "View net balance & download PDF or Excel", Colors.green),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(48.h),
                  ),
                  onPressed: () {
                    Get.find<BusinessTeamController>().changeBookRole(userId: widget.userId, businessId: widget.businessId, role: selectedRole.toLowerCase(), bookId: widget.book.id!);
                  },
                  child: const Text("UPDATE"),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  Widget _infoTile(IconData icon, String text, Color iconColor) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.titleSmall(
                color: Colors.black54,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/

import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/model/GetAllBookAccessListUserWishResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/business_team_controller.dart';

class SelectBookCard extends StatefulWidget {
  final AllBooks book;
  final int businessId;
  final int userId;

  const SelectBookCard({
    super.key,
    required this.book,
    required this.businessId,
    required this.userId,
  });

  @override
  State<SelectBookCard> createState() => _SelectBookCardState();
}

class _SelectBookCardState extends State<SelectBookCard> {
  String selectedRole = "editor";
  String tempRole = "editor"; // Add this to track the selected role in popup

  @override
  void initState() {
    super.initState();
    selectedRole = widget.book.role ?? 'editor';
    tempRole = selectedRole; // Initialize tempRole as well
  }

  bool get hasAccess => widget.book.accessStatus == 1 || widget.book.role != null;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        leading: Checkbox(
          activeColor: AppColors.themeColor,
          checkColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.r),
              bottomRight: Radius.circular(5.r),
            ),
          ),
          value: hasAccess,
          onChanged: (bool? value) {
            if (!hasAccess) {
              _showAddToBookBottomSheet(context);
            } else {
              _showRemoveAccessDialog(context);
            }
          },
        ),
        title: Text(
          widget.book.name ?? 'Unknown Book',
          style: AppTextStyles.titleSmall(),
        ),
        trailing: hasAccess
            ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Role:',
              style: AppTextStyles.titleSmall(
                fontSize: 10.sp,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 4.w),
            _buildRolePopupMenu(context),
          ],
        )
            : null,
      ),
    );
  }

  Future<void> _showRemoveAccessDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          title: Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.orange,
                size: 28.sp,
              ),
              SizedBox(width: 8.w),
              Text(
                'Remove Access',
                style: AppTextStyles.titleSmall(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Text(
            'Are you sure you want to remove access from "${widget.book.name}"?',
            style: AppTextStyles.titleSmall(
              fontSize: 14.sp,
              color: Colors.black87,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: AppTextStyles.titleSmall(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () {
                Get.find<BusinessTeamController>().deleteBookAccess(bookId: widget.book.id!, businessId: widget.businessId, userId: widget.userId);
                // TODO: Call your API to remove book access
                print('Removing access from book: ${widget.book.id}');
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Removing access from ${widget.book.name}...'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              child: Text(
                'Remove',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  PopupMenuButton<String> _buildRolePopupMenu(BuildContext context) {
    return PopupMenuButton<String>(
      child: Row(
        children: [
          Text(
            selectedRole,
            style: AppTextStyles.titleSmall(fontSize: 12.sp),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: AppColors.themeColor,
            size: 18.sp,
          ),
        ],
      ),
      onSelected: (value) {
        // Store the selected role in tempRole before opening bottom sheet
        tempRole = value;

        if (value == 'admin') {
          _buildAdminBottomSheet(context);
        } else if (value == 'editor') {
          _buildEditorBottomSheet(context);
        } else if (value == 'viewer') {
          _buildViewerBottomSheet(context);
        }
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          value: 'admin',
          child: ListTile(
            leading: const Icon(
              Icons.admin_panel_settings_outlined,
              color: AppColors.themeColor,
            ),
            title: Text('Admin', style: AppTextStyles.titleSmall()),
          ),
        ),
        PopupMenuItem<String>(
          value: 'editor',
          child: ListTile(
            leading: const Icon(
              Icons.edit_outlined,
              color: AppColors.themeColor,
            ),
            title: Text('Editor', style: AppTextStyles.titleSmall()),
          ),
        ),
        PopupMenuItem<String>(
          value: 'viewer',
          child: ListTile(
            leading: const Icon(
              Icons.remove_red_eye_outlined,
              color: AppColors.themeColor,
            ),
            title: Text('Viewer', style: AppTextStyles.titleSmall()),
          ),
        ),
      ],
    );
  }

  Future<void> _showAddToBookBottomSheet(BuildContext context) async {
    String tempRoleLocal = "editor";

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, color: AppColors.themeColor),
                      ),
                      Text(
                        "Select Role",
                        style: AppTextStyles.titleSmall(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  const Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Text(
                          'Book:',
                          style: AppTextStyles.titleSmall(color: Colors.black54),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            widget.book.name ?? 'Unknown',
                            style: AppTextStyles.titleSmall(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const Divider(),
                  RadioListTile<String>(
                    activeColor: AppColors.themeColor,
                    value: 'admin',
                    groupValue: tempRoleLocal,
                    onChanged: (val) {
                      setModalState(() {
                        tempRoleLocal = val!;
                      });
                    },
                    title: Row(
                      children: [
                        const Icon(Icons.admin_panel_settings_outlined,
                            color: AppColors.themeColor),
                        SizedBox(width: 12.w),
                        Text('Admin', style: AppTextStyles.titleSmall()),
                      ],
                    ),
                  ),
                  RadioListTile<String>(
                    activeColor: AppColors.themeColor,
                    value: 'editor',
                    groupValue: tempRoleLocal,
                    onChanged: (val) {
                      setModalState(() {
                        tempRoleLocal = val!;
                      });
                    },
                    title: Row(
                      children: [
                        const Icon(Icons.edit_outlined,
                            color: AppColors.themeColor),
                        SizedBox(width: 12.w),
                        Text('Editor', style: AppTextStyles.titleSmall()),
                      ],
                    ),
                  ),
                  RadioListTile<String>(
                    activeColor: AppColors.themeColor,
                    value: 'viewer',
                    groupValue: tempRoleLocal,
                    onChanged: (val) {
                      setModalState(() {
                        tempRoleLocal = val!;
                      });
                    },
                    title: Row(
                      children: [
                        const Icon(Icons.remove_red_eye_outlined,
                            color: AppColors.themeColor),
                        SizedBox(width: 12.w),
                        Text('Viewer', style: AppTextStyles.titleSmall()),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(48.h),
                      ),
                      onPressed: () {
                        Get.find<BusinessTeamController>().addBookAccess(
                          userId: widget.userId,
                          businessId: widget.businessId,
                          bookId: widget.book.id!,
                          role: tempRoleLocal.toLowerCase(),
                        );
                        Navigator.pop(context);
                      },
                      child: const Text("ADD TO BOOK"),
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<dynamic> _buildAdminBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.h),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: AppColors.themeColor),
                  ),
                  Text(
                    "Admin Role",
                    style: AppTextStyles.titleSmall(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Text(
                      'Book:',
                      style: AppTextStyles.titleSmall(color: Colors.black54),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        widget.book.name ?? 'Unknown',
                        style: AppTextStyles.titleSmall(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Admin Permissions",
                    style: AppTextStyles.bodyMediumWhite(
                      color: AppColors.themeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _infoTile(Icons.check_circle,
                  "View entries and download reports", Colors.green),
              _infoTile(Icons.check_circle, "Add Cash In or Cash Out entries",
                  Colors.green),
              _infoTile(
                  Icons.check_circle, "Edit and delete entries", Colors.green),
              _infoTile(Icons.check_circle, "Access to all Book Settings",
                  Colors.green),
              _infoTile(Icons.check_circle,
                  "Move or copy entries from one book to other book", Colors.green),
              _infoTile(Icons.check_circle,
                  "Access Book Active and Entry's Edit History", Colors.green),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Restrictions",
                    style: AppTextStyles.bodyMediumWhite(
                      color: AppColors.themeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _infoTile(Icons.cancel,
                  "Can't Rename/Duplicate/Delete book/Delete All entries", Colors.red),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(48.h),
                  ),
                  onPressed: () {
                    // Use tempRole which was set when the popup menu item was selected
                    Get.find<BusinessTeamController>().changeBookRole(
                      userId: widget.userId,
                      businessId: widget.businessId,
                      role: tempRole.toLowerCase(), // Use tempRole here
                      bookId: widget.book.id!,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("UPDATE"),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _buildEditorBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.h),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: AppColors.themeColor),
                  ),
                  Text(
                    "Editor Role",
                    style: AppTextStyles.titleSmall(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Text('Book:',
                        style: AppTextStyles.titleSmall(color: Colors.black54)),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        widget.book.name ?? 'Unknown',
                        style: AppTextStyles.titleSmall(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Editor Permissions",
                    style: AppTextStyles.bodyMediumWhite(
                      color: AppColors.themeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _infoTile(Icons.check_circle, "View entries by everyone",
                  Colors.green),
              _infoTile(Icons.check_circle, "Add Cash In or Cash Out entries",
                  Colors.green),
              _infoTile(Icons.check_circle,
                  "View net balance & download PDF or Excel", Colors.green),
              SizedBox(height: 5.h),
              const Divider(),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: Colors.grey),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        'You can add additional restriction for editor role from book settings',
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(48.h),
                  ),
                  onPressed: () {
                    // Use tempRole which was set when the popup menu item was selected
                    Get.find<BusinessTeamController>().changeBookRole(
                      userId: widget.userId,
                      businessId: widget.businessId,
                      role: tempRole.toLowerCase(), // Use tempRole here
                      bookId: widget.book.id!,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("UPDATE"),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _buildViewerBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.h),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: AppColors.themeColor),
                  ),
                  Text(
                    "Viewer Role",
                    style: AppTextStyles.titleSmall(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Text('Book:',
                        style: AppTextStyles.titleSmall(color: Colors.black54)),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        widget.book.name ?? 'Unknown',
                        style: AppTextStyles.titleSmall(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Viewer Permissions",
                    style: AppTextStyles.bodyMediumWhite(
                      color: AppColors.themeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _infoTile(Icons.check_circle, "View entries by everyone",
                  Colors.green),
              _infoTile(Icons.check_circle,
                  "View net balance & download PDF or Excel", Colors.green),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(48.h),
                  ),
                  onPressed: () {
                    // Use tempRole which was set when the popup menu item was selected
                    Get.find<BusinessTeamController>().changeBookRole(
                      userId: widget.userId,
                      businessId: widget.businessId,
                      role: tempRole.toLowerCase(), // Use tempRole here
                      bookId: widget.book.id!,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("UPDATE"),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  Widget _infoTile(IconData icon, String text, Color iconColor) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.titleSmall(
                color: Colors.black54,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
