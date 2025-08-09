import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  String selectedRole = "Data Operator"; // real Role
  String tempRole = "Data Operator"; // BottomSheet temp Role

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
