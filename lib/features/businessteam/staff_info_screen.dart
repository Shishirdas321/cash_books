import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_one.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/businessteam/member_add_to_book_view.dart';
import 'package:flutter/material.dart';

class StaffInfoScreen extends StatelessWidget {
  const StaffInfoScreen({super.key});

  static const String name = '/staff-info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Stack(
        children:[
          const Positioned.fill(child: ScreenBackgroundOne()),
          ListView(
          padding: const EdgeInsets.all(16),
          children: [
             ListTile(
              leading:  const CircleAvatar(
                radius: 24,
                child: Icon(Icons.person_outline),
              ),
              title: Text('dknnn22@gmail.com',style: AppTextStyles.bodyMediumWhite(),),
              trailing: const Chip(elevation: 6,
                label: Text('Staff', style: TextStyle(color: Colors.white)),
                backgroundColor: AppColors.themeColor,
              ),
            ),
            const Divider(height: 32),

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
            const SizedBox(height: 24),
            const Divider(height: 32),
             ListTile(
              onTap: (){
                _buildStaffPermissionBottomSheet(context);
              },
              leading: const Icon(Icons.badge, color: Colors.white),
              title:  Text('Staff Permissions',
              style: AppTextStyles.bodyMediumWhite(),),
              subtitle:  Text('List of actions Staff can take',
              style: AppTextStyles.bodyMediumWhite(),),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Colors.white,
                ),
              ),

            const Divider(height: 32),

             Text('Books (0)', style: AppTextStyles.bodyMediumWhite(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.add, color: AppColors.themeColor),
              ),
                title:  Text('Add to books',
                    style: AppTextStyles.bodyMediumPopins()),
                subtitle:  Text(
                  'Add & Assign Role',
                  style: AppTextStyles.subtitleSmall(color: Colors.white60),
                ),
                onTap: () {
                Navigator.pushNamed(context, MemberAddToBookView.name);
              },
            ),

            const SizedBox(height: 8),
            ListTile(
              leading:  const Icon(Icons.switch_account_outlined, color: Colors.white),
              title:  Text('Change role to Partner', style: AppTextStyles.bodyMediumPopins()),
              onTap: () {
                _buildBottomSheetChangeRoleToPartner(context);
              },
            ),

            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.person_remove_outlined, color: Colors.red),
              title:  Text('Remove from business', style: AppTextStyles.bodyMediumPopins()),
              onTap: () {
                _showRemoveFromBusiness(context);

              },
            ),
          ],
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
          style: AppTextStyles.bodyMedium(),
        ),
        actions: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Are you sure?',style: TextStyle(fontFamily: 'popins',fontSize: 16,color: Colors.blueGrey),),
              Text('Shishir will loss access to this book',style: TextStyle(fontFamily: 'popins',fontSize: 16,color: Colors.blueGrey),),
                SizedBox(height: 18),
                Card(
                  color: AppColors.themeColor,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.info_outline,color: Colors.white,),
                        Expanded(child: Text('shishir will stil be a part of your business',style: TextStyle(
                          fontSize: 10,color: Colors.white,fontFamily: 'appBarText'
                        ),))
                      ],
                    ),
                  ),
                )
            ],
          ),
          const SizedBox(height: 16),

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
                    "Staff Permission",
                    style: AppTextStyles.bodyMedium(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              // Permissions Section
               Padding(
                padding: const EdgeInsets.only(left: 16, top: 12, bottom: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Permissions",
                      style: AppTextStyles.bodyMediumWhite(color: AppColors.themeColor)),
                ),
              ),
              _infoTile(Icons.check_circle, "Limited access to selected book",
                  Colors.green),
              _infoTile(Icons.check_circle, "Owner/Partner can assign Admin,Viewer or Data Operator role to staff in any book",
                  Colors.green),
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
              const SizedBox(height: 25),
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
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon: const Icon(Icons.close,color: AppColors.themeColor,)),
                           Text(
                            "Change role to Partner",
                            style: AppTextStyles.bodyMediumPopins(color: AppColors.themeColor,fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(),

                      // User Info Row
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: AppColors.themeColor,
                              child: Icon(Icons.person_outline,color: Colors.white,)
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Opu", style: AppTextStyles.titleSmall()),
                                Text("dknnn22@gmail.com",style: AppTextStyles.subtitleSmall(color: Colors.black54),),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),
                      const Divider(),

                      // Permissions Section
                       Padding(
                        padding: const EdgeInsets.only(left: 16, top: 12, bottom: 4),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Permissions", style: AppTextStyles.bodyMedium(color: AppColors.themeColor)),
                        ),
                      ),
                      _infoTile(Icons.check_circle, "Full access to all books of this business", Colors.green),
                      _infoTile(Icons.check_circle, "Full access to business settings", Colors.green),
                      _infoTile(Icons.check_circle, "Add/remove members in business", Colors.green),

                      // Restrictions Section
                       Padding(
                        padding: const EdgeInsets.only(left: 16, top: 12, bottom: 4),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Restrictions", style: AppTextStyles.bodyMedium(color: AppColors.themeColor)),
                        ),
                      ),
                      _infoTile(Icons.cancel, "Can’t delete business", Colors.red),
                      _infoTile(Icons.cancel, "Can’t remove owner from business", Colors.red),

                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("CHANGE ROLE TO PARTNER"),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
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
          Expanded(child: Text(text,style: AppTextStyles.titleSmall(color: Colors.black54,fontWeight: FontWeight.normal),)),
        ],
      ),
    );
  }

}
