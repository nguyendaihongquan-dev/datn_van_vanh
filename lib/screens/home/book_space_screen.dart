import 'package:datn_van_vanh/res/colors/app_colors.dart';
import 'package:datn_van_vanh/res/fonts/app_fonts.dart';
import 'package:datn_van_vanh/res/images/app_images.dart';
import 'package:datn_van_vanh/widget/simple_button.dart';
import 'package:flutter/material.dart';

class BookSpaceScreen extends StatefulWidget {
  const BookSpaceScreen({super.key});

  @override
  State<BookSpaceScreen> createState() => _BookSpaceScreenState();
}

class _BookSpaceScreenState extends State<BookSpaceScreen> {
  double _currentValue = 0;
  bool _switchValue = false;
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
            const SizedBox(
              height: 50,
            ),
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
              height: 30,
            ),
            Center(
              child: Text(
                "Space 4c",
                style: AppFonts.openSansBold700(
                  16,
                  AppColors.defaultColor,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
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
                  Text(
                    "Estimate Duration",
                    style: AppFonts.openSansMedium500(
                      16,
                      const Color(0xFF757F8C),
                    ),
                  ),
                  Slider(
                    value: _currentValue,
                    min: 0,
                    max: 24,
                    activeColor: AppColors.defaultColor,
                    inactiveColor: AppColors.defaultText,
                    label: _currentValue.toInt().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentValue = value;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Check-in Time:",
                        style: AppFonts.openSansMedium500(
                          16,
                          const Color(0xFF757F8C),
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AppImages.editIcon,
                            width: 20,
                            height: 20,
                          ),
                          Text(
                            "11:00 am",
                            style: AppFonts.openSansMedium500(
                              16,
                              const Color(0xFF3B414B),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 2,
                    color: const Color(0xffa6aab499),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Specifications",
                    style: AppFonts.openSansMedium500(
                      16,
                      const Color(0xFF3B414B),
                    ).copyWith(fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AppImages.disableIcon,
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Disabled Parking",
                        style: AppFonts.openSansMedium500(
                            16, const Color(0XFFCCCCCC)),
                      ),
                      const Spacer(),
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
                  Row(
                    children: [
                      Image.asset(
                        AppImages.protectIcon,
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Request Special Guard ("/\$"/10)',
                        style: AppFonts.openSansMedium500(
                            16, const Color(0XFFCCCCCC)),
                      ),
                      const Spacer(),
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
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SimpleButton(
              titleButton: "Book Space",
              color: const Color(0XFF613EEA),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
