
import 'package:cash_books/app/assets_path.dart';
import 'package:cash_books/core/enums/enums.dart';
import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeamDiagram extends StatelessWidget {
  const TeamDiagram({super.key});
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
         CircleAvatar(
          radius: 30.r,
          backgroundImage: const AssetImage(AssetsPath.persons),
          // child: CustomImage(image: AssetsPath.persons,imageType: ImageType.asset,circular: true,showBorder: true,borderRadius: 6,),
        ),
         SizedBox(height: 4.h),
        Text("You (Owner)",style: AppTextStyles.subtitleSmall(color: Colors.grey,fontWeight: FontWeight.normal),),
         SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                 CircleAvatar(
                  radius: 24.r,
                  backgroundImage: const AssetImage(AssetsPath.persons),
                ),
                 SizedBox(height: 4.h),
                Text("Business Partner",style: AppTextStyles.subtitleSmall(color: Colors.grey,fontWeight: FontWeight.normal),),
                Text("(Full access)",
                    style: AppTextStyles.subtitleSmall(color: Colors.grey,fontWeight: FontWeight.normal)),
              ],
            ),
            Column(
              children: [
                 CircleAvatar(
                  radius: 24.r,
                  backgroundImage: const AssetImage(AssetsPath.persons),
                ),
                 SizedBox(height: 4.h),
                Text("Staff Members",style: AppTextStyles.subtitleSmall(color: Colors.grey,fontWeight: FontWeight.normal)),
                Text("(Limited access)",
                    style: AppTextStyles.subtitleSmall(color: Colors.grey,fontWeight: FontWeight.normal)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
