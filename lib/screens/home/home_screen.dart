import 'package:datn_van_vanh/res/colors/app_colors.dart';
import 'package:datn_van_vanh/res/fonts/app_fonts.dart';
import 'package:datn_van_vanh/res/images/app_images.dart';
import 'package:datn_van_vanh/widget/simple_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).padding.top,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.drawerIcon,
              width: 22,
              height: 22,
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
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    ),
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    ),
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    )
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
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    ),
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    ),
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    )
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
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    ),
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    ),
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    )
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
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    ),
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    ),
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    )
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
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    ),
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    ),
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    )
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
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    ),
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    ),
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    )
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
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    ),
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    ),
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    )
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
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    ),
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    ),
                                    Image.asset(
                                      AppImages.carIcon,
                                      width: 28,
                                      height: 28,
                                    )
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
      ),
    );
  }
}
