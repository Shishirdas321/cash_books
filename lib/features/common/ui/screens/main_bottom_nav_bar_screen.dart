import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/common/controllers/main_bottom_nav_bar_controller.dart';
import 'package:cash_books/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  static const String name = '/main-nav-bar-screen';

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {

  final List<Widget> _screens = [
      const HomeScreen(),
      const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavBarController>(builder: (controller) {
        return _screens[controller.selectedIndex];
      }),
        bottomNavigationBar:
        GetBuilder<MainBottomNavBarController>(builder: (controller) {
          return NavigationBar(backgroundColor: AppColors.themeColor,labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            //indicatorColor: Colors.grey,
           // surfaceTintColor: Colors.amber,

            selectedIndex: controller.selectedIndex,
            onDestinationSelected: controller.changeIndex,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home',),
              NavigationDestination(
                  icon: Icon(Icons.help_center_outlined), label: 'Help'),
              NavigationDestination(
                  icon: Icon(Icons.settings_applications), label: 'Setting'),
            ],
          );
        }),
    );
  }
}
