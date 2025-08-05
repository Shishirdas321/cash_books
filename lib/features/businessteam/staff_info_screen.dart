import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/member_add_to_book_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaffInfoScreen extends StatelessWidget {
  const StaffInfoScreen({super.key});

  static const String name = '/staff-info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.93),
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
        title:  Text(
          'Staff Info',
          style: AppTextStyles.appbar(),
        ),
      ),
      body: ListView(
          padding:  EdgeInsets.all(16.w),
          children: [
             ListTile(
              leading: CircleAvatar(
                radius: 24.r,
                child: const Icon(Icons.person_outline,color: AppColors.themeColor,),
              ),
              title: Text('dknnn22@gmail.com',style: AppTextStyles.bodyMediumWhite(color: Colors.black54),),
              trailing: const Chip(elevation: 6,
                label: Text('Staff', style: TextStyle(color: Colors.white)),
                backgroundColor: AppColors.themeColor,
              ),
            ),
             Divider(height: 32.h),

            /*Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 24,
                  child: Icon(Icons.person_outline),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Shishir', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('dknnn22@gmail.com'),
                    ],
                  ),
                ),
                const Chip(
                  label: Text('Staff', style: TextStyle(color: Colors.white)),
                  backgroundColor: AppColors.themeColor,
                )
              ],
            ),*/
             SizedBox(height: 24.h),
             Divider(height: 32.h),
             ListTile(
              onTap: (){
                _buildStaffPermissionBottomSheet(context);
              },
              leading: const Icon(Icons.badge, color: Colors.black87),
              title:  Text('Staff Permissions',
              style: AppTextStyles.bodyMediumWhite(color: Colors.black54),),
              subtitle:  Text('List of actions Staff can take',
              style: AppTextStyles.bodyMediumWhite(color: Colors.black54),),
                trailing:  Icon(
                  Icons.arrow_forward_ios,
                  size: 18.w,
                  color: Colors.black87,
                ),
              ),

             Divider(height: 32.h),

             Text('Books (0)', style: AppTextStyles.bodyMediumWhite(fontWeight: FontWeight.bold,color: Colors.black54)),
             SizedBox(height: 8.h),

            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.add, color: Colors.black87),
              ),
                title:  Text('Add to books',
                    style: AppTextStyles.bodyMediumPopins(color: Colors.black54)),
                subtitle:  Text(
                  'Add & Assign Role',
                  style: AppTextStyles.subtitleSmall(color: Colors.black45),
                ),
                onTap: () {
                Navigator.pushNamed(context, MemberAddToBookView.name);
              },
            ),

             SizedBox(height: 8.h),
            ListTile(
              leading:  const Icon(Icons.switch_account_outlined, color: Colors.black87),
              title:  Text('Change role to Partner', style: AppTextStyles.bodyMediumPopins(color: Colors.black54)),
              onTap: () {
                _buildBottomSheetChangeRoleToPartner(context);
              },
            ),
             SizedBox(height: 8.h),
            ListTile(
              leading: const Icon(Icons.person_remove_outlined, color: Colors.red),
              title:  Text('Remove from business', style: AppTextStyles.bodyMediumPopins(color: Colors.black54)),
              onTap: () {
                _showRemoveFromBusiness(context);
              },
            ),
          ],
        ),
    );
  }


  Future<dynamic> _showRemoveFromBusiness(context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:  Text(
          'Remove Shishir from Business Book?',
          style: AppTextStyles.bodyMedium(color: Colors.black),
        ),
        actions: [
           Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Are you sure?',style: TextStyle(fontFamily: 'popins',fontSize: 16.sp,color: Colors.grey),),
              Text('Shishir will loss access to this book',style: TextStyle(fontFamily: 'popins',fontSize: 16.sp,color: Colors.grey),),
                SizedBox(height: 18.h),
                Card(
                  color: AppColors.themeColor,
                  child: Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.info_outline,color: Colors.white,),
                        Expanded(child: Text('shishir will stil be a part of your business',style: TextStyle(
                          fontSize: 10.sp,color: Colors.white,fontFamily: 'appBarText'
                        ),))
                      ],
                    ),
                  ),
                )
            ],
          ),
           SizedBox(height: 16.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
        ],
      ),
    );
  }

  Future<dynamic> _buildStaffPermissionBottomSheet(BuildContext context) {
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
                    "Staff Permission",
                    style: AppTextStyles.bodyMedium(color: Colors.black),
                  ),
                ],
              ),
               SizedBox(height: 10.h),
              const Divider(),
               SizedBox(height: 10.h),
              // Permissions Section
               Padding(
                padding:  EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Permissions",
                      style: AppTextStyles.bodyMediumWhite(color: Colors.black)),
                ),
              ),
              _infoTile(Icons.check_circle, "Limited access to selected book",
                  Colors.green),
              _infoTile(Icons.check_circle, "Owner/Partner can assign Admin,Viewer or Data Operator role to staff in any book",
                  Colors.green),
              // Restrictions Section
               Padding(
                padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Restrictions",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              _infoTile(
                  Icons.cancel,
                  "No access to books they are not part of ",
                  Colors.red),
              _infoTile(
                  Icons.cancel,
                  "No access to business settings ",
                  Colors.red),
              _infoTile(
                  Icons.cancel,
                  "No option to delete books ",
                  Colors.red),
               SizedBox(height: 25.h),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _buildBottomSheetChangeRoleToPartner(BuildContext context) {
    return showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              ),
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       SizedBox(height: 16.h),
                      Row(
                        children: [
                          IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon: const Icon(Icons.close,color: AppColors.themeColor,)),
                           Text(
                            "Change role to Partner",
                            style: AppTextStyles.bodyMediumPopins(color: Colors.black,fontSize: 18.sp),
                          ),
                        ],
                      ),
                       SizedBox(height: 10.h),
                      const Divider(),

                      // User Info Row
                       Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          children: [
                             CircleAvatar(
                              radius: 24.r,
                              child: const Icon(Icons.person_outline,color: Colors.black87,)
                            ),
                             SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Opu", style: AppTextStyles.titleSmall(color: Colors.black87)),
                                Text("dknnn22@gmail.com",style: AppTextStyles.subtitleSmall(color: Colors.black54),),
                              ],
                            ),
                          ],
                        ),
                      ),

                       SizedBox(height: 16.h),
                      const Divider(),

                      // Permissions Section
                       Padding(
                        padding:  EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Permissions", style: AppTextStyles.bodyMedium(color: Colors.black)),
                        ),
                      ),
                      _infoTile(Icons.check_circle, "Full access to all books of this business", Colors.green),
                      _infoTile(Icons.check_circle, "Full access to business settings", Colors.green),
                      _infoTile(Icons.check_circle, "Add/remove members in business", Colors.green),

                      // Restrictions Section
                       Padding(
                        padding:  EdgeInsets.only(left: 16.w, top: 12.h, bottom: 4.h),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Restrictions", style: AppTextStyles.bodyMedium(color: Colors.black)),
                        ),
                      ),
                      _infoTile(Icons.cancel, "Can’t delete business", Colors.red),
                      _infoTile(Icons.cancel, "Can’t remove owner from business", Colors.red),

                       SizedBox(height: 16.h),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 16.w),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize:  Size.fromHeight(48.h),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("CHANGE ROLE TO PARTNER"),
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
      padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
           SizedBox(width: 12.w),
          Expanded(child: Text(text,style: AppTextStyles.titleSmall(color: Colors.black54,fontWeight: FontWeight.normal),)),
        ],
      ),
    );
  }

}
