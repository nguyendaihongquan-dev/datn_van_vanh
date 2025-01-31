import 'package:datn_van_vanh/provider/loading_provider.dart';
import 'package:datn_van_vanh/provider/manager_provider.dart';
import 'package:datn_van_vanh/provider/user_provider.dart';
import 'package:datn_van_vanh/res/colors/app_colors.dart';
import 'package:datn_van_vanh/res/fonts/app_fonts.dart';
import 'package:datn_van_vanh/res/images/app_images.dart';
import 'package:datn_van_vanh/widget/simple_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _switchValue = true;
  bool _isDrawer = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ValueNotifier<bool> A1 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A2 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A3 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A4 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A5 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A6 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A7 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A8 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A9 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A10 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A11 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A12 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A13 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A14 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A15 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A16 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A17 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A18 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A19 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A20 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A21 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A22 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A23 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> A24 = ValueNotifier<bool>(false);

  @override
  void initState() {
    // for (int i = 1; i < 25; i++) {
    //   context.read<ManagerProvider>().initDevice("A$i");
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserProvider, ManagerProvider>(
        builder: (context, user, manage, child) {
      return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF0C2964),
                      Color(0xFFFFFFFF)
                    ], // Define your colors here
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: ClipOval(
                        child: Image.asset(
                          AppImages.defaultAvatar,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(user.emailUser),
                  ],
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).padding.top,
            horizontal: 16,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {});
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: Image.asset(
                      AppImages.drawerIcon,
                      width: 22,
                      height: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x7A7A7B52)
                              .withOpacity(0.5), // Màu bóng (ARGB)
                          offset: const Offset(0, 0),
                          blurRadius: 5, // Độ mờ của bóng
                          spreadRadius: 0, // Không lan rộng
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Lekki Gardens Car Park A ",
                            style: AppFonts.openSansMedium500(
                              18,
                              const Color(0xFF3B414B),
                            ),
                          ),
                          TextSpan(
                            text: "N200 ",
                            style: AppFonts.openSansBold700(
                              20,
                              const Color(0XFF3B414B),
                            ),
                          ),
                          TextSpan(
                            text: "/Hr",
                            style: AppFonts.openSansMedium500(
                              16,
                              const Color(0XFF757F8C),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Select preferred space",
                      style: AppFonts.regular(
                        16,
                        AppColors.defaultText,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x7A7A7B52)
                              .withOpacity(0.5), // Màu bóng (ARGB)
                          offset: const Offset(0, 0),
                          blurRadius: 5, // Độ mờ của bóng
                          spreadRadius: 0, // Không lan rộng
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            "5 slots Available",
                            style: AppFonts.openSansMedium500(
                              16,
                              AppColors.defaultText,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 16),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: AppColors.defaultColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A1,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A1);
                                                },
                                                child: A1.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A1",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A2,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A2);
                                                },
                                                child: A2.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A2",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A3,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A3);
                                                },
                                                child: A3.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A3",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 16),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: AppColors.defaultColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A4,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A4);
                                                },
                                                child: A5.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A4",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A5,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A5);
                                                },
                                                child: A5.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A5",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A6,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A6);
                                                },
                                                child: A6.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A6",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 16),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: AppColors.defaultColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A7,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A7);
                                                },
                                                child: A7.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A7",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A8,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A8);
                                                },
                                                child: A8.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A8",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A9,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A9);
                                                },
                                                child: A9.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A9",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 16),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: AppColors.defaultColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A10,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A10);
                                                },
                                                child: A10.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A10",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A11,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A11);
                                                },
                                                child: A11.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A11",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A12,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A12);
                                                },
                                                child: A12.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A12",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 350,
                              width: 1,
                              decoration: const BoxDecoration(
                                color: Colors.black54,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 16),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: AppColors.defaultColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A13,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A13);
                                                },
                                                child: A13.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A13",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A14,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A14);
                                                },
                                                child: A14.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A14",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A15,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A15);
                                                },
                                                child: A15.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A15",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 16),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: AppColors.defaultColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A16,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A16);
                                                },
                                                child: A16.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A16",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A17,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A17);
                                                },
                                                child: A17.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A17",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A18,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A18);
                                                },
                                                child: A18.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A18",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 16),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: AppColors.defaultColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A19,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A19);
                                                },
                                                child: A19.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A19",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A20,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A20);
                                                },
                                                child: A20.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A20",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A21,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A21);
                                                },
                                                child: A21.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A21",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 16),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: AppColors.defaultColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A22,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A22);
                                                },
                                                child: A22.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A22",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A23,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A23);
                                                },
                                                child: A23.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A23",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                          ValueListenableBuilder<bool>(
                                            valueListenable: A24,
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.toggleSwitch(A24);
                                                },
                                                child: A24.value
                                                    ? Image.asset(
                                                        AppImages.carIcon,
                                                        width: 28,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        // width: 28,
                                                        // height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.green,
                                                        ),
                                                        child: Text(
                                                          "A24",
                                                          style: AppFonts
                                                              .openSansMedium500(
                                                            14,
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Reserve spot for another time",
                        style: AppFonts.regular(
                          16,
                          const Color(0xFF757F8C),
                        ),
                      ),
                      Transform.scale(
                        scale: 1.2,
                        child: Switch(
                          activeColor: AppColors.defaultColor,
                          value: _switchValue,
                          onChanged: (bool value) {
                            setState(() {
                              _switchValue = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleButton(
                    titleButton: "Continue",
                    color: const Color(0XFF613EEA),
                    onPressed: () {},
                  ),
                ],
              ),
              _isDrawer
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blueGrey,
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.5),
                            Container()
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      );
    });
  }
}
