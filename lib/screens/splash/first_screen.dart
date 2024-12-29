import 'package:datn_van_vanh/res/colors/app_colors.dart';
import 'package:datn_van_vanh/res/fonts/app_fonts.dart';
import 'package:datn_van_vanh/res/images/app_images.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Image.asset(
            AppImages.logo,
            width: 160,
            height: 160,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Your no.1 parking assistant",
            style: AppFonts.openSansMedium500(
              18,
              AppColors.blackText,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            AppImages.backgroundImage,
          ),
        ],
      ),
    );
  }
}
