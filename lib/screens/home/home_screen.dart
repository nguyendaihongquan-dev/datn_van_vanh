import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datn_van_vanh/app/app_routers.dart';
import 'package:datn_van_vanh/provider/loading_provider.dart';
import 'package:datn_van_vanh/provider/manager_provider.dart';
import 'package:datn_van_vanh/provider/user_provider.dart';
import 'package:datn_van_vanh/res/colors/app_colors.dart';
import 'package:datn_van_vanh/res/fonts/app_fonts.dart';
import 'package:datn_van_vanh/res/images/app_images.dart';
import 'package:datn_van_vanh/screens/home/service.dart';
import 'package:datn_van_vanh/widget/loading_widget.dart';
import 'package:datn_van_vanh/widget/simple_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
  int availableCount = 0;
  int totalSlots = 24;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ParkingSlotService _parkingSlotService = ParkingSlotService();
  bool _isLoading = true;
  void getDeviceToken() async {
    await Firebase.initializeApp();
    String? token = await FirebaseMessaging.instance.getToken();
    print("FCM Token: $token");
    await saveTokenToFirestore(token!);
  }

  Future<void> saveTokenToFirestore(String token) async {
    try {
      CollectionReference notiRef =
          FirebaseFirestore.instance.collection("noti");

      await notiRef.doc(token).set({
        "token": token,
        "createdAt": FieldValue.serverTimestamp(),
      });

      print("✅ Token đã được lưu vào Firestore!");
    } catch (e) {
      print("❌ Lỗi khi lưu token vào Firestore: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getDeviceToken();
    _parkingSlotService.availableSlotsStream.listen((count) {
      setState(() {
        availableCount = count;
      });
    });
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
                            "$availableCount slots Available",
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
                                            valueListenable:
                                                _parkingSlotService.slots[0],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  manage.updateSpace(1);
                                                  Navigator.pushNamed(
                                                    // ignore: use_build_context_synchronously
                                                    context,
                                                    AppRouters.bookSpaceScreen,
                                                  );
                                                },
                                                child: _parkingSlotService
                                                        .slots[0].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[1],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {},
                                                child: _parkingSlotService
                                                        .slots[1].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[2],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {},
                                                child: _parkingSlotService
                                                        .slots[2].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[3],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {},
                                                child: _parkingSlotService
                                                        .slots[3].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[4],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {},
                                                child: _parkingSlotService
                                                        .slots[3].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[5],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A6);
                                                },
                                                child: _parkingSlotService
                                                        .slots[5].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[6],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A7);
                                                },
                                                child: _parkingSlotService
                                                        .slots[6].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[7],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A8);
                                                },
                                                child: _parkingSlotService
                                                        .slots[7].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[8],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A9);
                                                },
                                                child: _parkingSlotService
                                                        .slots[8].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[9],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A10);
                                                },
                                                child: _parkingSlotService
                                                        .slots[9].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[10],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A11);
                                                },
                                                child: _parkingSlotService
                                                        .slots[10].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[11],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A12);
                                                },
                                                child: _parkingSlotService
                                                        .slots[11].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[12],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A13);
                                                },
                                                child: _parkingSlotService
                                                        .slots[12].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[13],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A14);
                                                },
                                                child: _parkingSlotService
                                                        .slots[13].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[14],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A15);
                                                },
                                                child: _parkingSlotService
                                                        .slots[14].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[15],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A16);
                                                },
                                                child: _parkingSlotService
                                                        .slots[15].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[16],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A17);
                                                },
                                                child: _parkingSlotService
                                                        .slots[16].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[17],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A18);
                                                },
                                                child: _parkingSlotService
                                                        .slots[17].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[18],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A19);
                                                },
                                                child: _parkingSlotService
                                                        .slots[18].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[19],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A20);
                                                },
                                                child: _parkingSlotService
                                                        .slots[19].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[20],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A21);
                                                },
                                                child: _parkingSlotService
                                                        .slots[20].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[21],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A22);
                                                },
                                                child: _parkingSlotService
                                                        .slots[21].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[22],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A23);
                                                },
                                                child: _parkingSlotService
                                                        .slots[22].value
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
                                            valueListenable:
                                                _parkingSlotService.slots[23],
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // manage.toggleSwitch(A24);
                                                },
                                                child: _parkingSlotService
                                                        .slots[23].value
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
