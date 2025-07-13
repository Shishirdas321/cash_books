import 'dart:ui';

import 'package:cash_books/app/assets_path.dart';
import 'package:flutter/material.dart';

class TeamDiagram extends StatelessWidget {
  const TeamDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(AssetsPath.persons),
        ),
        SizedBox(height: 4),
        Text("You (Owner)"),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(AssetsPath.persons),
                ),
                SizedBox(height: 4),
                Text("Business Partner"),
                Text("(Full access)",
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(AssetsPath.persons),
                ),
                SizedBox(height: 4),
                Text("Staff Members"),
                Text("(Limited access)",
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        )
      ],
    );
  }
}
