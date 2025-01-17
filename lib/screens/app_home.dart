import 'package:datn_van_vanh/res/colors/app_colors.dart';
import 'package:datn_van_vanh/res/images/app_images.dart';
import 'package:datn_van_vanh/screens/history/history_screen.dart';
import 'package:datn_van_vanh/screens/home/home_screen.dart';
import 'package:datn_van_vanh/screens/setting/setting_screen.dart';
import 'package:datn_van_vanh/screens/user_profile/user_profile_screen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final int initialTab;
  const Dashboard({super.key, this.initialTab = 0});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _children = const [
    HomeScreen(),
    UserProfileScreen(),
    HistoryScreen(),
    SettingScreen(),
  ];

  @override
  void initState() {
    _tabController = TabController(length: _children.length, vsync: this);
    _tabController.index = widget.initialTab;
    super.initState();
  }

  void onTabTapped(int index) {
    _tabController.index = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: _children,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _tabController.index,
        unselectedFontSize: 14,
        elevation: 2.0,
        selectedIconTheme: const IconThemeData(
          color: AppColors.kPrimary,
        ),
        unselectedIconTheme: const IconThemeData(
          color: AppColors.grey400,
        ),
        // selectedLabelStyle: BatThemeData.of(context).typography.bodyCopyMedium,
        // unselectedLabelStyle: BatThemeData.of(context).typography.bodyCopy,
        selectedItemColor: AppColors.kPrimary,
        unselectedItemColor: AppColors.grey400,
        enableFeedback: true,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImages.homeIcon,
              width: 30,
            ),
            activeIcon: Image.asset(
              AppImages.homeIcon,
              width: 30,
              color: AppColors.defaultColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImages.walletsIcon,
              width: 30,
            ),
            activeIcon: Image.asset(
              AppImages.walletsIcon,
              color: AppColors.defaultColor,
              width: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImages.reportsIcon,
              width: 30,
            ),
            activeIcon: Image.asset(
              AppImages.reportsIcon,
              color: AppColors.defaultColor,
              width: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImages.settingsIcon,
              width: 30,
            ),
            activeIcon: Image.asset(
              AppImages.settingsIcon,
              color: AppColors.defaultColor,
              width: 30,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
