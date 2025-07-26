
import 'package:cash_books/app/assets_path.dart';
import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:flutter/material.dart';

class TeamDiagram extends StatelessWidget {
  const TeamDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(AssetsPath.persons),
        ),
        const SizedBox(height: 4),
        Text("You (Owner)",style: AppTextStyles.subtitleSmall(color: Colors.white,fontWeight: FontWeight.normal),),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(AssetsPath.persons),
                ),
                const SizedBox(height: 4),
                Text("Business Partner",style: AppTextStyles.subtitleSmall(color: Colors.white,fontWeight: FontWeight.normal),),
                Text("(Full access)",
                    style: AppTextStyles.subtitleSmall(color: Colors.white,fontWeight: FontWeight.normal)),
              ],
            ),
            Column(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(AssetsPath.persons),
                ),
                const SizedBox(height: 4),
                Text("Staff Members",style: AppTextStyles.subtitleSmall(color: Colors.white,fontWeight: FontWeight.normal)),
                Text("(Limited access)",
                    style: AppTextStyles.subtitleSmall(color: Colors.white,fontWeight: FontWeight.normal)),
              ],
            ),
          ],
        )
      ],
    );
  }
}
